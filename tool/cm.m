%--------signal copy n times------
% Author: zeal
% Date  : 2019.07.10
% cm:center of mass
%---------------------------------

function [cm_x,cm_y] = cm(y)
%signal_in : a signal in a size of 1xn or nx1
%times     : integer

x       = (1:length(y));
x_sum   = sum(x);
y_sum   = sum(y);
S       = sum((y.*x));

cm_x   = S/y_sum;
cm_y   = S/x_sum;
