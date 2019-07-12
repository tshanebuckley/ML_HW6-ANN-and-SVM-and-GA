function spec = specificity(cm)
% takes an input of a binary confusion matrix and returns the specificity
spec = (cm(2,2))/(cm(2,2)+cm(1,2));
end
