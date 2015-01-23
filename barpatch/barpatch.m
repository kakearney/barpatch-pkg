function [xp, yp] = barpatch(y)
%BARPATCH Returns the coordinates of the patches of a bar graph
%
% [xp, yp] = barpatch(y)
%
% This function calculates the coordinates of the patches composing a
% horizontal stacked bar graph of the matrix y, assuming 1 bar per row
% (even if a vector). 
%
% Input variables:
%
%   y:  nbar x nstack matrix of y values, where nbar is the number of bars
%       plotted, and nstack is the number of blocks making up each bar
%
% Output variables:
%
%   xp: x-coordinates of resulting patches. xp is a nbar x nstack cell
%       array, with each cell holding the 4 x 1 vector describing a single
%       block.  The patches in a column compose an entire bar.
%
%   yp: y-coordinates of resulting patches, with same format as xp.

nbar = size(y,1);
nstack = size(y,2);

if nbar == 1
    y = [y; nan(size(y))];
end

f = figure('visible', 'off');
h = barh('v6', y, 'stacked');
xp = get(h, 'xdata');
yp = get(h, 'ydata');
close(f);

if iscell(xp)
    xp = cell2mat(xp);
    yp = cell2mat(yp);
end

xp = mat2cell(xp, ones(nstack,1)*4, ones(nbar,1));
yp = mat2cell(yp, ones(nstack,1)*4, ones(nbar,1));


