function [Xs]  = bb_call_sampler(T,sigma2,V0,VT,L)

% Author: Ari Pakman


%% prepare parameters to call sampler

M=2*eye(T-1) - diag(ones(T-2,1),1) -diag(ones(T-2,1),-1);
M = M/sigma2;

r = zeros(T-1,1);
r(1) = V0/sigma2;
r(T-1) = VT/sigma2;

F = -eye(T-1);
g = VT*ones(T-1,1);


initial_X= (VT-2)*ones(T-1,1);

sF = sparse(F);
sg= sparse(g);
sM = sparse(M);
sr =sparse(r);


tic
Xs  =  HMC_exact(sF, sg, sM, sr, false, L, initial_X);
toc





end



