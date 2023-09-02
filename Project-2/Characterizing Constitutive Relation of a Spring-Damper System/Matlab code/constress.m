clc; close all;
syms y(t) p0 p1 q0 q1 s0
eqn = diff(y,t) == (((p0/q1)*s0)-((q0/q1)*(y)));
e = dsolve(eqn)