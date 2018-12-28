%figure 14: Auto and consumer durables
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
Auto= data(24:end,5); %data from Jan-00 onwards
y=100*(log(Auto(2:end,1))-log(Auto(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(2,3,1)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Auto')
title('Crude Oil Supply Shock')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(2,3,2)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Auto')
title('Aggregate Demand Shock')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(2,3,3)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Auto')
title('Oil-Market Specific Demand Shock')
xlabel('Months')

%%%%%%%%%%%%%%%%Consumer durables%%%%%5
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
Cons= data(24:end,6); %data from Jan-00 onwards
y=100*(log(Cons(2:end,1))-log(Cons(1:end-1,1)));
CPI=100*(log(data(2:end,11))-log(data(1:end-1,11)));
CPIN=CPI(24:end,1);
y=y-CPIN; %real stock return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time=0:24;

[irf2hat,irf2a,irf2b,cumirf2hat,cumirf2a,cumirf2b]=stage2irfown(y,q1');
subplot(2,3,4)
plot(time,-cumirf2hat,'b-',time,-cumirf2a,'b--',time,-cumirf2b,'b:',time,zeros(size(time)),'k-');
ylabel('Consumer durables')
title('Crude Oil Supply Shock')
xlabel('Months')

[irf3hat,irf3a,irf3b,cumirf3hat,cumirf3a,cumirf3b]=stage2irfown(y,q2');
subplot(2,3,5)
plot(time,cumirf3hat,'b-',time,cumirf3a,'b--',time,cumirf3b,'b:',time,zeros(size(time)),'k-'); 
ylabel('Consumer durables')
title('Aggregate Demand Shock')
xlabel('Months')

[irf4hat,irf4a,irf4b,cumirf4hat,cumirf4a,cumirf4b]=stage2irfown(y,q3');
subplot(2,3,6)
plot(time,cumirf4hat,'b-',time,cumirf4a,'b--',time,cumirf4b,'b:',time,zeros(size(time)),'k-');
ylabel('Consumer durables')
title('Oil-Market Specific Demand Shock')
xlabel('Months')
