%%%% load the train and test data (both are normalized)
load pima_train.txt;
load pima_test.txt;
tr_data = pima_train;
test_data = pima_test;

data_col= size(tr_data,2);
n_features = data_col - 1;

%%% create x
x = tr_data(:,1:n_features);
%% create y vector
y=tr_data(:,data_col);
 
%% builds x for the the test set
x_test = test_data(:,1:n_features);
%% builds y vector for the test set
y_test=test_data(:,data_col);

% initial population
s1 = Sample; % include base example
s2 = Sample;
s2.rand_sample
s3 = Sample;
s3.rand_sample
s4 = Sample;
s4.rand_sample
s5 = Sample;
s5.rand_sample

s = [s1,s2,s3,s4,s5];

for t = 1:20
class_error_train = [];
for c = 1:5

w = s(1,c);
%%% builds neural network with a sigmoidal output function
%%% to be trained with the gradient method
net=patternnet(w.hidden_layers);
%view(net)

%% sets the parameters of the NN model
%% see the NN toolbox documentation

%%% use conjugate gradient to train the model
net.trainFcn='trainscg';

net.trainParam.epochs = w.num_epochs;
net.trainParam.show = 10;
net.trainParam.max_fail=1500;
net.trainParam.min_grad=1e-10;

%%% training of the neural net
[net, tr] = train(net,x',y'); 

%% runs learned network on inputs in x (training set)
res=net(x');
%%% mean classification error on the training data
class_error_train=[class_error_train,sum(abs(y-round(res)'))/size(res,2)];

end
[m,i] = min(class_error_train);
s1 = s(1,i);
s2 = copy(s1);
s2.rand_sample;
s3 = copy(s1);
s3.rand_sample;
s4 = copy(s1);
s4.rand_sample;
s5 = copy(s1);
s5.rand_sample;
s = [s1,s2,s3,s4,s5];

end