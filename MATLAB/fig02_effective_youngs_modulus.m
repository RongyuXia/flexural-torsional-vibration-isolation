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

s_33_E = 2.07e-11;
d_33 = 5.93e-10;
epsilon_0 = 8.854187817e-12;
epsilon_33_T = 3400 * epsilon_0;

%% Proof mass (lead)
rho_r = 11600;
m = a_m^2*a_h * rho_r ;

k_33 = d_33 / sqrt(epsilon_33_T * s_33_E);
C_p1_T = 2*(c1/2+h_p) * tan(theta_p/2) * a_p * epsilon_33_T / h_p;
C_p1_S = C_p1_T * (1 - k_33 ^ 2);
E_p_SC = 1/s_33_E;
E_p_OC = E_p_SC / (1 - k_33 ^ 2);

%% Parameter sweep

% Sweep the circuit parameter gamma_1 to calculate the effective Young's modulus.
Np = 2000;
gamma_1 = linspace(-1.5, 0.5, Np); 

E_p = zeros(Np,1);
for n = 1:Np
    % Evaluate the modulus correction factor from the electromechanical coupling.
    ratio = 1 - k_33^2 / (1 + (1 - k_33^2)/gamma_1(n)) ;
    E_p(n) = E_p_OC * ratio;

end

% Normalize by the short-circuit value and mask pole-induced outliers.
E_p_norm = E_p / E_p_SC;
threshold = 500;
E_p_norm(abs(E_p_norm) > threshold) = NaN;

figure(1)

hold on
yl = [-30 30];
grey = [0.8 0.8 0.8];

patch([-1 -0.4374 -0.4374 -1], [yl(1) yl(1) yl(2) yl(2)], grey, 'EdgeColor','none', 'FaceAlpha',1);

plot(gamma_1 , E_p_norm, 'color',[255/255,127/255,126/255], 'linewidth',1.5, 'LineStyle','-')
xline(k_33^2-1,'linewidth',1, 'LineStyle','--', 'Color','k');
yline(1,'linewidth',1, 'LineStyle','-.', 'Color','b');

hold off

set(gca, 'YLim', [-10 10])
xlabel('$\gamma_1$');
ylabel('$s_{\mathrm{33}}^{E} E_{\mathrm{p}}$');
set(gca, 'YAxisLocation', 'left');

grid on
box on

text(-0.4, -5, '$\leftarrow \gamma_1=k_{33}^2-1$', 'FontSize', 9);

%% Export
ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 75;
height = resolution * 55;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])

saveas(gcf, fullfile(scriptDir, 'fig02_effective_youngs_modulus.svg'));
