function [J, grad] = costFunction(theta, X, y)
    % COSTFUNCTION Compute cost and gradient for logistic regression
    %   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
    %   parameter for logistic regression and the gradient of the cost
    %   w.r.t. the parameters.

    % Initialize some useful values
    m = length(y); % number of training examples
    grad= zeros(size(theta));
    % Compute the hypothesis using the sigmoid function
    h = sigmoid(X * theta);

    % Compute the cost function J
    J = (1 / m) * sum(-y .* log(h) - (1 - y) .* log(1 - h));

    % Compute the gradient
    grad = (1 / m) * (X' * (h - y));
    
end