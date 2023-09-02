clc; clear all;
t=linspace(0,10,100);
k1= 0.21; k2=0.15; n=0.24; s0=100;
tc=(n*(k1+k2))/ (k1*k2);
w=[(1/100)*tc, (1/10)*tc, tc, 10*tc, 100*tc] ;
ea = s0.* ( ( (n.^2.* (k1+k2) .*w.^2)+k1.*k2.^2) ./ ( (k1.^2.*k2.^2) + (k1+k2).^2.*n.^2.*w.^2) );
eb = - s0.*w.* ( (n.*k2.^2) ./ ( (k1.^2.*k2.^2) + (k1+k2).^2.*n.^2.*w.^2) );
f=zeros(length(w),length(t));
for i=1:length(w)
    f(i,:)= (1/(k1+k2))* ( ( (n^2*(k1+k2)^2*w(i)^2)+k1*k2^2) / (k2^2+n^2*w(i)^2)) * exp((k1*k2*t)/((k1+k2)*n));
    e(i,:) = ea(i)* sin(w(i)*t)+ eb(i)*cos(w(i)*t)-f(i,:); 
end
% f= (1/(k1+k2)) .* ( ( (n^2.*(k1+k2).^2.*w.^2)+k1.*k2.^2) ./ (k2.^2+n.^2*w.^2)) .* exp ((k1.*k2*t)./((k1+k2).*n));

dt=t(3)-t(2);
% Nyquist frequency (highest frequency)
Ny = (1./dt)./2;
% number of points in xgtt
L = length(e);
% Next pow(1,i)er of 2 from length of xgtt
NFFT = 2.^nextpow2(L);
% frequency spacing
df = 1./(NFFT.*dt);
% Fourier amplitudes
for i=1:length(w)
    U(i,:) = abs(fft(e(i,:),NFFT))*dt;
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
