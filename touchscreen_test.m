%% touchscreen() testing + dummy data

% initializing arrays
num = 4; % number of points
mouse = zeros(1,num);
x = zeros(1,num);
y = zeros(1,num);
r = 100; % radius
screen_size = get(0,'ScreenSize');
xco = round(screen_size(3)/2);
yco = round(screen_size(4)/2);
color = 'green';

% runs touchscreen 10 times
for i = 1:num
    [mouse(i), x(i), y(i)] = touchscreen(color,r,1);
    % green circle at center of the screen, radius 100 
    pause(1)
end

