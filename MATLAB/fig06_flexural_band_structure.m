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
J2 = 1 / 64 * pi * (c2 ^ 4 - b0 ^ 4);
A1 = A2;
J1 = J2;

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
m = a_m^2*a_h * rho_r;

k_33 = d_33 / sqrt(epsilon_33_T * s_33_E);
C_p1_T = 2*(c1/2+h_p) * tan(theta_p/2) * a_p * epsilon_33_T / h_p;
C_p1_S = C_p1_T * (1 - k_33 ^ 2);
E_p_SC = 1/s_33_E;
E_p_OC = E_p_SC / (1 - k_33 ^ 2);

%% Calculation
% Build the transfer matrix at each frequency and extract the Bloch wavenumber.
gamma_1 = -1.005;

Np = 5000;
omega = linspace(1, 2*pi*20000, Np); 

k = zeros(Np, 4);
for n = 1:Np
    % Evaluate the piezoelectric effective parameters and bending force at this frequency.
    Z1 = 1 / (1i * omega(n) * C_p1_T * gamma_1) ;

    ratio = 1 - k_33^2 / (1 + 1i*omega(n)*C_p1_S*Z1);

    E_p = E_p_OC * ratio;
    E_p = E_p_OC;
    E_p = E_p_SC;

    k_p = E_p * a_p ^ 2 / h_p;
    Fn = -omega(n) ^ 2 * m * k_p / (-omega(n) ^ 2 * m + k_p)  *2  ;

    alpha1 = -rho * omega(n) ^ 2 / E - rho * omega(n) ^ 2 / (kappa * G);
    beta1 = A1 * rho * omega(n) ^ 2 / (E * J1) - rho ^ 2 * omega(n) ^ 4 / (E * G * kappa);
    alpha2 = -rho * omega(n) ^ 2 / E - rho * omega(n) ^ 2 / (kappa * G);
    beta2 = A2 * rho * omega(n) ^ 2 / (E * J2) - rho ^ 2 * omega(n) ^ 4 / (E * G * kappa);

    k1 = 1i * sqrt((alpha1 + sqrt(alpha1 ^ 2 + 4 * beta1)) / 2);
    k2 = 1i * sqrt((alpha1 - sqrt(alpha1 ^ 2 + 4 * beta1)) / 2);
    k3 = -1i * sqrt((alpha1 + sqrt(alpha1 ^ 2 + 4 * beta1)) / 2);
    k4 = -1i * sqrt((alpha1 - sqrt(alpha1 ^ 2 + 4 * beta1)) / 2);
    k5 = 1i * sqrt((alpha2 + sqrt(alpha2 ^ 2 + 4 * beta2)) / 2);
    k6 = 1i * sqrt((alpha2 - sqrt(alpha2 ^ 2 + 4 * beta2)) / 2);
    k7 = -1i * sqrt((alpha2 + sqrt(alpha2 ^ 2 + 4 * beta2)) / 2);
    k8 = -1i * sqrt((alpha2 - sqrt(alpha2 ^ 2 + 4 * beta2)) / 2);

    c1 = ( E*J1*rho*omega(n)^2 + G*A1*kappa * G*kappa ) / ( G*A1*kappa - rho*J1*omega(n)^2 ) / (G*kappa);
    d1 = E*J1 / ( G*A1*kappa - rho*J1*omega(n)^2 );
    c2 = ( E*J2*rho*omega(n)^2 + G*A2*kappa * G*kappa ) / ( G*A2*kappa - rho*J2*omega(n)^2 ) / (G*kappa);
    d2 = E*J2 / ( G*A2*kappa - rho*J2*omega(n)^2 );

    % H/K matrices describe the end states and interface continuity conditions.
    H1 = [exp(1i*k5*a2) , exp(1i*k6*a2) , exp(1i*k7*a2) , exp(1i*k8*a2);
          (-1i*d2*k5^3 + 1i*c2*k5) * exp(1i*k5*a2) , (-1i*d2*k6^3 + 1i*c2*k6) * exp(1i*k6*a2), ......
          (-1i*d2*k7^3 + 1i*c2*k7) * exp(1i*k7*a2) , (-1i*d2*k8^3 + 1i*c2*k8) * exp(1i*k8*a2);
          (d2*k5^4 - c2*k5^2) * exp(1i*k5*a2) , (d2*k6^4 - c2*k6^2) * exp(1i*k6*a2) ,......
          (d2*k7^4 - c2*k7^2) * exp(1i*k7*a2) , (d2*k8^4 - c2*k8^2) * exp(1i*k8*a2);
          (1i*d2*k5^3 + 1i*(1-c2)*k5) * exp(1i*k5*a2), (1i*d2*k6^3 + 1i*(1-c2)*k6) * exp(1i*k6*a2),......
          (1i*d2*k7^3 + 1i*(1-c2)*k7) * exp(1i*k7*a2), (1i*d2*k8^3 + 1i*(1-c2)*k8) * exp(1i*k8*a2);
                ];
    
    K1 = [exp(-1i*k1*a1) , exp(-1i*k2*a1) , exp(-1i*k3*a1) , exp(-1i*k4*a1) ;
          (-1i*d1*k1^3 + 1i*c1*k1) * exp(-1i*k1*a1) , (-1i*d1*k2^3 + 1i*c1*k2) * exp(-1i*k2*a1),......
          (-1i*d1*k3^3 + 1i*c1*k3) * exp(-1i*k3*a1) , (-1i*d1*k4^3 + 1i*c1*k4) * exp(-1i*k4*a1);
          E*J1/E/J2 * (d1*k1^4 - c1*k1^2) * exp(-1i*k1*a1) , E*J1/E/J2 * (d1*k2^4 - c1*k2^2) * exp(-1i*k2*a1),......
          E*J1/E/J2 * (d1*k3^4 - c1*k3^2) * exp(-1i*k3*a1) , E*J1/E/J2 * (d1*k4^4 - c1*k4^2) * exp(-1i*k4*a1);
          G*kappa*A1/G/kappa/A2 * (1i*d1*k1^3 + 1i*(1-c1)*k1) * exp(-1i*k1*a1) , G*kappa*A1/G/kappa/A2 * (1i*d1*k2^3 + 1i*(1-c1)*k2) * exp(-1i*k2*a1),......
          G*kappa*A1/G/kappa/A2 * (1i*d1*k3^3 + 1i*(1-c1)*k3) * exp(-1i*k3*a1) , G*kappa*A1/G/kappa/A2 * (1i*d1*k4^3 + 1i*(1-c1)*k4) * exp(-1i*k4*a1);
                ];

    H2 = [ 1  ,  1  ,  1  ,  1  ;
           -1i*d2*k5^3 + 1i*c2*k5 , -1i*d2*k6^3 + 1i*c2*k6 ,......
           -1i*d2*k7^3 + 1i*c2*k7 , -1i*d2*k8^3 + 1i*c2*k8 ;
           d2*k5^4 - c2*k5^2 , d2*k6^4 - c2*k6^2 ,......
           d2*k7^4 - c2*k7^2 , d2*k8^4 - c2*k8^2;
           1i*d2*k5^3 + 1i*(1-c2)*k5 , 1i*d2*k6^3 + 1i*(1-c2)*k6 ,......
           1i*d2*k7^3 + 1i*(1-c2)*k7 , 1i*d2*k8^3 + 1i*(1-c2)*k8 ;
                    ];

    K2 = [ 1  ,  1  ,  1  ,  1  ;
          -1i*d1*k1^3 + 1i*c1*k1 , -1i*d1*k2^3 + 1i*c1*k2 , -1i*d1*k3^3 + 1i*c1*k3 , -1i*d1*k4^3 + 1i*c1*k4;
          E*J1/E/J2 * (d1*k1^4 - c1*k1^2) , E*J1/E/J2 * (d1*k2^4 - c1*k2^2) ,......
          E*J1/E/J2 * (d1*k3^4 - c1*k3^2) , E*J1/E/J2 * (d1*k4^4 - c1*k4^2) ;
          G*kappa*A1/G/kappa/A2 * (1i*d1*k1^3 + 1i*(1-c1)*k1) + Fn/G/kappa/A2, G*kappa*A1/G/kappa/A2 * (1i*d1*k2^3 + 1i*(1-c1)*k2) + Fn/G/kappa/A2,......
          G*kappa*A1/G/kappa/A2 * (1i*d1*k3^3 + 1i*(1-c1)*k3) + Fn/G/kappa/A2, G*kappa*A1/G/kappa/A2 * (1i*d1*k4^3 + 1i*(1-c1)*k4) + Fn/G/kappa/A2;
                    ];

    % Eigenvalues of the unit-cell transfer matrix give the complex Bloch wavenumber.
    T = inv(H2) * K2 * inv(K1) * H1;

    k(n, :) = -1i / a0 * log(sort(eig(T))).';
end

co = get(gca, 'ColorOrder');

%% Export
figure(1)
plot(abs(real(k(:,2))) * a0, omega/2/pi/1000, 'color',[co(1,:) 1], 'linewidth',2, 'LineStyle','-')

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
saveas(gcf, fullfile(scriptDir, 'fig06_flexural_band_structure_real.svg'));

figure(2)
plot(imag(k(:,2)) * a0, omega/2/pi/1000, 'color',[co(2,:) 1], 'linewidth',2, 'LineStyle','-')
xlabel('$\mathrm{Im}(k_x a_0)$');
ylabel('Frequency (kHz)');
set(gca, 'XDir', 'reverse')
grid on
box on
text(0.95, 18.25, 'Short circuit', 'FontSize', 9);

ppi = get(0, 'ScreenPixelsPerInch');
resolution = ppi / 25.4;
sz = get(0, 'ScreenSize');
width = resolution * 40;
height = resolution * 65;
left = (sz(3) - width) / 2 - width / 2;
bottem = (sz(4) - height) / 2;
set(gcf, 'Position', [left, bottem, width, height])
saveas(gcf, fullfile(scriptDir, 'fig06_flexural_band_structure_imag.svg'));
