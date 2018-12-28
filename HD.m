% Computes the LS estimates with aggregate stock returns
clear all;

global h t

% Load monthly data for 2000.1-2018.5 ordered as:
% 1. Growth rate of world oil production 
% 2. Global real activity (index based on dry cargo shipping rates)
% 3. Real price of oil 
% The data sources are described in the text.

[data, headers]=xlsread('Data.xlsx','Selected');
data=data(24:end,:); %from dec 1997 to 2018:5
Data(:,1)= 100*(log(data(2:end,1))-log(data(1:end-1,1)));
Data(:,2)= data(2:end,2);
Data(:,3)=log(data(2:end,6)*100);

SEN= data(:,7); %data from Jan-00 onwards
y1=100*(log(SEN(2:end,1))-log(SEN(1:end-1,1)));
X= data(2:end,8); %Indian CPI
CPI=100*(log(X(2:end,1))-log(X(1:end-1,1))); %Inflation
CPIN =zeros(245,1);
CPIN(1,1)= 0.031748698;
CPIN(2:end,1)=CPI;
y1=y1-CPIN; %real stock returns
Data(:,4)= y1;
y=Data;

[t,q]=size(y); 
time=(2000+1/12:1/12:2018+5/12)' % Time line
h=15;                               % Impulse response horizon
p=24;                               % lags
[A,SIGMA,Uhat,V,X]=olsvarc(y,p);	% VAR with intercept	
SIGMA=SIGMA(1:q,1:q);