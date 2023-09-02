clc; clear all;
t=linspace(0,10,100);
k1= 0.21; k2=0.15; n=0.24; e0=100;
tr=(n/k2);
w=[(1/100)*tr, (1/10)*tr, tr, 10*tr, 100*tr] ;
sa=e0.* ( ( (n.^2.* (k1+k2) .*w.^2)+k1.*k2.^2) ./ ( (k2).^2 + n.^2.*w.^2) )
sb=e0.*w.* ( (k1.*k2.^2- k1.*k2.*n) ./ ( (k2).^2 + n.^2.*w.^2) )
f=zeros(length(w),length(t));
for i=1:length(w)
    f(i,:) = (k1+k2)* ((k2^2+n^2*w(i)^2) /(w(i)* (k1*k2^2-k1*k2*n)))* exp ((-k2*t)/n)
    s(i,:) = sa(i)* sin(w(i)*t)+ sb(i)*cos(w(i)*t)-f(i,:); 
end
% f= (1/(k1+k2)) .* ( ( (n^2.*(k1+k2).^2.*w.^2)+k1.*k2.^2) ./ (k2.^2+n.^2*w.^2)) .* exp ((k1.*k2*t)./((k1+k2).*n));

dt=t(3)-t(2);
% Nyquist frequency (highest frequency)
Ny = (1./dt)./2;
% number of points in xgtt
L = length(s);
% Next pow(1,i)er of 2 from length of xgtt
NFFT = 2.^nextpow2(L);
% frequency spacing
df = 1./(NFFT.*dt);
% Fourier amplitudes
for i=1:length(w)
    U(i,:) = abs(fft(s(i,:),NFFT))*dt;
    % Single sided Fourier amplitude spectrum
    V(i,:) = U(i,2:Ny/df+1);
end
% frequency range
freq = linspace(df,Ny,Ny./df)';

colors = jet(5);
for i = 1:length(w)
    plot(freq,V(i,:),'color',colors(i,:),'DisplayName',strcat('w=',num2str(w(i))),'LineWidth',2)
    legend
    hold on
end