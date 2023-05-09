function [] = motor(a,reverse)
% Running motor through Arduino for touch screen task
% Code adapted from https://lastminuteengineers.com/l298n-dc-stepper-driver-arduino-tutorial/
% Motor A connections
    enB = 'D3';
    in3 = 'D5';
    in4 = 'D4';
    % Turn off motors - Initial state
    writeDigitalPin(a,in3,0);
    writeDigitalPin(a,in4,0);

    for i = 0:3 %for 3 seconds  
        % Set motors to max speed
        writePWMVoltage(a,enB,3);

        if reverse == 1
            % motor in reverse
            writeDigitalPin(a,in3,0);
            writeDigitalPin(a,in4,1);
            pause(0.1)
        else
            % Turn on motor 
            writeDigitalPin(a,in3,1);
            writeDigitalPin(a,in4,0);
            pause(0.1)
        end
    end
    writeDigitalPin(a,in3,0);
    writeDigitalPin(a,in4,0);
end