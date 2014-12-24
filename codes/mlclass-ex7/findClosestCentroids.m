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

X_row = size(X,1);
X_col = size(X,2);

for X_iter = 1:X_row
	min_idx = 1;
	vector_1 = X(X_iter,:);
	vector_y = centroids(1,:);
	min_dis = norm(vector_1 - vector_y,2);
	for k_idx = 2:K
		vector_y = centroids(k_idx,:);
		cur_dis = norm(X(X_iter,:) - vector_y,2);
		if cur_dis < min_dis
			min_idx = k_idx;
			min_dis = cur_dis;
		end
	end

	idx(X_iter) = min_idx;
end


	

end



% =============================================================

end

