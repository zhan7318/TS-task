function [mouse,x,y]  = touchscreen(color,radius,pos) 
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
% fig = figure('Position',screen_size);
% set(fig,'Color',[1 1 1]);

% generates a red circle at the center of screen
r = radius; % radius of circle
xco = round(screen_size(3)/2);
yco = round(screen_size(4)/2);

% variables determining position 
posx = 0;
posy = 0;
% possible shifts in position are 1/3 of screen size
shiftx = round(screen_size(3)/3);
shifty = round(screen_size(4)/3);
% value of position determines position within a 3x3 matrix on the figure
% for example 1 means the circle is on the northeast side of the screen and
% 5 means its in the center

if pos == 1
    posx = r+shiftx ;
    posy = -shifty;
elseif pos == 2
    posx = r;
    posy = -shifty;
elseif pos == 3
    posx = -r-shiftx ;
    posy = -shifty;
elseif pos == 4
    posx = r+shiftx ;
    posy = r;
elseif pos == 5
    posx = r;
    posy = r;
elseif pos == 6
    posx = -r-shiftx ;
    posy = r;
elseif pos == 7
    posx = r+shiftx ;
    posy = r+shifty;
elseif pos == 8
    posx = r;
    posy = +r+shifty;
elseif pos == 9
    posx = -r-shiftx ;
    posy = r+shifty;
end


% depending on the position parameter, change 'Position' of circle
c = rectangle('Position',[xco-posx yco-posy r*2 r*2],'Curvature',[1 1],'FaceColor',color, 'EdgeColor',color);
% axis equal
% xlim([0 screen_size(3)]);
% ylim([0 screen_size(4)]);

% makes axis white, removes menu bar, hides cursor
% set(gca,'XColor','w','YColor','w');
% fig.MenuBar = 'none';
% fig.DockControls = 'off';
% set(fig, 'Pointer', 'custom', 'PointerShapeCData', NaN(16,16))

[x,y] = ginput(1);

set(gca,'XColor','none','YColor','none');
dist = sqrt((x-xco+posx-r)^2 + (y-yco+posy-r)^2);
if dist <= r
    % mouse inside circle
    mouse = 1;
    set(c,'Visible','off');
else 
    mouse = 0;
    set(c,'Visible','off');
end
end