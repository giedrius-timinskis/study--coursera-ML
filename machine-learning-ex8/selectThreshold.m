function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;

stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions


% For most of these I read the instructions in this file + ex8.mlx
% As per directions, first get the predictions, comparing the prediction
% values with the current episol
predictions = pval < epsilon;

% Following formula
% True positive - how many we correctly predicted to be an anomaly
tp = sum((predictions == 1) & (yval == 1));
% False positive - how many we incorrectly attributed to be an anomaly
fp = sum((predictions == 1) & (yval == 0));
% False negative - how many we missed for being an anomaly
fn = sum((predictions == 0) & (yval == 1));

% Still following formula
prec = tp/(tp + fp);
rec = tp/(tp + fn);

% Finally, calculating the F1 - an indicator of how well we are doing in
% predicting anomalies with our current arguments

F1 = 2*prec*rec / (prec + rec);



    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
