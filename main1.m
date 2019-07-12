% load train and test data from text files
train = importdata('pima_train.txt');
test = importdata('pima_test.txt');
% splits train into attributes and target
train_X = train(:,1:8);
train_Y = train(:,9);
% splits test into attributes and target
test_X = test(:,1:8);
test_Y = test(:,9);
% adds left-most column of 1s to attributes
col_ones = ones(size(train_X, 1), 1);
train_X = horzcat(col_ones, train_X);
col_ones = ones(size(test_X, 1), 1);
test_X = horzcat(col_ones, test_X);
% utilize the modified SVM solver from Mangasarian and Musicant
[w,b] = svml(train_X,train_Y,1)
% utilize the apply_svlm function do determine predictions for the training
% and testing sets
train_p = [];
test_p = [];
for c = 1:size(train_X,1)
    train_p = [train_p;apply_svlm(train_X(c,:),w,b)];
end
for c = 1:size(test_X,1)
    test_p = [test_p;apply_svlm(test_X(c,:),w,b)];
end
% create the train and test confusion matrices (among other stats)
% training data
train_cm = build_binary_cm(train_p,train_Y)
train_mce = misclassification(train_cm)
train_sens = sensitivity(train_cm)
train_spec = specificity(train_cm)
% testing data
test_cm = build_binary_cm(test_p,test_Y)
test_mce = misclassification(test_cm)
test_sens = sensitivity(test_cm)
test_spec = specificity(test_cm)