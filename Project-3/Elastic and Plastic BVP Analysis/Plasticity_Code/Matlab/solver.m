domain = [31 33];
IC1 = -232.26526465;
IC2 = -249.48904448;
IC = [IC1 IC2];
[Ivsol, DVsol] = ode23('DEdef', domain, IC);

