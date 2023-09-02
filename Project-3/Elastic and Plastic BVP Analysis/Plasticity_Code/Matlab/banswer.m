syms y(x) w;
E = 210000;
sy = 250;
l = 500;
w = 433.33333333333337;   % for w = 1.3wy
Mz = (w/2)*(l^2 - x^2);

yyn = 2*sy*(0.1*l)^3 - Mz;
yyd = 2*sy*(0.1*l)*((2/3)+1);
yy = -sqrt(yyn/yyd);
dn = Mz - 2*sy*0.1*l*( (0.1*l)^2 - yy^2);
dd = (4/3)*E*(0.1*l)*yy^3;
d = dn/dd;
ode = diff(y,x,2) == d;
Dy = diff(y);
cond1 = y(392.2322702763681) == -1.087454212454212; % y(xy) contiunity
cond2 = Dy(0)== 0;   %slope at centroid
conds = [cond1 cond2];
ySol(x) = dsolve(ode,conds);
ySol = simplify(ySol)

