function [mouse,coordinates]  = touchscreen(color,radius,position) 
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
ylim([0 screen_size(4)])

% variables determining position 
posx = 0;
posy = 0;
% possible shifts in position are 1/3 of screen size
shiftx = round(screen_size(3)/3);
shifty = round(screen_size(4)/3)
% value of position determines position within a 3x3 matrix on the figure
% for example 0 means the circle is on the northeast side of the screen and
% 4 means its in the center
if position == 0
    posx = r+shiftx ;
    posy = -shifty;
elseif position == 1
    posx = r;
    posy = -shifty;
elseif position == 2
    posx = -r-shiftx ;
    posy = -shifty;
elseif position == 3
    posx = r+shiftx ;
    posy = r;
elseif position == 4
    posx = r;
    posy = r;
elseif position == 5
    posx = -r-shiftx ;
    posy = r;
elseif position == 6
    posx = r+shiftx ;
    posy = r+shifty;
elseif position == 7
    posx = r;
    posy = +r+shifty;
elseif position == 8
    posx = -r-shiftx ;
    posy = r+shifty;
end


% depending on the position parameter, change 'Position' of circle
c = rectangle('Position',[xco-posx yco-posy r*2 r*2],'Curvature',[1 1],'FaceColor',color, 'EdgeColor',color);
% axis equal

% makes axis white, removes menu bar
% set(gca,'XColor','w','YColor','w');
% fig.MenuBar = 'none';
% fig.DockControls = 'off';
% time = timer('StartDelay',5,'TimerFcn', @(~,~)[]); 

% start(time)
% detect if mouse is within red circle
[x,y] = ginput(1);
% if isempty(x) || isempty(y)
%     x = [];
%     y = [];
% else
%     stop(time);
%     delete(time);
% end

set(gca,'XColor','none','YColor','none');
dist = sqrt((x-xco+posx+r)^2 + (y-yco+posy-r)^2)
xdist  = posx
ydist = y-yco+posy-r
if dist <= r
    % mouse inside circle
    mouse = 1;
    set(c,'Visible','off');
else 
    mouse = 0;
    set(c,'Visible','off');
end
coordinates = [x, y];
end