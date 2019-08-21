%---------------------------------------------
% Author: zeal
% Date  : 2019.07.21
% Detail: FFT plot
%--------------------------------------------

function fft_plot(signal_in,Fs,model)
%signal_in : a signal in a size of 1xn or nx1
%Fs        : sample rate,unit is MHz
N = length(signal_in);
s_fft = fft(signal_in);
abs_s = abs(s_fft);
%abs_s     = mag2db(abs_s);

if model == 1 
    freq=linspace(0,Fs/2 - Fs/N,N/2);
    plot(freq*1e-6,abs_s(1:N/2));
    xlabel('Frequence (Mhz)');ylabel('Power Spectrum (db)');
elseif model == 2
    freq=linspace(-Fs/2,Fs/2,N);
    plot(freq*1e-6,fftshift(abs_s));
    xlabel('Frequence (Mhz)');ylabel('Power Spectrum (db)');
elseif model == 3
    freq=linspace(0,Fs/2,N/2);
    plot3(freq*1e-6,real(s_fft(1:N/2)),imag(s_fft(1:N/2)));grid on
    xlabel('点数');ylabel('实部');zlabel('虚部');
else
    freq=linspace(-Fs/2,Fs/2,N);
    plot(freq*1e-6,fftshift(abs_s));
end
