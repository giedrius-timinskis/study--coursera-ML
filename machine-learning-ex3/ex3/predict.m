function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%



% INPUT LAYER CALCULATIONS:
% First add column of 1s to X, as per instructions:
% "The matrix X contains the examples in rows. When you complete the code
% in predict.m, you will need to add the column of 1's to the matrix. T"
a1 = [ones(m, 1), X];

% Following the provided formulas

% HIDDEN LAYER CALCULATIONS:
% Note that a1 is just our data input
% INFO: Not sure why transposing of Theta1 is necessary here, but it's the
% only permutation that worked for me ¯\_(?)_/¯
z2 = a1 * Theta1';
% Pass through sigmoid to get weights
a2 = sigmoid(z2);

% OUTPUT LAYER CALCULATIONS
% Still following provided formulas
% Again, add a row of 1s per instructions
% INFO: I only noticed that it's needed by comparing size(a2) and
% size(Theta2)
a2 = [ones(m, 1), a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);

% Using the function provided in the HINT to get the biggest index for each
% row:
[~, p] = max(a3, [], 2);

% =========================================================================


end
