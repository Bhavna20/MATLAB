% Figure 1: Plot of time series of all the data used in the paper
clc;
clear all;
[data, headers]=xlsread('Data.xlsx','All'); % The Data file sheet ALL contains all the variables used from JAN 2000

Data(:,1)= 100*(log(data(2:end,1))-log(data(1:end-1,1))); %percentage change in oil production
Data(:,2)= data(2:end,2); % does not have unit root by construction
%change oil price to real and changes to log changes
Data(:,3)=log(data(2:end,3)*100)

CPI= 100*(log(data(2:end,13))-log(data(1:end-1,13))) % inflation: percentage change in Consumer price index
% Calculate the real stock return as the percentage change in stock return
% adjusted for inflation
for i=4:9
    Data(:,i)= 100*(log(data(2:end,i))-log(data(1:end-1,i)))
    Data(:,i)= Data(:,i)- CPI
end
%xlswrite('timeseries.xlsx',Data);

% time series plot of all the variables 
time=(2000+1/12:1/12:2018+5/12)'
subplot(3,3,1);
plot( time, Data(:,1));
title('Global Oil Production');
axis([2000 2018 -4 4])


subplot(3,3,2);
plot( time, Data(:,2));
title('Real economic activity');
axis([2000 2018 -200 200])


subplot(3,3,3);
plot( time, Data(:,3));
title('Real Oil Price');
axis([2000 2018 3 5])



subplot(3,3,4);
plot( time, Data(:,4));
title('BSE Sensex');
axis([2000 2018 -40 40])


subplot(3,3,5);
plot( time, Data(:,5));
title('Healthcare');
axis([2000 2018 -40 20])


subplot(3,3,6);
plot( time, Data(:,6));
title('Metals');
axis([2000 2018 -100 50])

subplot(3,3,7);
plot( time, Data(:,7));
title('Oil & Gas');
axis([2000 2018 -40 40])

subplot(3,3,8);
plot( time, Data(:,8));
title('Auto');
axis([2000 2018 -40 40])

subplot(3,3,9);
plot( time, Data(:,9));
title('Consumer Durables');
axis([2000 2018 -50 50])

% Shorter sample for Industrials, Utilities and Finance
for i=10:12
    Data(:,i)= 100*(log(data(2:end,i))-log(data(1:end-1,i)));
    Data(:,i)= Data(:,i)- CPI;
end

time1=(2005+10/12:1/12:2018+5/12)'
subplot(1,3,1);
plot( time1, Data(70:end,10));
title('Industrials');
axis([2006 2018 -50 50])

subplot(1,3,2);
plot( time1, Data(70:end,11));
title('Utilities');
axis([2006 2018 -40 40])

subplot(1,3,3);
plot( time1, Data(70:end,12));
title('Finance');
axis([2006 2018 -50 50])
%  