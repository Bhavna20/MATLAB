%Figure 11: Utilities,Power and Finance 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%for smaller samples%%

clear all;
TrivarP;

% Compute structural shocks Ehat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,61:end); %q starting from 2005
q2=Ehat(2,61:end);
q3=Ehat(3,61:end);
time=0:24;

[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
Ind= data(84:end,7); %data from Jan-00 onwards
y=100*(log(Ind(2:end,1))-log(Ind(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(84:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,1)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Industrials')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,2)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Industrials')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,3)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Industrials')
title('Oil-Market Specific Demand Shock')
xlabel('Months')

clear all;
trivarown

% Compute structural shocks Ehat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,61:end); %q starting from 2005
q2=Ehat(2,61:end);
q3=Ehat(3,61:end);
time=0:24;

[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
Util= data(84:end,8); %data from Jan-00 onwards
y=100*(log(Util(2:end,1))-log(Util(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(84:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,4)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Utilities')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,5)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Utilities')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,6)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Utilities')
title('Oil-Market Specific Demand Shock')
xlabel('Months')

%%%%%%%%%%%%%%%%%%Power%%%%%%%
clear all;
TrivarP;

% Compute structural shocks Ehat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,61:end); %q starting from 2005
q2=Ehat(2,61:end);
q3=Ehat(3,61:end);
time=0:24;



[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
Pow= data(84:end,10); %data from Jan-00 onwards
y=100*(log(Pow(2:end,1))-log(Pow(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(84:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,7)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Power')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,8)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Power')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,9)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Power')
title('Oil-Market Specific Demand Shock')
xlabel('Months')


%%%%%%%%%%%Finance%%%%

[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
Fin= data(84:end,9); %data from Jan-00 onwards
y=100*(log(Fin(2:end,1))-log(Fin(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(84:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,7)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Finance')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,8)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Finance')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,9)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Finance')
title('Oil-Market Specific Demand Shock')
xlabel('Months')
