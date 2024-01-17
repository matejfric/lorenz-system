clear all
close all
addpath('ProgressBar')

% Lorenz system:
%{
    dx/dt = σ(y-x) 
    dy/dt = x(ρ-z)-y
    dz/dt = xy-βz
%}
% Beta = [σ, ρ, β]

Beta = [10;42;8/3]; % parameters
%Beta = [10;69;8/3]; % parameters
%Beta = [10;28;8/3]; % parameters
x0 = [0;1;20]; % initial condition
t = 0.01:0.005:15; % time
options = odeset('RelTol',1e-12,'AbsTol',1e-12*ones(1,length(x0)));
N = 5;

X = cell(N,1);
for k = 1:N
    x0(1) = (k-1)*10;
    [~,X{k}] = ode45(@(t,x)lorenz(t, x, Beta),t,x0,options);
end

plot_lorenz(t, X)

%[frames] = animate_lorenz(t, X);

%filename='myLorenzAnimation.gif';
%save_animation_gif(frames, filename)

%filename='myLorenzVideo';
%save_animation_video(frames, filename)

