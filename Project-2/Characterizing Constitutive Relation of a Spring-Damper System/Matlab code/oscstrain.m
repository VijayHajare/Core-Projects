clc; close all;
syms y(t) p0 p1 q0 q1 e0 w
eqn = diff(y,t) == (((q0/p1)*e0*sin(w*t)) + ((q1/p1)*w*e0*cos(w*t)) - ((p0/p1)*y));
S = dsolve(eqn)
