%% Designer Specifications

titleFontSize    = 15;
xlabelFontSize   = 15;
ylabelFontSize   = 15;
markerFontSize   = 12;
tickFontSize     = 14;
LineWidth        = 2;
LineWidthThin    = 1;
colorDesired     = [0 0.4470 0.7410];
colorUnDesired   = 'k';
LineStyle        = '-.';
offset           = 0.1;

%% Image Processing Steps as mentioned in the original paper

% The data were obtained from three repetitive experiments. 
% The gray value was measured by the ImageJ software after the 
% subtraction of blank gray value.
% Linear correlation between gray intensity and glucose concentration.


%% Import Data

filename = 'output.csv';
M = csvread(filename);
M = M(2:end,2:end);

glucose_levels = (3:0.5:12)';

%% Box Plot

% scrsz = get(0,'ScreenSize');
% P1=[20 20 1800 600];
% figure('position', P1);
figure(1);


boxplot(M);

xlabel('Glucose Concentration $(mmolL^{-1})$','interpreter','latex','FontSize', xlabelFontSize);
ylabel('Intensity $(a. u.)$','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('Glucose Concentration Vs. Red Component Intensity',...
      'FontSize', titleFontSize,'interpreter','latex');

 
ax1 = gca; 
ax1.FontSize = tickFontSize;
set(ax1,'XTickLabel',glucose_levels);

h = findobj('Tag','Box');
set(h,'Linewidth',1.5, 'Color', 'k');


%grid on
%grid minor

%% Regression Analysis


figure(2)

mu = mean(M)';
%b1 = glucose_levels\mu;
%yCalc1 = b1*glucose_levels;

%scatter(glucose_levels, mu,'Marker', 'S','MarkerFaceColor', 'k');

plot(glucose_levels, mu,'Marker', 'S','MarkerFaceColor', 'k');

%hold on

%plot(glucose_levels,yCalc1, 'LineWidth',2, 'Color',colorUnDesired);

xlabel('Glucose Concentration $(mmolL^{-1})$','interpreter','latex','FontSize', xlabelFontSize);
ylabel('Mean Red Intensity','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
   
title('Glucose Concentration Vs. Red Component Intensity',...
      'FontSize', titleFontSize,'interpreter','latex');

%ylim([100, 255])
ax2 = gca; 
ax2.FontSize = tickFontSize;
%set(ax2,'XTickLabel',glucose_levels)

grid on
%grid minor


%% End of Program