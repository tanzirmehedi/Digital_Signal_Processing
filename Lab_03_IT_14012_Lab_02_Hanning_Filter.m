%SK. Tanzir Mehedi Shawon
%IT-14012
%Department of ICT, MBSTU

clc;
clear all;
close all;

N=input('Input the length of the filter: ');  
f=input('Input the passband cut-off frequency in radians: ');

range=fp/(2*pi);

Window = hanning(N+1); % hamming computes a length N+1 window and returns the first N points.
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

