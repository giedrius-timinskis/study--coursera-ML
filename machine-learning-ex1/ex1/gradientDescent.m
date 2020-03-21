function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %


    theta1 = theta(1);
    theta2 = theta(2);

    theta1Sum = 0;
    for i = 1:m
        h = theta1 +  (theta2 * X(i, 2));
        hMinusY = h - y(i);
        theta1Sum = theta1Sum + hMinusY;
    end
    theta1result = theta1 - (alpha * 1/m) * theta1Sum; 
    
    
    theta2Sum = 0;
    for i = 1:m
        h = theta1 +  (theta2 * X(i, 2));
        hMinusY = h - y(i);
        result = hMinusY * X(i, 2);
        theta2Sum = theta2Sum + result;
    end
    theta2result = theta2 - (alpha * 1/m) * theta2Sum;
    
    theta = [theta1result; theta2result];
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end
end
