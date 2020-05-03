function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%


possibleParameters = [0.01 0.03 0.1 0.3 1 3 10 30];
numberOfParameters = length(possibleParameters);

% Will store the results here. The total number of variations for rows,
% columns for values of c, sigma, and predictionError
% e.g. [c:0.01, sigma: 0.03, predictionError: 0.400]
results = zeros(numberOfParameters*numberOfParameters, 3);
% There's probably a better way of tracking which index to insert to, but
% this does the job
currentIteration = 0;
for cParam = 1:numberOfParameters
    currentCParam = possibleParameters(cParam);
   for sigmaParam = 1:numberOfParameters
       currentIteration = currentIteration + 1;
       currentSigmaParam = possibleParameters(sigmaParam);

       % copied this over from ex6.mlx
       model = svmTrain(X, y, currentCParam, @(x1, x2) gaussianKernel(x1, x2, currentSigmaParam)); 
       predictions = svmPredict(model, Xval);
       % copied this bad boy from the Note: above
       predictionError = mean(double(predictions ~= yval));
       
       results(currentIteration, :) = [currentCParam, currentSigmaParam, predictionError];
   end
end

% Find the index of c + sigma combination which had the lowest prediction
% error
[~, index] = min(results(:, 3));
C = results(index, 1);
sigma = results(index, 2);


% =========================================================================

end
