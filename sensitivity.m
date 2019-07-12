function sens = sensitivity(cm)
% takes an input of a binary confusion matrix and returns the sensitivity
sens = (cm(1,1))/(cm(1,1)+cm(2,1));
end

