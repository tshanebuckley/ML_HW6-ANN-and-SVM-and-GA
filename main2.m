y = [0,1,2,3,5,10]; % number of layers
train_x = [0.2430,0.2319,0.2208,0.2208,0.2356,0.2375];
test_x = [0.2227,0.2052,0.2402,0.2009,0.2356,0.2489];
figure()
hold on
plot(y,train_x);
plot(y,test_x);
title('Classification Error vs # of Hidden Layers');
xlabel('Classification Error');
ylabel('# of Hidden Layers');
legend('train','test');
hold off