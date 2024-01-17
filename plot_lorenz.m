function [] = plot_lorenz(t, X)
%PLOT_LORENZ
% t  ...(1..T) vector
% X  ...(T x Dimension) matrix(es)

if ~iscell(X)
    X = cell(X);
end

figure
grid on
for k = 1:length(X)
    plot3(X{k}(:,1),X{k}(:,2),X{k}(:,3));
    view(39.537499979551761,16.467515964187033);
    set(gca,'Color','k','XColor','w','YColor','w','ZColor','w')
    set(gcf,'Color','k')
    xlabel('$x$', 'Interpreter', 'Latex','Color', 'w')
    ylabel('$y$', 'Interpreter', 'Latex','Color', 'w')
    zlabel('$z$', 'Interpreter', 'Latex','Color', 'w')
    hold on
end



end
