%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  UNIVERSIDAD DE IBAGU?  %%%
%%%  Master in Control      %%%
%%%  Instrumentaci?n        %%%
%%%  Harold F MURCIA        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% LowPass Filter example

function [B,A]=my_filter(Fs,Fl,Fh)

Ts = 1/Fs;
n=2;

%% Mensaje de error de muestreo
if(Fh/(Fs/2) >= 1)
    fprintf('Error: Max Freq is: ')
    fprintf(num2str(Fs/2))
    fprintf('Hz \n')
end

[b,a] = butter(n,[Fl/(Fs/2) Fh/(Fs/2)]);
Fil_d=tf(b,a,Ts);
figure()
bode(Fil_d)
fprintf('Digital Trnasfer Fucntion is: ')
Fil_d

B=b;
A=a;

end

