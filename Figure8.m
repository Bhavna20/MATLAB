% Figure8.Equation-by-equation estimates with bootstrap confidence intervals
clear;
HD;

%%%%%%%%%% Historical decomposition %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compute structural multipliers
IRF=irfvarHD(A,SIGMA(1:q,1:q),p,t-p-1);

% Compute structural shocks Ehat from reduced form shocks Uhat
Ehat=inv(chol(SIGMA)')*Uhat(1:q,:);

% Cross-multiply the weights for the effect of a given shock on the real
% oil price (given by the relevant row of IRF) with the structural shock
% in question
yhat1=zeros(t-p,1); yhat2=zeros(t-p,1); yhat3=zeros(t-p,1);
for i=1:t-p
	yhat1(i,:)=dot(IRF(4,1:i),Ehat(1,i:-1:1));
	yhat2(i,:)=dot(IRF(8,1:i),Ehat(2,i:-1:1));
	yhat3(i,:)=dot(IRF(12,1:i),Ehat(3,i:-1:1));
end;

% Contribution to Aggregate stock returns
time=2000+1/12:1/12:2018+5/12;

subplot(3,1,1)
plot(time,yhat1,'b-');
title('Cumulative Effect of Oil Supply Shock on Aggregate stock return')
axis([2000+1/12 2018+5/12 -10 +10])
grid on

subplot(3,1,2)
plot(time,yhat2,'b-');
title('Cumulative Effect of Aggregate Demand Shock on Aggregate stock return')
axis([2000+1/12 2018+5/12 -10 +10])
grid on

subplot(3,1,3)
plot(time,yhat3,'b-');
title('Cumulative Effect of Oil-Market Specific Demand Shock on Aggregate stock return')
axis([2000+1/12 2018+5/12 -10 +10])
grid on

