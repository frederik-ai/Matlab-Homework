% runMyNewton - A script that runs the function myNewton from myNewton.m
%               with exemplary values
%
% Inputs: none
%
% Outputs: none
%
% Example: 
%    runMyNewton
%
% Other m-files required: myPoly.m, dmyPoly.m, numDiff.m, myNewton.m
% Subfunctions: myNewton
% MAT-files required: none
%
% See also: myPoly, dmyPoly, numDiff, myNewton

% Author: Frederik Esau
% email: inf20092@lehre.dhbw-stuttgart.de
% April 2022; Last revision: 02-April-2022

%------------- BEGIN CODE --------------
myNewton('function', @myPoly)