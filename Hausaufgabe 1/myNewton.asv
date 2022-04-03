function [xZero, abortFlag, iters] = myNewton(varargin)
% myNewton - Approximate a zero crossing of the given function using
%            the Newton algorithm
%
% Syntax:  [xZero, abortFlag, iters] = myNewton(varargin)
%
% Inputs:
%    function - A function handle to the function you would like to know a
%               zero crossing of [mandatory]
%    derivative - The derivative of the function; can be calculated 
%                 if left out [optional]
%    startValue - The value where the algorithm starts [optional]
%    maxIter - After how many maximum iterations the algorithm should stop
%              [optional]
%    feps - What value is close enough to zero for you to count as a zero
%           crossing [optional]
%    xeps - What change in the x-value is insignificant enough for you to
%           say that the zero crossing has been found [optional]
%    livePlot - Whether a plot should be drawn that shows the development
%               of the y- and x-values over the course of the iterations;
%               either 'on' or 'off [optional]
%
% Outputs:
%    xZero - The calculated x-value of the zero crossing
%    abortFlag - Which cause lead to the abortion of the algorithm
%    iters - After how many iterations the algorithm was aborted
%
% Example: 
%    myNewton('function', @myPoly, 'derivative', @dMyPoly)
%    myNewton('function', @myPoly, 'feps', 0.05, 'xeps', 0.00005)
%    myNewton('function', @myPoly, 'startValue', 3, 'maxIter', 1000)
%    myNewton('function', @myPoly, 'livePlot', 'on')
%
% Other m-files required: myPoly.m, dmyPoly.m, numDiff.m
% Subfunctions: none
% MAT-files required: none
%
% See also: myPoly,  dmyPoly, numDiff

% Authors: Jannik Wiessler, Frederik Esau
% email: inf20092@lehre.dhbw-stuttgart.de
% April 2022; Last revision: 02-April-2022

%------------- BEGIN CODE --------------
%% do the varargin
for i = 1:nargin
    if strcmp(varargin{i},'function')
        func = varargin{i+1};
    elseif strcmp(varargin{i},'derivative')
        dfunc = varargin{i+1};
    elseif strcmp(varargin{i},'startValue')
        x0 = varargin{i+1};
    elseif strcmp(varargin{i},'maxIter')
        maxIter = varargin{i+1};
    elseif strcmp(varargin{i},'feps')
        feps = varargin{i+1};
    elseif strcmp(varargin{i},'xeps')
        xeps = varargin{i+1};
    elseif strcmp(varargin{i},'livePlot')
        livePlot = varargin{i+1};   
    end
end
%% check for necessary parameters
if ~exist('func','var')
    error('No valid function');
end

if ~exist('dfunc','var')
    answer = questdlg('Which approximation method for df(x)?', 'Approximation Method', ...
        'Forward Differences', 'Backward Differences', 'Central Differences', ...
        'Forward Differences');
    if(strcmp(answer,'')) % if e.g. the x-Button is pressed
        answer = 'Forward Differences';
        disp('No input given, value is set to Forward Differences');
    end
    disp(['Using ',answer]);
    % anonymous function; so that dfunc can be called by one value even
    % if the derivative is not given.
    % Looked this up in the function handle documentation of matlab.
    dfunc = @(x) numDiff(func, x, answer);
end    

if ~exist('x0','var')
    x0 = 0;
    disp(['Using default startvalue: x0 = ',num2str(x0)]);
end

if ~exist('maxIter','var')
    maxIter = 50;
    disp(['Using default maximum iterations: maxIter = ',num2str(maxIter)]);
end

if ~exist('feps','var')
    feps = 1e-6;
    disp(['Using default Feps: feps = ',num2str(feps)]);
end

if ~exist('xeps','var')
    xeps = 1e-6;
    disp(['Using default Xeps: xeps = ',num2str(xeps)]);
end

if ~exist('livePlot','var')
    livePlot = 'off';
    disp(['Using default live Plot: livePlot = ','off']);
end
%% start of algorithm
if strcmp(livePlot,'on')
   h = figure('Name','Newton visualization');
   ax1 = subplot(2,1,1);
   plot(ax1,0,x0,'bo');
   ylabel('xValue');
   hold on;
   grid on;
   xlim('auto')
   ylim('auto')
   ax2 = subplot(2,1,2);
   semilogy(ax2,0,func(x0),'rx');
   xlabel('Number of iterations')
   ylabel('Function value');
   hold on;
   grid on;
   xlim('auto')
   ylim('auto')
end
xOld = x0;
abortFlag = 'maxIter';
for i = 1:maxIter
    f = func(xOld);
    if abs(f) < feps
        abortFlag = 'feps';
        break;
    end
    df = dfunc(xOld);
    if df == 0
        abortFlag = 'df = 0';
        break;
    end
    xNew = xOld - f/df; 
    if abs(xNew-xOld) < xeps
        abortFlag = 'xeps';
        break;
    end
    xOld = xNew;
    if strcmp(livePlot,'on')
       plot(ax1,i,xNew,'bo');
       semilogy(ax2,i,func(xNew),'rx');
       pause(0.05);
    end
end
iters = i;
xZero = xNew;
end