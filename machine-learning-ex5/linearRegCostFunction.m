function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%


% I copied this from Week 1/2 Implementations
predictions = X*theta;
sqrErrors = (predictions - y).^2;
nonRegularisedJ = 1/(2*m) * sum(sqrErrors);
regularisationTerm = lambda/(2*m) * sum(theta(2:end) .^ 2); % Dont regularise the first one, as per formula
J = nonRegularisedJ + regularisationTerm;


%%% Also copied from Week 2 *BigBrain* %%%
gradientFn = 1/m * sum((predictions - y) .* X);
regularisedGradientFnAddition = lambda/m * theta';
grad = gradientFn + regularisedGradientFnAddition;
grad(1) = gradientFn(1); % Dont regularise the first one, as per formula
% =========================================================================

grad = grad(:);

end
