function y = apply_svlm(x,w,b)
% takes matrix of parameters x, vector of weights w, and a bias b and 
% returns a vector of predicted values y
x = x';
y = 0;
if (w')*(x) + b >= 0
    y = 1;
end
end

