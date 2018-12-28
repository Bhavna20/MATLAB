
clear all;

global h t

% Load monthly data for 1996.1-2018.6 and finally use data from
% 2000.1-2018.6 ordered as 
% 1. Growth rate of world oil production 
% 2. Global real activity (index based on dry cargo shipping rates)
% 3. Real price of oil 
% The data sources are described in the text.

[data, headers]=xlsread('Data.xlsx','Selected'); %Data file containing all important variables

%change oil production in percentage terms
Data(:,1)= 100*(log(data(2:end,1))-log(data(1:end-1,1))); 
%Real economic activity
Data(:,2)= data(2:end,2); % does not have unit root by construction
%Real oil price
Data(:,3)=log(data(2:end,6)*100)


%y is the data to be used finally
y= Data(24:end,1:3); % The data file contains data from JAN 1996. We are using a lag of two years and hence need data from JAN 1998
[t,q]=size(y); 
time=(2000+1/12:1/12:2018+5/12)'    % Time line
h=15;                               % Impulse response horizon
p=24;                               % lag 
[A,SIGMA,Uhat,V,X]=olsvarc(y,p);	% VAR with intercept	
SIGMA=SIGMA(1:q,1:q);
