%% SIMULACIÓN Y ANÁLISIS DE SEÑALES CON LA TRANSFORMADA DE FOURIER
% Alumno: [Tu Nombre]
% Actividad Formativa 2 - Transformada de Fourier
% MATLAB Online

clear;
close all;
clc;

%% PARÁMETROS GENERALES

Fs = 1000;                % Frecuencia de muestreo (Hz)
t = -1:1/Fs:1;            % Vector de tiempo de -1 a 1 s

%% ---------------------------------------------------------------------
%% SEÑAL 1: Pulso Rectangular

% Definición del pulso rectangular
x_rect = (abs(t) <= 0.25);

% Gráfica en el dominio del tiempo
figure;
plot(t, x_rect, 'LineWidth', 2);
title('Pulso Rectangular');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% FFT del pulso rectangular
N = length(x_rect);
X_rect = fft(x_rect);
f = (-N/2:N/2-1)*(Fs/N);

% Magnitud
X_rect_mag = abs(fftshift(X_rect));

% Fase
X_rect_phase = angle(fftshift(X_rect));

% Graficar espectro de magnitud
figure;
plot(f, X_rect_mag, 'LineWidth', 2);
title('Espectro de Magnitud - Pulso Rectangular');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

% Graficar espectro de fase
figure;
plot(f, X_rect_phase, 'LineWidth', 2);
title('Espectro de Fase - Pulso Rectangular');
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
grid on;

%% ---------------------------------------------------------------------
%% SEÑAL 2: Función Escalón

% Definición de la función escalón
x_step = (t >= 0);

% Gráfica en el dominio del tiempo
figure;
plot(t, x_step, 'LineWidth', 2);
title('Función Escalón');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% FFT de la función escalón
X_step = fft(x_step);

% Magnitud
X_step_mag = abs(fftshift(X_step));

% Fase
X_step_phase = angle(fftshift(X_step));

% Graficar espectro de magnitud
figure;
plot(f, X_step_mag, 'LineWidth', 2);
title('Espectro de Magnitud - Función Escalón');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

% Graficar espectro de fase
figure;
plot(f, X_step_phase, 'LineWidth', 2);
title('Espectro de Fase - Función Escalón');
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
grid on;

%% ---------------------------------------------------------------------
%% SEÑAL 3: Señal Senoidal

% Definición de la señal senoidal
f_sin = 50;                     % Frecuencia en Hz
x_sin = sin(2*pi*f_sin*t);

% Gráfica en el dominio del tiempo
figure;
plot(t, x_sin, 'LineWidth', 2);
title('Señal Senoidal (50 Hz)');
xlabel('Tiempo (s)');
ylabel('Amplitud');
grid on;

% FFT de la señal senoidal
X_sin = fft(x_sin);

% Magnitud
X_sin_mag = abs(fftshift(X_sin));

% Fase
X_sin_phase = angle(fftshift(X_sin));

% Graficar espectro de magnitud
figure;
plot(f, X_sin_mag, 'LineWidth', 2);
title('Espectro de Magnitud - Señal Senoidal');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

% Graficar espectro de fase
figure;
plot(f, X_sin_phase, 'LineWidth', 2);
title('Espectro de Fase - Señal Senoidal');
xlabel('Frecuencia (Hz)');
ylabel('Fase (rad)');
grid on;

%% ---------------------------------------------------------------------
%% VERIFICACIÓN DE PROPIEDADES DE LA TRANSFORMADA DE FOURIER

%% --- PROPIEDAD 1: Linealidad

% Señales de prueba
x1 = sin(2*pi*50*t);
x2 = cos(2*pi*120*t);
a1 = 2;
a2 = 0.5;

% Combinación lineal
x_sum = a1*x1 + a2*x2;

% FFT
X_sum = fftshift(fft(x_sum));

% Gráfica
figure;
plot(f, abs(X_sum), 'LineWidth', 2);
title('Magnitud FFT - Linealidad');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

%% --- PROPIEDAD 2: Desplazamiento en el Tiempo

% Desplazamiento de la señal senoidal
t0 = 0.1; % desplazamiento de 0.1 s
x_shift = sin(2*pi*50*(t - t0));

% FFT
X_shift = fftshift(fft(x_shift));

% Gráfica
figure;
plot(f, abs(X_shift), 'LineWidth', 2);
title('Magnitud FFT - Desplazamiento en el Tiempo');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

%% --- PROPIEDAD 3: Escalamiento en Frecuencia

% Escalamiento en el tiempo (reduce la frecuencia)
a = 0.5;
x_scaled = sin(2*pi*50*a*t);

% FFT
X_scaled = fftshift(fft(x_scaled));

% Gráfica
figure;
plot(f, abs(X_scaled), 'LineWidth', 2);
title('Magnitud FFT - Escalamiento en Frecuencia');
xlabel('Frecuencia (Hz)');
ylabel('|X(f)|');
grid on;

%% ---------------------------------------------------------------------
%% FIN DEL SCRIPT
disp('Simulación completada.');
