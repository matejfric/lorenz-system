function [frames] = animate_lorenz(t, X)
%ANIMATE_LORENZ
% t  ...(1..T) vector
% X  ...(T x Dimension) matrix(es)

if ~iscell(X)
    X = cell(X);
end

% Create file name variable
filename = 'animation.gif';

%colors = [[0.7725, 0.8235, 0.1765]; [0.1765, 0.7725, 0.8235]; [0.8235, 0.1765, 0.7725]; [0.9290 0.6940 0.1250]; [1 0.6 0.8]];
colors = [[0.8431, 0.5294, 0.1569]; [0.1569, 0.8431, 0.5294]; [0.5294, 0.1569, 0.8431]; [0.9290 0.6940 0.1250]; [1 0.6 0.8]];

N = length(X);
T = length(t);

fig = figure;
fig.Position = [100,100,1080,1080];

% Plotting with no color to set axis limits
for kk = 1:N
    x = X{kk}(:,1);
    y = X{kk}(:,2);
    z = X{kk}(:,3);
    plot3(x,y,z,'Color','none');
    view(39.537499979551761,16.467515964187033);
    set(gca,'Color','k')
    set(gcf,'Color','k')
    xlabel('$x$', 'Interpreter', 'Latex')
    ylabel('$y$', 'Interpreter', 'Latex')
    zlabel('$z$', 'Interpreter', 'Latex')
    hold on
end
title(sprintf('Time: %0.2f sec', t(1)), 'Interpreter', 'Latex');

% Plotting the first iteration
for kk = 1:N
    x = X{kk}(:,1);
    y = X{kk}(:,2);
    z = X{kk}(:,3);
    p{kk} = plot3(x(1),y(1),z(1),'Color',colors(kk,:));
    hold on
    m{kk} = scatter3(x(1),y(1),z(1),15,colors(kk,:),'filled');
end

frames(1:N*t) = struct('cdata',[],'colormap',[]);
% Iterating through the length of the time array
for k = progress(1:T)
    for kk = 1:N
        x = X{kk}(:,1);
        y = X{kk}(:,2);
        z = X{kk}(:,3);
        % Updating the line
        p{kk}.XData = x(1:k);
        p{kk}.YData = y(1:k);
        p{kk}.ZData = z(1:k);
        % Updating the point
        m{kk}.XData = x(k); 
        m{kk}.YData = y(k);
        m{kk}.ZData = z(k);
        % Saving the frame
        idx = (N*k-N*1)+kk;
        frame = getframe(gcf);
        im = frame2im(frame);
        [cdata,colormap] = rgb2ind(im,256);
        frames(idx).cdata = cdata;
        frames(idx).colormap = colormap;
    end
    % Updating the title
    title(sprintf('Trajectory\nTime: %0.3f sec', t(k)),...
    'Interpreter','Latex');
end

end

