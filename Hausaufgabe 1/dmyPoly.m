function y = dmyPoly(x)
% dmyPoly - A one-dimensional mathematical function that can return its value 
%          at a given x; intended as the derivative of the function myPoly
%
% Inputs:
%    x - the x you would like to know the df(x) of
%
% Outputs:
%    y - the y value associated in the function which the given x
%
% Example: 
%    dmyPoly(3)
%
% Other m-files required: myPoly.m
% Subfunctions: none
% MAT-files required: none
%
% See also: myPoly, dmyPoly, numDiff, myNewton

% Author: Jannik Wiessler, Frederik Esau
% email: inf20092@lehre.dhbw-stuttgart.de
% April 2022; Last revision: 02-April-2022
y = 2*(x-3);
end