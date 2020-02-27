clear
clc
clear
% Low damped free vibration codes
%Yay sabitinin bulunmas?
% Birimler  F = mg m =0.515 kg g =9.8N/kg F = N �?kar
F = 0.515*9.8
% yay sabiti x=0.3cm ve K n?n birimi N/cm
X=0.3
K = F/X
% toplam deney sistemi k�tlesi 517.816kg
mcubuk = 1.5533
mmotor =6.8629
Mc=509.4
B =1
madd3=1.914

% s�n�mleyici sabitini varsa 5 yoksa 0 ald?m
bc = 5
% s�n�mleyici yoksa 0
bcnot= 0;
% ���nc� a??rl?k 1.914 kg
L = 73
L1 = 30.5
L2 = 44.5
L3 = 63
%ilk durum ek k�tle ve s�n�mleyici yok
mes = 1/3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc
Wn = (K/(3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc)^(1/2))
Sonum = bcnot*(L1/L3)^2/(2*(1/3*mcubuk*(L/L2)^2+mmotor*(L2/L3)^2+Mc)^(1/2))
Wd = Wn*(1-Sonum^2)^(1/2)
t=0:1/Wd:100
X0=15
X = X0*exp(Sonum*Wn*t).*sin(Wd*t)
figure()
plot(t,X)
title('ilk durum ek k�tle ve s�n�mleyici yok')
%Ek k�tle yok, s�n�mleyici var s�n�mleyici var
mes = 1/3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc
Wn = (K/(3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc)^(1/2))
Sonum = 1.1*(L1/L3)^2/(2*(1/3*mcubuk*(L/L2)^2+mmotor*(L2/L3)^2+Mc)^(1/2))
Wd = Wn*(1-Sonum^2)^(1/2)
t=0:1/Wd:100
X0=15
X = X0*exp(-Sonum*Wn*t).*sin(Wd*t)
figure()
plot(t,X)
title('Ek k�tle yok, s�n�mleyici var s�n�mleyici var')
%ek k�tlede s�n�mleyicide var ve s�n�mleyici var
mes = 1/3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc+madd3
Wn = (K/(3*mcubuk*(L/L3)^2+mmotor*(L2/L3)^2+Mc+madd3)^(1/2))
Sonum = bc*(L1/L3)^2/(2*(1/3*mcubuk*(L/L2)^2+mmotor*(L2/L3)^2+Mc+madd3)^(1/2))
Wd = Wn*(1-Sonum^2)^(1/2)
t=0:1/Wd:100
X0=15
X = X0*exp(-Sonum*Wn*t).*sin(Wd*t)
figure()
plot(t,X)
title('ek k�tlede s�n�mleyicide var ve s�n�mleyici var')