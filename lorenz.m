function [dX] = lorenz(t, x, Beta)
%LORENZ 

% Beta = [sigma, rho, beta]

% Lorenz system:
%{
    dx/dt = σ(y-x) 
    dy/dt = x(ρ-z)-y
    dz/dt = xy-βz
%}

dX = [
    Beta(1) * (x(2)-x(1))
    x(1) * (Beta(2)-x(3)) - x(2)
    x(1)*x(2)-Beta(3)*x(3)
];

end

