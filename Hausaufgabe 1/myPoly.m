function y = myPoly(x)
% myPoly - A one-dimensional mathematical function that can return its value 
%          at a given x
%
% Syntax:  y = myPoly(x)
%
% Inputs:
%    x - the x you would like to know the f(x) of
%
% Outputs:
%    y - the y value associated in the function which the given x
%
% Example: 
%    myPoly(3)
%
% Other m-files required: none
% Subfunctions: none
% MAT-files required: none
%
% See also: dmyPoly, numDiff, myNewton
%
% Authors: Jannik Wiessler, Frederik Esau
% email: inf20092@lehre.dhbw-stuttgart.de
% April 2022; Last revision: 05-April-2022

%------------- BEGIN CODE --------------
y = (x-3)^2;
% y = (x^2-3*x+3)/(x^3-10)+0.5; % another function you can try
end
