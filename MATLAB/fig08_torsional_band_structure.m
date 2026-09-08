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

%% Host pipe material (aluminum)
E = 70e9;
rho = 2700;
nu = 0.36;
G = E / 2 / (1 + nu);
kappa = 6 * (1+nu)^2 / (7 + 12*nu + 4*nu^2);
A2 = 1/4 * pi * ( c2^2 - b0^2 );
J2 = 1 / 32 * pi * (c2 ^ 4 - b0 ^ 4);

A1 = A2; 
J1 = J2;

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
C_p2_T = (2*pi*epsilon_22_T*a_p)/((log(68/60)))/36;

C_p2_S = C_p2_T * (1 - k_24 ^ 2);
G_p_SC = 1/s_44_E;
G_p_OC = G_p_SC / (1 - k_24 ^ 2);

%% Calculation
% Calculate the torsional unit-cell transfer matrix and complex Bloch wavenumber.
gamma_2 = -0.34;

Np = 5000;
omega = linspace(1, 2*pi*3000, Np); 

k = zeros(Np, 2);
for n = 1:Np
    % Update the effective shear modulus and applied torque for the external circuit.
    Z1 = 1 / (1i * omega(n) * C_p2_T * gamma_2) ;

    ratio = 1 - k_24^2 / (1 + 1i*omega(n)*C_p2_S*Z1);
    G_p = G_p_OC * ratio;

    R = c2/2;

    K = G_p * a_p * theta_p * (c2/2)^2 ;
    Fn = omega(n)^2 * m * R * K / (omega(n)^2 * m * R - K) ;
    Tn = Fn * 2 * R;

    k1 = sqrt(rho / G) * omega(n);
    k2 = sqrt(rho / G) * omega(n);

    H1 = [exp(1i*k2*a2) , exp(-1i*k2*a2);
          exp(1i*k2*a2) , -exp(-1i*k2*a2)];
    
    K1 = [exp(-1i*k1*a1) , exp(1i*k1*a1);
          J1*G*k1/J2/G/k2 * exp(-1i*k1*a1) , -J1*G*k1/J2/G/k2 * exp(1i*k1*a1)];

    H2 = [ 1  ,  1  ;
           1  , -1 ];

    K2 = [               1                      ,                     1                  ;
           J1*G*k1/J2/G/k2 + Tn/(J2*G*1i*k2) ,  -J1*G*k1/J2/G/k2 + Tn/(J2*G*1i*k2)];

    % Transfer-matrix eigenvalues give propagation constants; real and imaginary parts
    % describe propagation and attenuation, respectively.
    T = inv(H2) * K2 * inv(K1) * H1;

    k(n, :) = -1i / a0 * log( eig(T)).';
end

co = get(gca, 'ColorOrder');

%% Export
figure(1)
plot(abs(real(k)*a0) , omega/2/pi/1000, 'color',[co(1,:) 1], 'linewidth',2, 'LineStyle','-')
set(gca, 'XLim', [0 pi])
xlabel('$\mathrm{Re}(k_x a_0)$');
set(gca, 'YAxisLocation', 'right');
set(gca, 'XTick', [0 1 2 pi]);
set(gca, 'XTickLabel', {'0','1','2','$\pi$'});
grid on
box on

ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 40;
height = resolution * 65;
left = (sz(3) - width) / 2 + width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])
saveas(gcf, fullfile(scriptDir, 'fig08_torsional_band_structure_real.svg'));

figure(2)
plot(abs(imag(k)) * a0, omega/2/pi/1000, 'color',[co(2,:) 1], 'linewidth',2, 'LineStyle','-')
xlabel('$\mathrm{Im}(k_x a_0)$');
ylabel('Frequency (kHz)');
set(gca, 'XDir', 'reverse')
grid on
box on
text(3.7, 2.75, '$C_2/C_{\mathrm{p2}}^{T}=-0.340$', 'FontSize', 9);

ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 40;
height = resolution * 65;
left = (sz(3) - width) / 2 - width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])
saveas(gcf, fullfile(scriptDir, 'fig08_torsional_band_structure_imag.svg'));
