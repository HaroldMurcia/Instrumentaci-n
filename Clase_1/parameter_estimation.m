%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  UNIVERSIDAD DE IBAGUE  %%%
%%%  Master in Control      %%%
%%%  Instrumentation        %%%
%%%  Harold F MURCIA        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Least squares

clear,clc,close all

y=[1068;988;1002;996]
H=[1;1;1;1]

X_hat=inv(H'*H)*H'*y

L=4; %Sample length for the random signal
mu=0;
sigma=2;
X_hat=sigma*randn(L,1)+mu;


% Weighted Least squares

sigma_a=std(y(1:2))
sigma_b=std(y(3:4))

R=[sigma_a^2,0,0,0;0,sigma_a^2,0,0;0,0,sigma_b^2,0;0,0,0,sigma_b^2]

X_hat=inv(H'*inv(R)*H)*H'*inv(R)*y

