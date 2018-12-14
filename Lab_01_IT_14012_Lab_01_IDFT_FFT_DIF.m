
%SK. Tanzir Mehedi Shawon
%ID: IT-14012

clear all;
close all;
clc;
y=input('Enter the sequence x(k): ');
N=input('Enter the length of the DIF IDFT of DFT: ');
length_y=length(y);

if N>length_y
    y=[y zeros(1,N-length_y)];
elseif N<length_y
    y=y(1:N);
end

W=zeros(N,N);
for n=0:N-1
    for k=0:N-1
        W(n+1,k+1)=exp(i*2*pi*n*k/N);
    end;
end;

YY=W*transpose(y);  %Transpose example: new_x.' 
Y=YY/N;

disp('DIF IDFT of FFT Sequence is:');
disp(Y);


subplot(3,1,1);
stem(abs(Y));
title('Magnitude Spectrum');
xlabel('n');
ylabel('|Y(n)|');
grid on;

subplot(3,1,2);
stem(angle(Y));
title('Phase Spectrum');
xlabel('n');
ylabel('Angle Y(n)');
grid on;