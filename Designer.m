%% Designer Specifications

titleFontSize    = 14;
xlabelFontSize   = 14;
ylabelFontSize   = 14;
markerFontSize   = 12;
tickFontSize     = 14;
LineWidth        = 2;
LineWidthThin    = 1;
colorDesired     = [0 0.4470 0.7410];
colorUnDesired   = 'k';
LineStyle        = '-.';
offset           = 0.1;

%% Exploratory Data Analysis
figure(1)
scatter(M(:,1),M(:,4), 'MarkerEdgeColor', 'k');

xlabel('x position(meters) of anti-noise source','interpreter','latex','FontSize', xlabelFontSize);
ylabel('RMS value of cancelled signal','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('x position Vs. RMS',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'Xtick',0.1:0.3:2.5)
grid on
%grid minor

Rx = corr(M(:,1),M(:,4))

figure(2)
scatter(M(:,2),M(:,4), 'MarkerEdgeColor', 'k');

xlabel('y position(meters) of anti-noise source','interpreter','latex','FontSize', xlabelFontSize);
ylabel('RMS value of cancelled signal','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('y position Vs. RMS',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'Xtick',0.1:0.3:2.2)
grid on
%grid minor

Ry = corr(M(:,2),M(:,4))

figure(3)
scatter(M(:,3),M(:,4), 'MarkerEdgeColor', 'k');

xlabel('z position(meters) of anti-noise source','interpreter','latex','FontSize', xlabelFontSize);
ylabel('RMS value of cancelled signal','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('z position Vs. RMS',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'Xtick',0.3:0.3:2.7)
grid on
%grid minor

Rz = corr(M(:,3),M(:,4))

%% Distance between Noise Source and Anti-Noise Source

distance = sqrt(M(:,1).^2+M(:,2).^2+M(:,3).^2);

figure(4)
scatter(distance,M(:,4), 'MarkerEdgeColor', 'k');

xlabel('distance(meters) bw noise source and anti-noise source','interpreter','latex','FontSize', xlabelFontSize);
ylabel('RMS value of cancelled signal','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('distance Vs. RMS',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'Xtick',0:0.5:4.5)
grid on
%grid minor

Rd = corr(distance,M(:,4));


%% End of program