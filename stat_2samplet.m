function tstat = stat_2samplet(X, Y, flag)
% stat_2samplet: Compute two-sample t-statistic between two groups.
%
% INPUTS:
%   X    : A matrix of size [n_X, m] representing data from the first group,
%          where n_X is the number of subjects in the first group,
%          and m is the number of measurements per subject.
%
%   Y    : A matrix of size [n_Y, m] representing data from the second group,
%          where n_Y is the number of subjects in the second group,
%          and m is the number of measurements per subject.
%
%   flag : A binary flag (0 or 1). If flag is 1, it assumes unequal variance between
%          the two groups (Welch's t-test). If flag is 0 or not provided, it assumes
%          equal variance (Student's t-test).
%
% OUTPUT:
%   tstat: A vector of size [1, m] containing the computed t-statistics for each measurement.
%
% The function calculates the t-statistic for comparing two groups with either equal or
% unequal variance assumptions. It is designed to work with data where multiple measurements
% are taken for each subject in the groups.

% (c) 2003- Moo K. Chung
% University of Wisconsin-Madison
% mkchung@wisc.edu
%
% Update history:
% 2003 July created
% 2023, Dec 31 modified

% Set default for flag if not provided
if nargin < 3
    flag = 0; % Assume equal variance by default
end

% Sample means and standard deviations
n_X = size(X, 1); % Number of subjects in group X
n_Y = size(Y, 1); % Number of subjects in group Y
mean_X = mean(X, 1); % Mean across subjects in group X
mean_Y = mean(Y, 1); % Mean across subjects in group Y

std_X = std(X, 0, 1); % Standard deviation across subjects in group X
std_Y = std(Y, 0, 1); % Standard deviation across subjects in group Y

% Variances
var_X = std_X.^2; % Variance in group X
var_Y = std_Y.^2; % Variance in group Y

% Numerator of t-statistic
numerator = mean_X - mean_Y; % Difference in means between the two groups

% Equal or unequal variance assumption
if flag == 1
    % Unequal variance (Welch's t-test)
    denominator = sqrt(var_X/n_X + var_Y/n_Y); % Denominator for unequal variances
    tstat = numerator ./ (denominator + 0.00001); % Welch's t-statistic
else
    % Equal variance (Student's t-test)
    var_pooled = ((n_X - 1) * var_X + (n_Y - 1) * var_Y) / (n_X + n_Y - 2); % Pooled variance
    denominator = sqrt(var_pooled * (1/n_X + 1/n_Y)); % Denominator for equal variances
    tstat = numerator ./ denominator; % Student's t-statistic
end
end