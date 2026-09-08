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
% Sweep the circuit parameter and frequency to calculate the torsional reaction response.
Np1 = 200;
gamma_2 = linspace(-2, 0, Np1);

Np2 = 1000;
omega = linspace(1, 2*pi*3000, Np2);

FN2 = zeros(Np2, Np1);

%% Calculation
for i = 1:Np2
    omega_i = omega(i);
    for j = 1:Np1
        gamma_2_j = gamma_2(j);
        
        % Obtain the piezoelectric torsional stiffness and then calculate the reaction torque.
        ratio = 1 - k_24^2 / (1 + (1 - k_24^2)/gamma_2_j);
        G_p = G_p_OC * ratio;
        R = 1/2*c1;
        K_p = G_p * R^2 * theta_p * a_p;
        
        FN2(i,j) = omega_i^2 * m * R * K_p / (omega_i^2 * m * R - K_p);
    end
end

%% Plot
figure
pcolor(gamma_2, omega/2/pi/1000, FN2);
shading interp;
axis tight
colormap jet;

FN_min = prctile(FN2(:), 5);
FN_max = prctile(FN2(:), 98);
clim([-FN_max FN_max]);

[fmin , fmax] = clim;
c = colorbar;
c.Ticks = linspace(fmin , fmax , 3);

xlabel('$\gamma_2$');
ylabel('Frequency (kHz)');

%% Export
ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 80;
height = resolution * 65;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])

saveas(gcf, fullfile(scriptDir, 'fig05_torsional_reaction_force.svg'));
