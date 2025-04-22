% tp3_LIT.m
% Práctica 3: Sistemas LIT por ecuaciones en diferencias
% UCAB - Ingeniería en Telecomunicaciones

%% Definiciones comunes
n      = -10:30;          % rango de muestras
imp   = (n == 0);         % impulso δ[n]
step  = (n >= 0);         % escalón U[n]

%% Sistema 1: y[n] = 0.0675 x[n] + 0.1349 x[n-1] + 0.0675 x[n-2]
%           + 1.143 y[n-1] – 0.4128 y[n-2]
b1 = [0.0675, 0.1349, 0.0675];     % coeficientes de entrada
a1 = [1,     -1.143,  0.4128];     % coeficientes de lazo (notar el signo)

% Respuestas
y1_imp  = filter(b1, a1, imp);
y1_step = filter(b1, a1, step);

% Gráfica
figure('Name','Sistema 1','NumberTitle','off')
subplot(2,1,1)
stem(n, y1_imp, 'filled')
title('S1 – Respuesta al Impulso δ[n]')
xlabel('n'), ylabel('y[n]'), grid on

subplot(2,1,2)
stem(n, y1_step, 'filled')
title('S1 – Respuesta al Escalón u[n]')
xlabel('n'), ylabel('y[n]'), grid on


%% Sistema 2: y[n] = 0.0675 x[n] + 0.1349 x[n-1] + 0.0675 x[n-2]
%           – 1.143 y[n-1] + 0.4128 y[n-2]
b2 = b1;                      % misma parte FIR
a2 = [1, +1.143, -0.4128];    % ojo: cambiamos signos para el lazo

% Respuestas
y2_imp  = filter(b2, a2, imp);
y2_step = filter(b2, a2, step);

% Gráfica
figure('Name','Sistema 2','NumberTitle','off')
subplot(2,1,1)
stem(n, y2_imp, 'filled')
title('S2 – Respuesta al Impulso δ[n]')
xlabel('n'), ylabel('y[n]'), grid on

subplot(2,1,2)
stem(n, y2_step, 'filled')
title('S2 – Respuesta al Escalón u[n]')
xlabel('n'), ylabel('y[n]'), grid on


%% Clasificación de estabilidad
p1 = roots(a1);   % polos de S1
p2 = roots(a2);   % polos de S2

fprintf('\nPolos Sistema 1:\n'), disp(p1)
if all(abs(p1)<1)
    fprintf('→ Sistema 1 ESTABLE (|p|<1)\n')
else
    fprintf('→ Sistema 1 INESTABLE (algún |p|≥1)\n')
end

fprintf('\nPolos Sistema 2:\n'), disp(p2)
if all(abs(p2)<1)
    fprintf('→ Sistema 2 ESTABLE (|p|<1)\n')
else
    fprintf('→ Sistema 2 INESTABLE (algún |p|≥1)\n')
end
