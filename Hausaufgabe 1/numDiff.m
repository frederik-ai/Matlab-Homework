function df = numDiff(func, x, Method)
% numDiff - Approximate the value of the differential equation of a given 
%           function at a given x-value
%
% Syntax:  df = numDiff(func, x, Method)
%
% Inputs:
%    func - function handle to the function you would like to know the
%           value of the differential equation at x of
%    x - the specific x-value of the differential equation
%    Method - the approximation method you would like to be used;
%             either 'Forward Differences', 'Backward Differences' or 
%             'Central Differences'; possible short forms are e.g. 
%             'f', 'b' and 'c'
%
% Outputs:
%    df - the value of the differential equation of func at x
%
% Example: 
%    df(@myPoly, 5, 'Forward Differences')
%    df(@myPoly, 5, 'f')
%    df(@myPoly, 5, 'F')
%
% Other m-files required: a mathematical function to create a handle to
%                         e.g. myPoly.m
% Subfunctions: none
% MAT-files required: none
%
% See also: myPoly, myNewton

% Author: Frederik Esau
% email: inf20092@lehre.dhbw-stuttgart.de
% April 2022; Last revision: 02-April-2022

%------------- BEGIN CODE --------------
%% set the used equation and the value of h according do the given 'Method'
%  the equation is saved as an anonymous function
switch Method
    case {'Forward Differences', 'f', 'F', 'v', 'V', 'Vorwärtsdifferenzen'}
        h = 10^(-8);
        equation = @(func_, x_) (func_(x_+h) - func_(x_))/h;
    case {'Backward Differences', 'b', 'B', 'r', 'R', 'Rückwärtsdifferenzen'}
        h = 10^(-8);
        equation = @(func_, x_) (func_(x_) - func(x_-h))/h;
    case {'Central Differences', 'c', 'C', 'z', 'Z', 'Zentraldifferenzen'}
        h = 10^(-6);
        equation = @(func_, x_) (func_(x_+h) - func(x-h))/(2*h);
    otherwise
        error("Invalid approximation method supplied.");
end
%% calculate the actual approximate value of df(x)
df = equation(func, x);
end