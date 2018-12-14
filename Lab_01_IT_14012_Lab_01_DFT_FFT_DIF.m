
%SK. Tanzir Mehedi Shawon
%ID: IT-14012

clear all;
close all;
clc;
x=input('Enter the sequence x(n): ');
N=input('Enter the length of the DIF DFT: ');
length_x=length(x);

if N>length_x
    x=[x zeros(1,N-length_x)];
elseif N<length_x
    x=x(1:N);
end

W=zeros(N,N);
for n=0:N-1
    for k=0:N-1
        W(n+1,k+1)=exp(-i*2*pi*n*k/N);
    end;
end;

X=W*transpose(x);  %Transpose example: new_x.'  

disp('DIF FFT Sequence is:');
disp(X);


subplot(2,1,1);
stem(abs(X));
title('Magnitude Spectrum');
xlabel('k');
ylabel('|X(k)|');
grid on;

subplot(2,1,2);
stem(angle(X));
title('Phase Spectrum');
xlabel('k');
ylabel('Angle X(k)');
grid on;