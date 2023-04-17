function [mouse] = touchscreen(color,radius)
%%Touch screen task
%1.When the program starts a maximized blank touch screen should appear
%   (black)
%2. Once a new voltage is detected, activate a new screen blank, no axes,
%   white/gray background with circle target in the middle of the screen
%   (5 seconds)
%3. If target is touched, revert back to black screen

%creating full black screen requires windowsapi
%https://www.mathworks.com/matlabcentral/fileexchange/31437-windowapi

mouse = 0; % boolean variable determining if the mouse is within the circle

%create a figure the same size as the screen with a white background
screen_size = get(0,'ScreenSize');
fig = figure('Position',screen_size);
set(fig,'Color',[1 1 1]);

% generates a red circle at the center of screen
r = radius; % radius of circle
xco = round(screen_size(3)/2);
yco = round(screen_size(4)/2);
xlim([0 screen_size(3)]);
ylim([0 screen_size(4)]);
c = rectangle('Position',[xco-r yco-r r*2 r*2],'Curvature',[1 1],'FaceColor',color, 'EdgeColor',color);
axis equal

% makes axis white, removes menu bar
set(gca,'XColor','w','YColor','w');
fig.MenuBar = 'none';
fig.DockControls = 'off';

% detect if mouse is within red circle
[x,y] = ginput(1);
cla; %clear current axis to get rid fo black lines
set(gca,'XColor','none','YColor','none');
dist = sqrt((x-xco)^2 + (y-yco)^2);
if dist <= r
    % mouse inside circle
    mouse = 1;
%     delete(c);
else 
    mouse = 0;
end
end