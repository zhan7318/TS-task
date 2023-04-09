function [] = touchscreen()
%%Touch screen task

%1.When the program starts a maximized blank touch screen should appear
%   (black)
%2. Once a new voltage is detected, activate a new screen blank, no axes,
%   white/gray background with circle target in the middle of the screen
%   (5 seconds)
%3. If target is touched, revert back to black screen

%creating full black screen requires windowsapi
%https://www.mathworks.com/matlabcentral/fileexchange/31437-windowapi


%create a red circle with a gray background
r = 0.1; %radius
c = [0.1 0.5]; %center

pos = [c-r 2*r 2*r];
r = rectangle('Position',pos,'Curvature',[1 1], 'FaceColor', 'red', 'Edgecolor','none');
axis equal
axis off %there is a slight translation of the circle after this is run
end