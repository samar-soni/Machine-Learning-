function theta = gradientDescent(X, y, theta, alpha, iterations)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, iterations) updates theta by 
%   taking 'iterations' gradient steps with learning rate 'alpha'

    m = length(y); % number of training examples
    for i = 1:iterations
        h = X * theta; % hypothesis function
        gradient = (1/m) * (X' * (h - y)); % calculate the gradient
        theta = theta - alpha * gradient; % update theta
        
        % Display the cost every 100 iterations (optional)
        if mod(i, 100) == 0
            J = computeCost(X, y, theta);
            fprintf('Cost after iteration %d: %f\n', i, J);
        end
    end
end
