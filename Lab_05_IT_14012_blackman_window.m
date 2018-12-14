
% SK. tanzir Mehedi Shawon
% IT-14012
% Department of ICT, MBSTU

%w(n)=0.42-0.5cos(2*pi*n/N-1)+0.08cos(4pin/N-1),?0<=nM<=1
                 %where M is N/2 for N even and (N + 1)/2 for N odd.

clc;
clear all;
close all;

N=input('Input the length of the filter: ');
passband = input('Input the passband: ') ;  % 1/(2*pi)
stop_band = input('Input the stop band: ');   % 2/(2*pi)

range=[(passband/(2*pi)) (stop_band/(2*pi))];

Window = blackman(N+1); % hamming computes a length N+1 window and returns the first N points.
filter = fir1(N,range,Window); % Window-based FIR filter design , designs a lowpass, highpass, bandpass, bandstop, or multiband 

normalized_frequency = 0:0.1:1;
[x,y] = freqz(filter,1,normalized_frequency); %Frequency response of filter, freqz returns the frequency response based on the current filter coefficients
gain_db = 20*log10(abs(x));   
phase_radians = angle(x);

subplot(2,1,1);
plot(normalized_frequency,gain_db);
ylabel('Gain in DB');
xlabel('Normalized Frequency');
title('Magnitude Plot');
grid on;

subplot(2,1,2);
plot(normalized_frequency,phase_radians);
ylabel('Phase in radians');
xlabel('Normalized Frequency');
title('Phase Response');
grid on;
