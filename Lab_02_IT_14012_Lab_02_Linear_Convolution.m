clc;
clear all;
close all;
disp('SK. Tanzir Mehedi Shawon');
disp('IT-14012');
disp('Department of ICT, MBSTU');
disp('Group-01');
disp('6(c) Linear Convolution using radix-2 DIT FFT');

x=input('Input sequence of x(n): ');
h=input('Input sequence of h(n): ');

length_x=length(x);
length_h=length(h);

N=length_x+length_h-1;

new_x=[x zeros(1,N-length_x)];   % Create a 1-by- (N-length_x) vector
new_h=[h zeros(1,N-length_h)];

W=zeros(N,N);
for n=0:N-1
    for k=0:N-1
        W(n+1,k+1)=exp(-i*2*pi*n*k/N);
    end;
end;

X=W*transpose(new_x);  %Transpose example: new_x.'
H=W*transpose(new_h);   

disp('DIT of 1st sequence is: ');
disp(transpose(X));

disp('DIT of 2nd sequence is: ');
disp(transpose(H));

figure;
subplot(4,1,1);
stem(abs(X)); 
title('Magnitude spectrum of X(k)');
ylabel('|X(k)|');
xlabel('k');

subplot(4,1,2);
stem(angle(X)); 
title('Phase spectrum of X(k)');
ylabel('Angle X(k)');
xlabel('k');

subplot(4,1,3);
stem(abs(H)); 
title('Magnitude spectrum of H(k)');
ylabel('|H(k)|');
xlabel('k');

subplot(4,1,4);
stem(angle(H)); 
title('Phase spectrum of H(k)');
ylabel('Angle H(k)');
xlabel('k');

YY=times(X,H); % Array multiply example X.*H
w=zeros(N,N);

for n=0:N-1
    for k=0:N-1
        w(n+1,k+1)=exp(i*2*pi*n*k/N);
    end;
end;

C=w*YY;
Y=C/N;

disp('Convolved Sequence');
disp(transpose(Y));

figure;
subplot(2,1,1);
stem(abs(Y)); 
title('Magnitude spectrum of Y(k)');
ylabel('|Y(k)|');
xlabel('k');

subplot(2,1,2);
stem(angle(Y)); 
title('Phase spectrum of Y(k)');
ylabel('Angle Y(k)');
xlabel('k');