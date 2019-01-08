% IRFVAR.M


function [IRF]=irfvarHD(A,SIGMA,p,h)

J=[eye(4,4) zeros(4,4*(p-1))];
IRF=reshape(J*A^0*J'*chol(SIGMA)',4^2,1);

for i=1:h
	IRF=([IRF reshape(J*A^i*J'*chol(SIGMA)',4^2,1)]);
end;
