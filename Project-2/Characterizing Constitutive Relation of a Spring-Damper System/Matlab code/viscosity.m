clc; close all;
syms t k1 k2 n
expr = (k1 + k2.*exp(-k2.*t./n));
F = int(expr,t, 0, inf)