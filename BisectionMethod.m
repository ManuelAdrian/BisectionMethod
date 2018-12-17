%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplo 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f(x) = 0.5*pi*x^2 - x^2*asin(0.15/x) - 0.15*(x^2 - 0.15^2)^(0.5) - 1.24
% v   = [0.5,1]
% Tol = 0.00001

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplo 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% f   = cos(x) - sqrt(x)
% v   = [0,pi/4];
% Tol = 0.0005;

clc
clear all

syms x

f   = input('ingrese la funcion a evaluar, f(x) = ');
v   = input('ingrese el intervalo donde se va a evaluar la funcion, [a, b] = ');
Tol = input('ingrese el valor de tolerancia: ');

i   = 1;

fprintf('\n %2s %8s %10s %10s %11s %11s\n','n','a(n)','b(n)','p(n)','f(p(n))','b(n)-a(n)');

while abs(v(2) - v(1)) > 0
    if subs(f,v(1))*subs(f,v(2)) < 0
        p(i) = v(1) + ((v(2) - v(1))/2);
        cot  = subs(f,p(i));    
        sz   = v(2) - v(1);
        fprintf('%3.0i | %2.6f | %2.6f | %2.6f | %2.6f | %2.6f\n',i,v(1),v(2),p(i),cot,sz)
        if abs(subs(f,p(i))) < Tol
            fprintf('\n')
            disp('Tolerancia alcanzada')
            break
        end
        if subs(f,p(i)) == 0
            disp('Solucion exacta encontrada')
            p(i)
            break
        end
        if subs(f,p(i))*subs(f,v(2)) < 0
            v(1) = p(i);
        else
            v(2) = p(i);
        end
        i = i + 1;
    else
        disp('Ingrese un nuevo intervalo')
        break
    end
end