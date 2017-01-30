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

%% Get List of files in source dictionary
%listing = dir('C:\Users\sajil\Desktop\Glucose_Sensor');

%% Image Processing Steps as mentioned in the original paper

% The data were obtained from three repetitive experiments. 
% The gray value was measured by the ImageJ software after the 
% subtraction of blank gray value.
% Linear correlation between gray intensity and glucose concentration.


%% Import Data
RGB1 = imread('Sample_0_5.tif');
RGB2 = imread('Sample_5_5.tif');
RGB3 = imread('Sample_10_5.tif');
RGB4 = imread('Sample_15_5.tif');
RGB5 = imread('Sample_20_5.tif');

%% Processs data

% Show the original file
%figure(1)
%imshow(RGB)

%% Filter out Red Component
I1 = RGB1(:,:,1);
I2 = RGB2(:,:,1);
I3 = RGB3(:,:,1);
I4 = RGB4(:,:,1);
I5 = RGB5(:,:,1);

%% Convert to Grey Scale

% I1 = rgb2gray(RGB1);
% I2 = rgb2gray(RGB2);
% I3 = rgb2gray(RGB3);
% I4 = rgb2gray(RGB4);
% I5 = rgb2gray(RGB5);

%figure(2)
%imshow(I)

% Histogram Plot of Image
%figure(3)
%imhist(I)

%% Reshape Matrices to Vectors

colVector1 = reshape(I1,[],1);
colVector2 = reshape(I2,[],1);
colVector3 = reshape(I3,[],1);
colVector4 = reshape(I4,[],1);
colVector5 = reshape(I5,[],1);

%figure(4)
%h = histogram(colVector,20);

%% Box Plot
figure(5)

boxplot([colVector1 colVector2 colVector3 colVector4 colVector5]);

xlabel('Glucose Concentration $(mmolL^{-1})$','interpreter','latex','FontSize', xlabelFontSize);
ylabel('Intensity $(a. u.)$','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('Glucose Concentration Vs. Red Component Intensity',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'XTickLabel',0.5:5:20.5)
grid on

h = findobj('Tag','Box');
set(h,'Linewidth',1.5, 'Color', 'k');

%grid minor


%% Regression Analysis

figure(6)
mu = [mean2(I1) mean2(I2) mean2(I3) mean2(I4) mean2(I5)]';
glucose_levels = (0.5:5:20.5)';
b1 = glucose_levels\mu;

yCalc1 = b1*glucose_levels;
scatter(glucose_levels, mu,'Marker', 'S','MarkerFaceColor', 'k');
hold on
plot(glucose_levels,yCalc1, 'LineWidth',2, 'Color',colorUnDesired);

xlabel('Glucose Concentration $(mmolL^{-1})$','interpreter','latex','FontSize', xlabelFontSize);
ylabel('Mean Red Intensity','interpreter','latex','FontSize', ylabelFontSize,...
       'FontWeight','bold');
title('Glucose Concentration Vs. Red Component Intensity',...
      'FontSize', titleFontSize,'interpreter','latex');

ax = gca; 
ax.FontSize = tickFontSize;
set(ax,'XTickLabel',0.5:5:20.5)
grid on
%grid minor


%% End of Program