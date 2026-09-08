clear; clc; close all

scriptDir = fileparts(mfilename('fullpath'));

set(0, 'DefaultTextInterpreter', 'LaTeX')
set(0, 'DefaultAxesTickLabelInterpreter', 'LaTeX')
set(0, 'DefaultLegendInterpreter', 'LaTeX')
set(0, 'DefaultFigureRenderer', 'Painters')

set(0, 'DefaultLegendFontSize', 10)
set(0, 'DefaultAxesFontSize', 10)
set(0, 'DefaultTextFontname', 'Times New Roman')
set(0, 'DefaultAxesFontname', 'Times New Roman')

%% Host pipe geometry (aluminum pipe)

a1 = 50e-3;
a2 = a1;
a0 = a1+a2;
b0 = 50e-3;
d0 = 5e-3;

d2 = d0;

c1 = b0 + 2 * d0;
c2 = b0 + 2 * d2;

%% Piezoelectric element (PZT-5H)
h_p = 4e-3;
a_p = 4e-3;
a_m = 20e-3;
a_h = a_m/2;
theta_p = pi/18;

s_44_E = 4.35e-11;
d_24 = 7.41e-10;
epsilon_0 = 8.854187817e-12;
epsilon_22_T = 3130 * epsilon_0;

%% Proof mass (lead)
rho_r = 11600;
m = a_m^2*a_h * rho_r ;

k_24 = d_24 / sqrt(epsilon_22_T * s_44_E);
C_p2_T = (a_p * h_p) * epsilon_22_T / (theta_p * (c1+h_p)/2);
C_p2_S = C_p2_T * (1 - k_24 ^ 2);
G_p_SC = 1/s_44_E;
G_p_OC = G_p_SC / (1 - k_24 ^ 2);

%% Parameter sweep

% Sweep gamma_2 to obtain the effective shear-modulus curve.
Np = 10000;
gamma_2 = linspace(-2, 1, Np); 

G_p = zeros(Np,1);
for n = 1:Np
    % gamma_2 changes the open-circuit effective shear modulus through coupling.
    ratio = 1 - k_24^2 / (1 + (1 - k_24^2)/gamma_2(n));
    G_p(n) = G_p_OC * ratio;

end

% Normalize by the short-circuit shear modulus and remove pole-region outliers.
G_p_norm = G_p / G_p_SC;
threshold = 500;
G_p_norm(abs(G_p_norm) > threshold) = NaN;

figure(1)

hold on
yl = [-300 300];
grey = [0.8 0.8 0.8];
patch([-1 -0.545455 -0.545455 -1], [yl(1) yl(1) yl(2) yl(2)], grey, 'EdgeColor','none', 'FaceAlpha',1);

plot(gamma_2 , G_p_norm, 'color',[255/255,127/255,126/255], 'linewidth',1.5, 'LineStyle','-')
xline(k_24^2-1,'linewidth',1, 'LineStyle','--', 'Color','k');
yline(1,'linewidth',1, 'LineStyle','-.', 'Color', 'b');

hold off

set(gca, 'YLim', [-10 10])
xlabel('$\gamma_2$');
ylabel('$s_{\mathrm{44}}^{E} G_{\mathrm{p}}$');
set(gca, 'YAxisLocation', 'left');

grid on
box on

text(-0.4, -5, '$\leftarrow \gamma_2=k_{24}^2-1$', 'FontSize', 9);

%% Export
ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 75;
height = resolution * 55;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])

saveas(gcf, fullfile(scriptDir, 'fig04_effective_shear_modulus.svg'));
