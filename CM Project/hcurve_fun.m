function [h] = hcurve_fun(y,anzeige,N)
% Übung: Experimentelle Methoden der Mechanik
% Berechnung einer Hüllkurve im Rahmen der Projektarbeit WS 2017/2018
% Prof. Dr.-Ing. P. Kraemer
% Institut für Maschinendiagnose / Maschinendynamik
% Fachbereich Mechatronik und Maschinenbau
% Bochum University of Applied Sciences 
% Programmierer: Peter Kraemer
% Datum: 10.12.2017

% [h] = huellkurv_fun(y,anzeige,N)
% h = Huellkurve mit Hilfe der Hilberttransformation als output
% y = Signal als input
% anzeige = 1: Mittelwerte des Signals werden vom Signal abgezogen; 
% anzeige = 0: -
% N = anzahl der Datenpunkte

if anzeige == 1
    y = y - mean(y);
end
hilb = hilbert(y,N);
h = sqrt(real(hilb).^2+imag(hilb).^2);