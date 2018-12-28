Figure4
clc;
clear all;
[data, headers]=xlsread('Data.xlsx');
Data(:,1)= 100*(log(data(2:end,1))-log(data(1:end-1,1))); 

%Real economic activity
Data(:,2)= data(2:end,2); % does not have unit root by construction
%change oil price to real and changes to log changes
Data(:,3)=log(data(2:end,6)*100) %real price deflated by cpi *100
Op= data(2:end,6)*100;
oil= Op(48:end,:);
A= Data(24:end,:); % Final data used from JAN 98 as we are using a lag of two years
P=24 % lag
N=3; %number of variables
T=size(A,1)-P;   %sample size - the lags as we lose two data points. size(data,1) gives the number of rows
FPT=1;   %oil price shock variable. This is the general variable for which  we want to study the impulse response
Y=A(P+1:end,:); % as we have to drop the first 24 observations since we are using 24 lags of independent variables
Z= ones(T,1); % creating the constant

% create lags of independent variables as follows
for p=1:P %loop is on p from 1 to length of lag
    Z=[Z,A(P+1-p:end-p,:)]; %it puts the four lags next to the constant, so you get columns of the corresponding lags
end

Y=Y';
Z=Z';
B=Y/Z; %OLS 
C=B(:,1);
for p=1:P
    b{p}=B(:,2+(p-1)*N: (N+1)+(p-1)*N) %collectiong all lag 1 coeff, lag two coeff and ...coeff blocks
end
%Z(Z==0)=0.0001;

Yhat= B*Z; % the coefficient times the independent vars
Uhat= Y-Yhat; % predicted redisual error
Ut=Uhat';

%plot (Ut);
V=(T-N*P+1)\Uhat*Ut; %calculates the var-cov matrix
Ao=inv(chol(V,'lower'));  % lower triangular matrix
E=Ao*Uhat; % shocks 
FPS=E(FPT,:);

q1=E(1,:); q1=[(q1(1,1)+q1(1,2))/2 q1];
q2=E(2,:); q2=[(q2(1,1)+q2(1,2))/2 q2];
q3=E(3,:); q3=[(q3(1,1)+q3(1,2))/2 q3];

% Average monthly shocks by quarter
time=2000:1:2017;
for i=1:length(time)
   q1a(i)=(q1(12*(i-1)+1)+q1(12*(i-1)+2)+q1(12*(i-1)+3)+q1(12*(i-1)+4)+q1(12*(i-1)+5)+q1(12*(i-1)+6)+q1(12*(i-1)+7)+q1(12*(i-1)+8)+q1(12*(i-1)+9)+q1(12*(i-1)+10)+q1(12*(i-1)+11)+q1(12*(i-1)+12))/12;
   q2a(i)=(q2(12*(i-1)+1)+q2(12*(i-1)+2)+q2(12*(i-1)+3)+q2(12*(i-1)+4)+q2(12*(i-1)+5)+q2(12*(i-1)+6)+q2(12*(i-1)+7)+q2(12*(i-1)+8)+q2(12*(i-1)+9)+q2(12*(i-1)+10)+q2(12*(i-1)+11)+q2(12*(i-1)+12))/12;
   q3a(i)=(q3(12*(i-1)+1)+q3(12*(i-1)+2)+q3(12*(i-1)+3)+q3(12*(i-1)+4)+q3(12*(i-1)+5)+q3(12*(i-1)+6)+q3(12*(i-1)+7)+q3(12*(i-1)+8)+q3(12*(i-1)+9)+q3(12*(i-1)+10)+q3(12*(i-1)+11)+q3(12*(i-1)+12))/12;
end;

subplot(3,1,1)
plot(time,q1a,time,zeros(size(q1a))); axis tight;
title('Oil Supply Shock')
axis([2000 2017 -1 +1])


subplot(3,1,2)
plot(time,q2a,time,zeros(size(q2a))); axis tight;
title('Aggregate Demand Shock')
axis([2000 2017 -1 +1])


subplot(3,1,3)
plot(time,q3a,time,zeros(size(q3a))); axis tight;
title('Oil-Specific Demand Shock')
axis([2000 2017 -1 +1])




% % Plot of the aggregate stock market return over time
% SEN= data(48:end,7); %data from Jan-00 onwards
% y= SEN(2:end,1);
% time1=(2000+1/12:1/12:2018+5/12)
% plot(time1,oil,'r',time1,y,'b'); axis tight;
% %axis([2000 2018 ])
% title('Real price of oil')

