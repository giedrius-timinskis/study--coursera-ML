function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%


% For every training example, we need to find how close it is to a given
% centroid
for currTrainingExampleI = 1:length(X)
    
    % We will apply a calculation for every centroid to calculate the
    % distance between the training example and the deltoid coordinates
    distancesToCentroids = zeros(K, size(X, 2));
    for currCentroidI = 1:K
        distance = (X(currTrainingExampleI, :) - centroids(currCentroidI, :)) .^ 2;
        distancesToCentroids(currCentroidI, :) = distance;
    end
    
    % Once we have the distances between the coordinates calculated, find
    % the index of the centroid that is closest to the training example
    [~, closestCentroidIndex] = min(sum(distancesToCentroids, 2));
    
    idx(currTrainingExampleI) = closestCentroidIndex;
end

% =============================================================

end

