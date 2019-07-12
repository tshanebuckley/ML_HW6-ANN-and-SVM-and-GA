function mce = misclassification(cm)
% takes an input of a binary confusion matrix and returns the mc error
mce = (cm(1,2)+cm(2,1))/(sum(sum(cm)));
end
