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


h_theta = X * theta;
h_minus_y = h_theta - y;
h_minus_y = h_minus_y .^2;
theta_ = theta.^2;
J = 1.0/m / 2 * sum(h_minus_y) + lambda/2 / m * (sum(theta_) - theta_(1,1));

grad_theta_0 = 1.0/m * sum((h_theta - y).* X(:,1));

idx = 2;
while idx <= size(X)(2)
	grad(idx,1) = 1.0/m * sum((h_theta - y).* X(:,idx)) + lambda/m * theta(idx,1);
	idx = idx + 1;
end

grad(1,1) = grad_theta_0;





% =========================================================================

grad = grad(:);

end
