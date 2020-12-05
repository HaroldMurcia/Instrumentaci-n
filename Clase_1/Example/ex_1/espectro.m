function a=espectro(u,Fs)
    L=length(u);
    n = 2^nextpow2(L);
    Y = abs(fft(u,n));
    f = linspace(0,Fs,n);
    fc=round(length(Y)/2);
    plot(f(1:fc),Y(1:fc))
    M=max(Y(1:fc));
    p=find(Y(1:fc)==M);
    a=f(p);
    grid on
    xlabel('Freq [hz]')
end