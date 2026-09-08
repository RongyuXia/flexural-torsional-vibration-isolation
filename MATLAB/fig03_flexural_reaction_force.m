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
% Sweep the circuit parameter and excitation frequency to build the reaction-force map.
Np1 = 200;
gamma_1 = linspace(-2, 0, Np1);

Np2 = 1000;
omega = linspace(1, 2*pi*20000, Np2);

FN1 = zeros(Np2, Np1);

%% Calculation
for i = 1:Np2
    omega_i = omega(i);
    for j = 1:Np1
        gamma_1_j = gamma_1(j);
        
        % Compute the effective modulus, piezoelectric stiffness, and mass reaction force.
        ratio = 1 - k_33^2 / (1 + (1 - k_33^2)/gamma_1_j); 
        E_p = E_p_OC * ratio; 
        k_p = E_p * a_p^2 / h_p; 
        
        FN1(i,j) = -(k_p * m * omega_i^2) / (k_p - m * omega_i^2); 
    end
end

%% Plot
figure
pcolor(gamma_1, omega/2/pi/1000, FN1);
shading interp;
axis tight
colormap jet;

FN_min = prctile(FN1(:), 1);
FN_max = prctile(FN1(:), 99);
clim([-FN_max FN_max]);

 [fmin , fmax] = clim;
c = colorbar;
c.Ticks = linspace(fmin , fmax , 3);

xlabel('$\gamma_1$');
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

saveas(gcf, fullfile(scriptDir, 'fig03_flexural_reaction_force.svg'));
