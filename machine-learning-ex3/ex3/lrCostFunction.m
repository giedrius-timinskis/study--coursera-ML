function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Compute cost and gradient for logistic regression with 
%regularization
%   J = LRCOSTFUNCTION(theta, X, y, lambda) computes the cost of using
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
%
% Hint: The computation of the cost function and gradients can be
%       efficiently vectorized. For example, consider the computation
%
%           sigmoid(X * theta)
%
%       Each row of the resulting matrix will contain the value of the
%       prediction for that example. You can make use of this to vectorize
%       the cost function and gradient computations. 
%
% Hint: When computing the gradient of the regularized cost function, 
%       there are many possible vectorized solutions, but one solution
%       looks like:
%           grad = (unregularized gradient for logistic regression)
%           temp = theta; 
%           temp(1) = 0;   % because we don't add anything for j = 0  
%           grad = grad + YOUR_CODE_HERE (using the temp variable)
%



% All of this I copied over from Exercise 2 regularised cost function
calculatedSigmoid = sigmoid(X*theta); % This calculates h0(x(i))

costFn = -y .* log(calculatedSigmoid) - (1 - y) .* log(1 - calculatedSigmoid);
regularisedCostFnAddition = lambda/(2*m) * sum(theta(2:end) .^ 2); % Dont regularise the first one, as per formula
J = 1/m * sum(costFn) + regularisedCostFnAddition;

gradientFn = 1/m * sum((calculatedSigmoid - y) .* X);
regularisedGradientFnAddition = lambda/m * theta';
grad = gradientFn + regularisedGradientFnAddition;
grad(1) = gradientFn(1); % Dont regularise the first one, as per formula




% =============================================================

grad = grad(:);

end
