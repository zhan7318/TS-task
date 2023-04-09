% main TS task

clear a
a = arduino('COM5'); %change 'COM3' as necessary

%create maximized figure
% f = gcf;
% f = figure('units','normalized','outerposition',[0 0 1 1]);
% f.WindowState = 'fullscreen';
% set(gca,'Color','k');
% f.MenuBar = 'none';
% f.DockControls = 'off';
% set(gca,'YTickLabel',[]);
% set(gca,'XTickLabel',[]); 
% hold on 

for i = 1:1000
    x = start_sensor(a);
    if x == 1
%         break
    end
    pause(0.01);
end
% touchscreen();
% 
% motor(a);