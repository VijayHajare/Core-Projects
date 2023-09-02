clc; close all;
syms y(t) p0 p1 q0 e 
eqn = diff(y,t) == (((q0 /p1)*(e))-((p0/p1)*(y)));
S = dsolve(eqn)