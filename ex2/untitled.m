function metrics = regression_metrics(ypred, yactual)
    % This function computes evaluation metrics for regression models.
    %
    % Parameters:
    % ypred (matrix): Predicted values
    % yactual (matrix): Actual values
    %
    % Returns:
    % struct: Structure containing various regression evaluation metrics

    % Ensure both matrices have the same number of elements
    if numel(ypred) ~= numel(yactual)
        error('The number of elements in ypred and yactual must be the same.');
    end

    % Reshape the inputs to column vectors if necessary
    ypred = ypred(:);
    yactual = yactual(:);

    % Calculate errors
    errors = ypred - yactual;

    % Calculate metrics
    mean_absolute_error = mean(abs(errors));
    mean_squared_error = mean(errors .^ 2);
    root_mean_squared_error = sqrt(mean_squared_error);
    root_mean_log_squared_error = sqrt(mean(log((ypred + 1) ./ (yactual + 1)).^2));

    % R-squared value
    ss_total = var(yactual) * (length(yactual) - 1);
    ss_residual = sum(errors .^ 2);
    r_squared = 1 - (ss_residual / ss_total);

    % Adjusted R-squared value
    n = length(yactual);  % Number of data points
    k = 1;                % Number of predictors (assuming one for simplicity)
    adjusted_r_squared = 1 - ((1 - r_squared) * (n - 1) / (n - k - 1));

    % Compile the results in a structure
    metrics = struct();
    metrics.MeanAbsoluteError = mean_absolute_error;
    metrics.MeanSquaredError = mean_squared_error;
    metrics.RootMeanSquaredError = root_mean_squared_error;
    metrics.RootMeanLogSquaredError = root_mean_log_squared_error;
    metrics.R2Value = r_squared;
    metrics.AdjustedR2Value = adjusted_r_squared;
end

% Example usage
ypred = [2.5; 0.0; 2.1; 1.8];
yactual = [3.0; -0.5; 2.0; 7.0];

metrics = regression_metrics(ypred, yactual);
disp(metrics);