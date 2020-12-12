%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  UNIVERSIDAD DE IBAGUE  %%%
%%%  Master in Control      %%%
%%%  Instrumentation        %%%
%%%  Harold F MURCIA        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Example No.1 Signal Manipulation with MATLAB

clear,clc,close all

% load dataBase (raw is a predefined database)

data = load('raw.mat');
Fs = 125;
Ts = 1/ Fs;
Resp = data.val(1,:);
ECG_1= data.val(2,:);
ECG_5= data.val(3,:);
ECG_2= data.val(4,:);
PLETH= data.val(5,:);
ABP  = data.val(6,:);


N = length(Resp);
t=0:Ts:(N-1)*Ts;

% Data Plot
figure(1)
subplot(231)
    plot(t,Resp)
    grid on
    xlabel('time')
    ylabel('Resp')
subplot(232)
    plot(t,ECG_1)
    grid on
    xlabel('time')
    ylabel('ECG I')
subplot(233)
    plot(t,ECG_5)
    grid on
    xlabel('time')
    ylabel('ECG V')
subplot(234)
    plot(t,ECG_2)
    grid on
    xlabel('time')
    ylabel('ECG II')
subplot(235)
    plot(t,PLETH)
    grid on
    xlabel('time')
    ylabel('PLETH')
subplot(236)
    plot(t,ABP)
    grid on
    xlabel('time')
    ylabel('ABP')

%% ECG I Case
noise = randn(1,N)*10;
noise = noise - mean(noise);
white_noise = noise/std(noise);
figure(2)
subplot(311)
plot(t,ECG_1)
hold on 
grid on
ECG_1 = ECG_1 + white_noise*10;
plot(t,ECG_1);
noise_60 = 100*sin(2*pi*60*t);
ECG_1 = ECG_1 + noise_60;
noise_01 = 100*sin(2*pi*0.1*t);
ECG_1 = ECG_1 + noise_01;
subplot(311)
plot(t,ECG_1);
xlabel('time [sec]')
subplot(312)
plot(t,white_noise*10)
grid on
xlabel('time [sec]')
subplot(313)
plot(t,noise_01*100+noise_60*10)
grid on
plot(t,noise_60)
xlabel('time [sec]')

%% Fouruer Analisys 
espectro(ECG_1,Fs)

%% Filter Design Based on Freq Analisys 
Fl = 1;
Fh = 15;
[num,den]=my_filter(Fs,Fl,Fh);

%% run simulink 
signal = ECG_1;
sim('signal_proc') 

