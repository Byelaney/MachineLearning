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


X = [ones(m, 1) X];
a_2 = sigmoid(X * Theta1');
a_2 = [ones(m,1) a_2];
h_theta = sigmoid(a_2 * Theta2');

y_matrix = eye(num_labels)(y,:);

minusy = 1 - y_matrix ;
head = y_matrix.*log(h_theta);
tail = minusy.*log(1-h_theta);
J_ = sum(head+tail,2);
J = sum(J_) * (-1)/m;

Theta1_= Theta1;
Theta1_(:,1) = [];
Theta2_ = Theta2;
Theta2_(:,1) = [];

Theta1_ = Theta1_.^2;
reg_head = sum(Theta1_,2);
reg_head = sum(reg_head);

Theta2_ = Theta2_.^2;
reg_tail = sum(Theta2_,2);
reg_tail = sum(reg_tail);

J = J + lambda/m * (reg_head+reg_tail)/2;

% -------------------------------------------------------------


d3 = h_theta - y_matrix;
Theta2_new = Theta2;
Theta2_new(:,1) = [];
d2 =  (d3 * Theta2_new).* sigmoidGradient(X * Theta1');

delta2 = d3' * a_2;
delta1 = d2' * X;

Theta1_grad = delta1/m;
Theta2_grad = delta2/m;


reg_grad_1 = lambda/m * Theta1;
reg_grad_1(:,1) = 0;
reg_grad_2 = lambda/m * Theta2;
reg_grad_2(:,1) = 0;


Theta1_grad = Theta1_grad + reg_grad_1;
Theta2_grad = Theta2_grad + reg_grad_2;




% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
