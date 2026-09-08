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
% Load torsional transmission data for short-circuit (SC) and non-short-circuit (NC) cases.
scriptDir = fileparts(mfilename('fullpath'));
data1 = importdata(fullfile(scriptDir, "fig13_torsional_transmission_sc.txt"));
x1 = data1(:,1);
y1 = data1(:,2);

data2 = importdata(fullfile(scriptDir, "fig13_torsional_transmission_nc.txt"));
x2 = data2(:,1);
y2 = data2(:,2);

co = get(gca, 'ColorOrder');
%% Plot
% Shaded regions indicate bandgaps; curves compare the two transmission responses.
figure(1)
hold on

yl = [1e-9 100];
grey = [0.8 0.8 0.8];

patch([1.75 2.10 2.10 1.75], [yl(1) yl(1) yl(2) yl(2)], grey, 'EdgeColor','none', 'FaceAlpha',1);

patch([1.00 1.185 1.185 1.000], [yl(1) yl(1) yl(2) yl(2)], grey, 'EdgeColor','none', 'FaceAlpha',1);

h1 = plot(x1 , y1, 'color', [071/255 133/255 172/255],'linewidth',1, 'LineStyle','-.');
h2 = plot(x2 , y2, 'color', [255/255 127/255 126/255],'linewidth',1, 'LineStyle','-');

legend([h1 h2], {'Short circuit','NC circuit'}, 'Location','southeast')
hold off

set(gca, 'YScale', 'log');
set(gca, 'YLim', [1e-9 100])
xlabel('Frequency (kHz)');
ylabel('Transmission');
set(gca, 'YAxisLocation', 'left');

set(gca, 'YTick', [1e-8 1e-2 1e0]);

grid on
box on

ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 75;
height = resolution * 45;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])

%% Export
saveas(gcf, fullfile(scriptDir, 'fig13_torsional_transmission.svg'));
