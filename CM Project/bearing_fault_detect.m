clc
clear all
close all
fontname='times new roman';
fontsize=16;
linewidth=1.5;
%% Data of the bearing
n_wk = 13; % number of rolling elements
D_w = 3.7 *10^-3; %diameter of rolling element in meter
D_T = 26.15 * 10^-3; % diameter of bearning in meter
alpha_B = 0; % operating contact angle;


load('file_004_23192223.mat');
signal_1_data = datensatz; %data for signal 1
load('file_009_23192223.mat');
signal_2_data = datensatz; %data for signal 2
load('file_023_23192223.mat');
signal_3_data = datensatz; %data for signal 3

%% load data
akt_path = pwd; %path of current directory
savepath = fullfile(akt_path);
x = what(savepath);
x = x.mat;
new_load = 1; % new_load = 0 when running program first time

if new_load == 0
for ii = 2:length(x)
    path_rawdata = fullfile(savepath, x{ii});
    load(path_rawdata);
    M.var(ii-1,1) = var(datensatz);                %variance 
    M.rootms(ii-1,1) = rms(datensatz);             %root mean square
    M.mean(ii-1,1) = mean(datensatz);              %mean/average
    M.kurt(ii-1,1) = kurtosis(datensatz)-3;        %kurtosis
    M.p2r(ii-1,1) = peak2rms(datensatz);           %creast factor
    M.p2p(ii-1,1) = peak2peak(datensatz);          %peak to peak ratio
    M.quant50(ii-1,1) = quantile(datensatz,0.5);   % quantile 50%
    M.fn_all(ii-1,1) = fn;                             %roll over frequency
    M.fs_all(ii-1,1) = fs;                             %sampling frequency
    M.f_cage_fixout(ii-1,1) = calc_cage_frequency_fo(fn, D_w, D_T, alpha_B);
    M.f_cage_fixin(ii-1,1) = calc_cage_frequency_fi(fn, D_w, D_T, alpha_B);
    M.f_out(ii-1,1) = calc_outer_frequency(fn, n_wk, D_w, D_T, alpha_B);
    M.f_in(ii-1,1) = calc_in_frequency(fn, n_wk, D_w, D_T, alpha_B);
    M.f_roller(ii-1,1) = calc_roller_frequency(fn, D_w, D_T, alpha_B);
    M.f_roller_defect_both(ii-1,1) = 2 * calc_roller_frequency(fn, D_w, D_T, alpha_B); %various damage frequencies calculated from defined functions
end
save('Features.mat', '-struct', 'M') % save all the variables in matlab file from structure
else
    load('Features.mat')
end


%% TIME DOMAIN  
%% Plot signal 
for ii = 1:length(x)-1
    path_rawdata = fullfile(savepath, x{ii+1});
    load(path_rawdata);
    figure(ii)
    t = 0:length(datensatz)-1;
    t = t./fs;
    plot(t, datensatz)
    xlim([0 length(datensatz)/fs])
    xlabel('time in seconds')
    ylabel('signal amplitude (m/s^2)')
    title('signal of data', num2str(ii))
    set(gca,'fontname',fontname,'fontsize',fontsize)
    
end

%% Plot probability density of signal
for ii = 1:length(x)-1
    path_rawdata = fullfile(savepath, x{ii+1});
    load(path_rawdata);
    figure(4)
    [f_pdf, x_pdf] = ksdensity(datensatz);
    plot(x_pdf,f_pdf,'LineWidth',2)
    hold on;
    xlabel('Amplitude (m/s^2)')
    ylabel('probability')
    title('PDF of signal 1, signal 2 and signal 3')
    set(gca,'fontname',fontname,'fontsize',fontsize)
end
legend('signal 1', 'signal 2', 'signal 3')


%% Plot  Cumulative distribution function (CDF)
for ii = 1:length(x)-1
    path_rawdata = fullfile(savepath, x{ii+1});
    load(path_rawdata);
    figure(5)
    [f_cdf, x_cdf] = ecdf(datensatz);
    plot(x_cdf,f_cdf,'LineWidth',2)
    hold on;
    xlabel('Amplitude (m/s^2)')
    ylabel('Cumulative probability')
    title('CDF of signal 1, signal 2 and signal 3')
    set(gca,'fontname',fontname,'fontsize',fontsize)
end
legend('signal 1', 'signal 2', 'signal 3')

%% FREQUENCY DOMAIN
%% Fourier Transform of signal

% signal 1
delta_f1 = fs_all(1) / length(signal_1_data);
x_axis1 = 0:delta_f1:fs_all(1)- delta_f1;
fft1 = fft(signal_1_data);
figure(6)
plot(x_axis1,sqrt(conj(fft1).*fft1)*delta_f1/(fs_all(1)/2)); xlim([0 20000])
xlabel('discrete frequency in Hz')
ylabel('|{\itA}({\itf}) | in m/s^2')
set(gca,'fontname',fontname,'fontsize',fontsize)
title('FFT of signal 1')

% signal 2
delta_f2 = fs_all(2) / length(signal_2_data);
x_axis2 = 0:delta_f2:fs_all(2)- delta_f2;
fft2 = (fft(signal_2_data));
figure(7)
plot(x_axis2, sqrt(conj(fft2).*fft2)*delta_f2/(fs_all(2)/2), 'Color','r'); xlim([0 20000])
xlabel('discrete frequency in Hz')
ylabel('|{\itA}({\itf}) | in m/s^2')
set(gca,'fontname',fontname,'fontsize',fontsize)
title('FFT of signal 2')

