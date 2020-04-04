function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

%%% Copied over from regular costFunction for reference %%%
calculatedSigmoid = sigmoid(X*theta); % This calculates h0(x(i))

%%% Copied over from regular costFunction %%%
costFn = -y .* log(calculatedSigmoid) - (1 - y) .* log(1 - calculatedSigmoid);
regularisedCostFnAddition = lambda/(2*m) * sum(theta(2:end) .^ 2); % Dont regularise the first one, as per formula
J = 1/m * sum(costFn) + regularisedCostFnAddition;

%%% Copied over from regular costFunction %%%
gradientFn = 1/m * sum((calculatedSigmoid - y) .* X);
regularisedGradientFnAddition = lambda/m * theta';
grad = gradientFn + regularisedGradientFnAddition;
grad(1) = gradientFn(1); % Dont regularise the first one, as per formula
% =============================================================

end
