%Figure13: Impulse response functions for sectoral stock returns: Health,
%Metals and oil and gas

clc;
clear all;

TrivarP
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,:); 
q2=Ehat(2,:); 
q3=Ehat(3,:); 

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;
[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
%load beagdp.txt; gdp=beagdp(:,3); y=dif(log(gdp))*400;
Health= data(24:end,2); %data from Jan-00 onwards
y=100*(log(Health(2:end,1))-log(Health(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,1)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Healthcare')
title('Crude Oil Supply Shock')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,2)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Healthcare')

title('Aggregate Demand Shock')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,3)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Healthcare')

title('Oil-Market Specific Demand Shock')
clear;
TrivarP;
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,:); 
q2=Ehat(2,:); 
q3=Ehat(3,:); 

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;
[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
%load beagdp.txt; gdp=beagdp(:,3); y=dif(log(gdp))*400;
Met= data(24:end,3); %data from Jan-00 onwards
y=100*(log(Met(2:end,1))-log(Met(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,4)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Metals')
title('Crude Oil Supply Shock')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,5)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Metals')
title('Aggregate Demand Shock')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,6)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Metals')
title('Oil-Market Specific Demand Shock')


%%%%%%%%%%%%%oil&Gas%%%%%%%%%%%%
clear;

trivarown
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);
q1=Ehat(1,:); 
q2=Ehat(2,:); 
q3=Ehat(3,:); 

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;
[data, headers]=xlsread('Data.xlsx','STock');
data=data(1:end-2,:);
%load beagdp.txt; gdp=beagdp(:,3); y=dif(log(gdp))*400;
Oil= data(24:end,4); %data from Jan-00 onwards
y=100*(log(Oil(2:end,1))-log(Oil(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(3,3,7)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Oil & Gas')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(3,3,8)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Oil & Gas')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(3,3,9)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Oil & Gas')
title('Oil-Market Specific Demand Shock')
xlabel('Months')

