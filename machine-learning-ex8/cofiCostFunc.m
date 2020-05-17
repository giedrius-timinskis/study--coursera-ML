function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

% Cost function without regularization.
% Note that I am following the formula and a tip given in implementation
%   note of 2.2.1.
% I also had to switch positions of Theta' * X to deviate from the given
%   formula, because it was throwing an error the other way around.
% I am not sure why I had to sum the results of the cost function, but it
%   works ¯\_(?)_/¯
M = (X * Theta' - Y) .^ 2;
J = sum(1/2 * sum(R .* M));

% Gradients - without regularization
% Note for the reader: don't be stupid like me and reuse M from the cost
%   function, because this one is NON squared :|
gradientM = (R .* (X * Theta' - Y));
X_grad =  gradientM * Theta;
% No idea why I had to transpose here, but that's the only way I could get
%   the 'Matrix dimensions must agree.'
Theta_grad = gradientM' * X;


% Cost function - Regularised
% Just following the formula, this one is pretty easy
J = J + (lambda/2 * sum(sum(Theta .^ 2))) + (lambda/2 * sum(sum(X .^ 2)));

% Gradients - regularised
% Again, just following the formula, nothing fancy here
X_grad = X_grad + lambda * X;
Theta_grad = Theta_grad + lambda * Theta;

% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
