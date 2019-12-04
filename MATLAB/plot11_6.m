%% Load Data
clear 

opts = detectImportOptions('../data_fall2019/2019-11-06_3.csv');
opts.SelectedVariableNames = (1:2);
data = readmatrix('../data_fall2019/2019-11-06_3.csv', opts);

%% Flux in LMH
figure

time = data(30:25000,1)./3600;
mass = data(30:25000,2);

mass_rate = mass(2:end) - mass(1:end-1);

time_diff = time(2:end)-time(1:end-1);
flow = mass_rate./time_diff;

flux = flow ./ (998 * .022);

for n = 1:length(flux)
    if flux(n) < -1
        flux(n) = 40;
    end
    if flux(n)>500
        flux(n) = 40;
    end
end

t = time(2:end);
m = movmean(flux, 100);

plot(t, m)
ylabel('Flux (LMH)')
xlabel('Time (hr)')
title('11/6 300 psi')


%% Volumetric flow in grams / minute
figure

time = data(30:25000,1)./60; % minutes
time_diff = time(2:end) - time(1:end-1); % minutes

mass = data(30:25000,2); % grams
mass_diff = mass(2:end) - mass(1:end-1); % grams

flow = mass_diff./time_diff; % grams / minute


for n = 1:length(flow)
    if flow(n) < -1
        flow(n) = 40;
    end
    if flow(n)>500
        flow(n) = 40;
    end
end

t = time(2:end);
m = movmean(flow, 100);

plot(t, m)
ylabel('Flow (cm3/min)')
xlabel('Time (min)')
title('11/6 300 psi')

%% Volumetric flow in m3 / hour
figure

time = data(30:25000,1)./3600; % hours
time_diff = time(2:end) - time(1:end-1);

mass = data(30:25000,2)./1000000; % m^3
mass_diff = mass(2:end) - mass(1:end-1); %

flow = mass_diff./time_diff; % m^3/hr


for n = 1:length(flow)
    if flow(n) < -1
        flow(n) = 40;
    end
    if flow(n)> .1
        flow(n) = 0;
    end
end

t = time(2:end);
m = movmean(flow, 100);

plot(t, m)
ylabel('Flow (m3/hr)')
xlabel('Time (hr)')
title('11/6 300 psi')



%% Volumetric flow in gal / min
figure

time = data(30:25000,1)./60; % min
time_diff = time(2:end) - time(1:end-1);

mass = data(30:25000,2)./3785.412; % gal
mass_diff = mass(2:end) - mass(1:end-1); 

flow = mass_diff./time_diff; % gal/min

for n = 1:length(flow)
    if flow(n) < -1
        flow(n) = 0;
    end
    if flow(n) > 500
        flow(n) = 0;
    end
end

t = time(2:end);
m = movmean(flow, 100);

plot(t, m)
ylabel('Flow (gal/hr)')
xlabel('Time (min)')
title('11/6 300 psi')