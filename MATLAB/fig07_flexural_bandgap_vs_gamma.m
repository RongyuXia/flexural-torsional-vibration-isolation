clear; clc; close all

set(0, 'DefaultTextInterpreter', 'LaTeX')
set(0, 'DefaultAxesTickLabelInterpreter', 'LaTeX')
set(0, 'DefaultLegendInterpreter', 'LaTeX')
set(0, 'DefaultFigureRenderer', 'Painters')

set(0, 'DefaultLegendFontSize', 10)
set(0, 'DefaultAxesFontSize', 10)
set(0, 'DefaultTextFontname', 'Times New Roman')
set(0, 'DefaultAxesFontname', 'Times New Roman')

%% Load data
scriptDir = fileparts(mfilename('fullpath'));
data = importdata(fullfile(scriptDir, "fig07_flexural_bandgap_data.txt"));
x = data(:,1);
y1 = data(:,2);
y2 = data(:,3);

%% Interpolate
% Use shape-preserving interpolation to smooth the boundaries for bandwidth evaluation.
xq = linspace(min(x), max(x), 2000);
y1q = interp1(x, y1, xq, 'pchip');
y2q = interp1(x, y2, xq, 'pchip');
yc = (y1q + y2q) / 2 + 1e-10;
yrel = (y2q - y1q) ./ yc * 100;

co = get(gca, 'ColorOrder');
figure(1)
hold on

%% Plot
% Plot the bandgap boundaries on the left axis and relative width on the right axis.
yyaxis left

fill([xq, fliplr(xq)], [y1q, fliplr(y2q)], [0.8,0.8,0.8], 'FaceAlpha', 1, 'EdgeColor', 'none');
h1 = plot(xq, y1q, 'color', [002/255 048/255 074/255],'linewidth',1.5, 'LineStyle','--'); 
h2 = plot(xq, y2q, 'color', [250/255 134/255 000/255],'linewidth',1.5, 'LineStyle','--');

hold off
ylabel('Frequency (kHz)');

yyaxis right
h3 = plot(xq, yrel, 'color', [220/255 109/255 087/255],'linewidth',1.5, 'LineStyle','-'); 
ylabel('$\mathrm{Relative\ bandgap\ width}\ (\%)$');

legend([h1 h2 h3], {'Lower boundary','Upper boundary','Relative bandgap width'}, 'Location','southwest')

set(gca, 'XLim', [-7 -1])
set(gca, 'YLim', [0 100])
xlabel('$\gamma_1$');

grid on
box on

ax = gca;
ax.YAxis(1).Color = 'k';
ax.YAxis(2).Color = [220/255 109/255 087/255];

ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 75;
height = resolution * 55;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])

%% Export
saveas(gcf, fullfile(scriptDir, 'fig07_flexural_bandgap_vs_gamma.svg'));
