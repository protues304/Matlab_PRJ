
%---------------------------------------------
% Author: zeal
% Date  : 2019.07.10
% Detail: Every data of signal repeat 'times'
%--------------------------------------------

function [signal_out] = signal_npoint(signal_in,times)
%signal_in : a signal in a size of 1xn or nx1
%times     : integer

signal_size = size(signal_in);
signal_row  = signal_size(1);

if signal_row == 1
    signal_ = signal_in;
else
    signal_ = signal_in';
end
   
sizes  = ones(times,1); 
signal_out = sizes*signal_;
signal_out = signal_out(:);
signal_out = signal_out';


