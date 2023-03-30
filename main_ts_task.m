% main TS task

clear a
a = arduino('/dev/cu.usbmodem141101'); %change 'COM3' as necessary
for i = 1:10
    x = start_sensor(a);
    if x == 1
        motor(a);
    end
    pause(0.1);
end
