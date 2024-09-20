function [X_norm, mu, sigma] = featureNormalize(X)
    % FEATURENORMALIZE Normalizes the features in X
    %   FEATURENORMALIZE(X) returns a normalized version of X where
    %   the mean value of each feature is 0 and the standard deviation
    %   is 1. This is often a good preprocessing step when working with 
    %   learning algorithms.

    % Initialize the normalized version of X, and vectors for mean and standard deviation
    X_norm = X;
    mu = zeros(1, size(X, 2));
    sigma = zeros(1, size(X, 2));

    % Compute the mean and standard deviation for each feature
    mu = mean(X); % Row vector of the mean of each feature
    sigma = std(X); % Row vector of the standard deviation of each feature

    % Normalize each feature
    for j = 1:size(X, 2)
        X_norm(:, j) = (X(:, j) - mu(j)) / sigma(j); % Normalize each feature column
    end
end