% signal 3
delta_f3= fs_all(3) / length(signal_3_data);
x_axis3 = 0:delta_f3:fs_all(3)- delta_f3;
fft3 = (fft(signal_3_data)); 
figure(8)
plot(x_axis3, sqrt(conj(fft3).*fft3)*delta_f3/(fs_all(3)/2), 'Color', 'g'); xlim([0 20000])
xlabel('discrete frequency in Hz')
ylabel('|{\itA}({\itf}) | in m/s^2')
set(gca,'fontname',fontname,'fontsize',fontsize)
title('FFT of signal 3')

%% Envelop Spectrum Analysis using given hcurve_fun and PSD default setting

%signal 1
n = length(signal_1_data);
h_1 = hcurve_fun(signal_1_data, 1, n);
[PSD_h1, f_psd_h1] = pwelch(h_1, [], [], [], fs_all(1));
figure(9)
plot(f_psd_h1, PSD_h1, 'LineWidth',2); hold on;
xlabel('discrete frequency in Hz')
ylabel('PSD in (m/s^2)^2/Hz')
title('power spectrum density for envelope of signal 1')
set(gca,'fontname',fontname,'fontsize',fontsize)
xlim([0 3000]); ylim([0 0.1])
n_harmonics = 1:10;
f_harmonics_in = f_in.* n_harmonics;
f_harmonics_out = f_out .* n_harmonics;
f_harmonics_roller = f_roller .* n_harmonics;
f_harmonics_cage = f_cage_fixout .* n_harmonics;
f_harmonics_fn = fn_all .* n_harmonics;
[x1, y1] = meshgrid(f_harmonics_in(1,:), ylim);
[x2, y2] = meshgrid(f_harmonics_out(1,:), ylim);
[x3, y3] = meshgrid(f_harmonics_roller(1,:), ylim);
[x4, y4] = meshgrid(f_harmonics_cage(1,:), ylim);
[x5, y5] = meshgrid(f_harmonics_fn(1,:), ylim);
p3 = plot(x1,y1,':r');
p4 = plot(x2,y2,':b', 'LineWidth',1.5);
p5 = plot(x3,y3,':m');
p6 = plot(x4,y4,':k');
p7 = plot(x5,y5,':g', LineWidth=1);

%signal 2
n = length(signal_2_data);
h_2 = hcurve_fun(signal_2_data, 1, n);
[PSD_h2, f_psd_h2] = pwelch(h_2, [], [], [], fs_all(2));
figure(10)
plot(f_psd_h2, PSD_h2, 'LineWidth',2, 'Color', 'r'); hold on;
xlabel('discrete frequency in Hz')
ylabel('PSD in (m/s^2)^2/Hz')
title('power spectrum density for hilbert signal 2')
set(gca,'fontname',fontname,'fontsize',fontsize)
xlim([0 2000]); ylim([0 0.25])
[x1, y1] = meshgrid(f_harmonics_in(2,:), ylim);
[x2, y2] = meshgrid(f_harmonics_out(2,:), ylim);
[x3, y3] = meshgrid(f_harmonics_roller(2,:), ylim);
[x4, y4] = meshgrid(f_harmonics_cage(2,:), ylim);
[x5, y5] = meshgrid(f_harmonics_fn(2,:), ylim);
p3 = plot(x1,y1,':r', 'LineWidth', 1.5);
p4 = plot(x2,y2,':b', 'LineWidth',1.5);
p5 = plot(x3,y3,':m');
p6 = plot(x4,y4,':k');
p7 = plot(x5,y5,':g', LineWidth=1);

%signal 3
n = length(signal_3_data);
h_3 = hcurve_fun(signal_3_data, 1, n);
[PSD_h3, f_psd_h3] = pwelch(h_3, [], [], [], fs_all(3));
figure(11)
plot(f_psd_h3, PSD_h3, 'LineWidth',2, 'Color', 'g'); hold on;
xlabel('discrete frequency in Hz')
ylabel('PSD in (m/s^2)^2/Hz')
title('power spectrum density for hilbert signal 3')
set(gca,'fontname',fontname,'fontsize',fontsize)
xlim([0 2000]); ylim([0 30])
[x1, y1] = meshgrid(f_harmonics_in(3,:), ylim);
[x2, y2] = meshgrid(f_harmonics_out(3,:), ylim);
[x3, y3] = meshgrid(f_harmonics_roller(3,:), ylim);
[x4, y4] = meshgrid(f_harmonics_cage(3,:), ylim);
[x5, y5] = meshgrid(f_harmonics_fn(3,:), ylim);
p3 = plot(x1,y1,':r', 'LineWidth', 1.5);
p4 = plot(x2,y2,':b', 'LineWidth',1.5);
p5 = plot(x3,y3,':m');
p6 = plot(x4,y4,':k');
p7 = plot(x5,y5,':g', LineWidth=1);

%% function defination
function f_cage_fo = calc_cage_frequency_fo(fn, dw, dt, alpha) %cage damage frequency with fixed outer ring
f_cage_fo = 1/2 * fn * (1 - ((dw/dt)* cos(alpha)));
end

function f_cage_fi = calc_cage_frequency_fi(fn, dw, dt, alpha) %cage damage frequency with fixed inner ring
f_cage_fi = 1/2 * fn * (1 + ((dw/dt)* cos(alpha)));
end

function f_out = calc_outer_frequency(fn,n, dw, dt, alpha) %outer ring damage frequeny
f_out = 1/2 * fn * n * (1 - ((dw/dt)* cos(alpha)));
end

function f_in = calc_in_frequency(fn,n, dw, dt, alpha) %inner ring damage frequency
f_in = 1/2 * fn * n * (1 + ((dw/dt)* cos(alpha)));
end

function f_roller = calc_roller_frequency(fn, dw, dt, alpha) %roller damage (single track irregularity) frequency 
f_roller = 1/2 * fn * (dt/dw) * (1 - ((dw/dt)* cos(alpha))^2);
end