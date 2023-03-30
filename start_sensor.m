
function [touched] = start_sensor(a)
touch = 'D8';  % pin for touch sensor
touched = 0;
touchValue = readDigitalPin(a,touch);
    if (touchValue == 1)
      disp("touched");
      touched = 1;
    else
      disp("not touched");
      touched = 0;
    end
end