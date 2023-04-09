function [touched] = start_sensor(a)
touch = 'A0';  % pin for touch sensor
touched = 0;
touchValue = readVoltage(a,touch);
disp(touchValue)
%     if (touchValue == 1)
%       disp("touched");
%       touched = 1;
%     else
%       disp("not touched");
%       touched = 0;
%     end
end