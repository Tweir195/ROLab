%% Load Data
clear 

opts = detectImportOptions('../data_fall2019/2019-12-04_5.csv');
opts.SelectedVariableNames = (1:2);
data = readmatrix('../data_fall2019/2019-12-04_5.csv', opts);

%% Flux in LMH
figure

time = data(30:length(data),1)./60;
mass = data(30:length(data),2);

mass_rate = mass(2:end) - mass(1:end-1);

time_diff = time(2:end) - time(1:end-1);
flow = mass_rate./time_diff;

flux = flow ./ (998 * .022);


t = time(2:end);
m = movmean(flux, 200);

plot(t, m)
ylabel('Flux (LMH)')
xlabel('Time (min)')
title('Flux at 60 psi')
axis([0 20 0 .2])
