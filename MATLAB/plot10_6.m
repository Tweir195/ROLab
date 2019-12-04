%%

% **************************************************************
%   CHECK OUT plot11_6.m FOR A BETTER MORE USEFUL MATLAB SCRIPT
% **************************************************************



%%


% time1 = Untitled1{:,1};
% mass1 = Untitled1{:,2};
% 
% time2 = Untitled2{:,1};
% mass2 = Untitled2{:,2};
% 
% 
% m = [mass1; mass1(end) + mass2];
% t = [time1; time1(end) + time2];
% 
% % mass_rate = mass(2:end) - mass(1:end-1);
% % time_diff = time(2:end)-time(1:end-1);
% 
% % flow = mass_rate./time_diff;
% 
% mass_rate = m(2:end) - m(1:end-1);
% time_diff = t(2:end) - t(1:end-1);
% flow = mass_rate./time_diff;
% flux = flow .* 3600 ./ (998 * .022);
% 
% m = movmean(flux, 100);
% plot(t(2:end), m, '-m', 'LineWidth', 3)
% ylabel('Flux (LMH)')
% xlabel('Time (s)')
% 
% title('Flux at 570 psi with 23 hr pause at t = 777s')


% time = Untitled2{:,1};
% mass = Untitled2{:,2};
% 
% mass_rate = mass(2:end) - mass(1:end-1);
% time_diff = time(2:end)-time(1:end-1);
% mass_rate./time_diff;
% flow = mass_rate./time_diff;
% 
% plot(time(2:end), flow)
% m = movmean(flow, 100);
% plot(time(2:end), m)
% ylabel('Flow g/s')
% xlabel('Time (s)')
% title('Flow at 570psi for about 15 minutes')
% 
% 
figure
time = Untitled{:,1};
mass = Untitled{:,2};

mass_rate = mass(2:end) - mass(1:end-1);
time_diff = time(2:end)-time(1:end-1);
mass_rate./time_diff;
flow = mass_rate./time_diff;

plot(time(2:end), flow)
m = movmean(flow, 100);
plot(time(2:end), m)
ylabel('Flow g/s')
xlabel('Time (s)')
title('Flow at 570psi for about 15 minutes')
