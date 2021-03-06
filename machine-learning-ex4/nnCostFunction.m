function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%


%  NOTE: This is a 'Doing it the hard way' implementation.
%  I could've used a vectorised implementation but I wanted to understand
%  how every step works better and a for loop is just much easier to follow

% Adding a column of 1s (bias units), as per instructions
XX = [ones(m, 1), X];

% ======= 1.3 CALCULATE UNREGULARISED J ========
% Function for calculating h
function [h, z2, a1, a2] = hypothesisFn(index)
    % This logic is copied from week 3 predict.m file
    % Just updated to work with a for loop
    a1 = XX(index, :);
    z2 = a1 * Theta1';
    a2 = sigmoid(z2);
    a2 = [1, a2];
    z3 = a2 * Theta2';
    h = sigmoid(z3);
end

function vec = getLabelInBinary(index)
    vec = zeros(1, num_labels);
    vec(y(index)) = 1;
end

hSum = 0;
for i = 1:m
    % calculate h for the current training sample
    [h] = hypothesisFn(i);
    % Following the instruction "we need to recode the labels as vectors
    % containing only values 0 or 1"
    % So if possible training labels would be 1-3
    % 1 -> [1, 0, 0]. 2 -> [0, 1, 0]. Etc...
    yBinaryVector = getLabelInBinary(i);
    % Use the cost function to calculate result for the training sample
    result = (-yBinaryVector .* log(h)) - (1 - yBinaryVector) .* log(1 - h);
    hSum = hSum + result;
end

mSum = sum(hSum);
unregularisedJ = 1/m * mSum;



% ======= 1.4 CALCULATE REGULARISED J ========
function result = regulariseTheta(theta)
    % Square every value except first column (which is the bias unit)
    % THEN
    % Sum rows and columns into a single value
    result = sum((theta(:, 2:end) .^ 2), 'all');
end

jRegularisation = lambda/(2*m) * (regulariseTheta(Theta1) + regulariseTheta(Theta2)); 

J = unregularisedJ + jRegularisation;


% ======= 2.3 BACKPROPAGATION ========

for t = 1:m
    yInBinary = getLabelInBinary(t);
    
    % Step 1
    % Perform a feedforward pass
    [a3Values, z2, a1, a2] = hypothesisFn(t);
    
    % Step 2
    % Calculate deltas for each output layer (l3)
    delta3 = a3Values - yInBinary;
    delta3 = delta3';

    % Step 3
    % Calculate deltas for hidden layer (l2)
                                    % Add bias unit as per instructions
    delta2 = (Theta2' * delta3) .* [1; sigmoidGradient(z2')];
    delta2 = delta2(2:end); % Remove bias unit as per instructions


    % Step 4
    % Add to accumulated gradients
                 % grad(l)  +   delta(l+1) * a(l)T
    Theta1_grad = Theta1_grad + delta2 * a1; % No idea why transposing a doesn't work here
    Theta2_grad = Theta2_grad + delta3 * a2; % No idea why transposing a doesn't work here
end

% Step 5
% Obtain unregularized gradient
Theta1_grad = 1/m * Theta1_grad;
Theta2_grad = 1/m * Theta2_grad;


% ======= 2.5 ADD REGULARISATION TO NEUTRAL NETWORK ========
% First replace first column with zero to avoid regularising the bias (as per
% instructions)
Theta1GradWithoutBias = [zeros(size(Theta1, 1), 1), Theta1(:, 2:end)];
Theta2GradWithoutBias = [zeros(size(Theta2, 1), 1), Theta2(:, 2:end)];

Theta1Regularisation = (lambda/m) * Theta1GradWithoutBias;
Theta2Regularisation = (lambda/m) * Theta2GradWithoutBias;

Theta1_grad = Theta1_grad + Theta1Regularisation;
Theta2_grad = Theta2_grad + Theta2Regularisation;






% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
