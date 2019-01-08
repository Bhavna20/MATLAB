% FIGURE7.M - Plot the impulse response functions of aggregate stock
% return to the oil shocks
clc;
clear all;
TrivarP;
% Compute structural shocks Ehat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,:);
q2=Ehat(2,:);
q3=Ehat(3,:);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
SEN= data(24:end,1); %data from Jan-00 onwards
y=100*(log(SEN(2:end,1))-log(SEN(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
X=[q1', q2', q3', y];
xlswrite( "FC.xlsx",X);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24
[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(1,3,1)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Real Agg Stock')
axis([0 h -10 10])
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(1,3,2)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-')
ylabel('Real Agg Stock')
axis([0 h -10 10])
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(1,3,3)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-')
ylabel('Real Agg Stock')
axis([0 h -10 10])
title('Oil-Market Specific Demand Shock')
xlabel('Months')

