% defining a function
% returns one value which will be saved in variable y
function y = squareThisNumber(x)
    y = x^2;

% PROTIP
% if a file returns only one function you can call it directly
% in this example - functions(2)


% You can return multiple vars from a function:
function [a,b] = squareAndCubeThisNumber(x)
    a = x^2;
    b = x^3;


X = [1 1; 1 2; 1 3];
y = [1; 2; 3];
theta = [0;1];
% a more advanced function example
function J = costFunction(X, y, theta)
% X is the "design matrix" containing our training examples
% y is the class labels
m = size(X, 1); % number of training examples
predictions = X*theta; % predictions of hypothesis on all m examples
sqrErrors = (predictions - y).^2; % squared errors
J = 1/(2*m) * sum(sqrErrors);

j = costFunction(X,y,theta)