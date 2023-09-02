clc; close all;
syms y(t) p0 p1 q0 q1 s0 w
eqn = diff(y,t) == ((p0/q1)*(s0)*(sin(w*t))) + ((p1/q1)*(w)*(s0)*(cos(w*t))) - ((q0/q1)*y);
S = dsolve(eqn)
