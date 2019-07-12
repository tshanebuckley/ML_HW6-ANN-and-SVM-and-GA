function [cm] = build_binary_cm(predicted,actual)
% takes inputs of two vectors, one the predicetd values the other the
% actual values and returns the confusion matrix of the given data
% initialize a 2by2 matrix 
cm = zeros(2,2); 
% get size of the vectors
n = size(actual,1);
% force predicted into binary values
for c = 1:n
    if predicted(c) >= 0.5
        predicted(c) = 1;
    else
        predicted(c) = 0;
    end
end
% create matrix
for c = 1:n
    if (actual(c) == predicted(c)) && (actual(c) == 1) % true positive
        cm(1,1) = cm(1,1) + 1;
    elseif (actual(c) == predicted(c)) && (actual(c) == 0) % true negative
        cm(2,2) = cm(2,2) + 1;
    elseif (actual(c) ~= predicted(c)) && (actual(c) == 0) % false positive
        cm(1,2) = cm(1,2) + 1;
    elseif (actual(c) ~= predicted(c)) && (actual(c) == 1) % false negative
        cm(2,1) = cm(2,1) + 1;
    end
end

