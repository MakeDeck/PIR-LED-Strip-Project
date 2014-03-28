/*
Copyright (C) 2014 MakeDeck LLC.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, 
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/
local pwm_f = 500.0;

// Configure hardware
hardware.pin1.configure(PWM_OUT, 1.0/pwm_f, 256.0, 256);
hardware.pin2.configure(PWM_OUT, 1.0/pwm_f, 256.0, 256);
hardware.pin5.configure(PWM_OUT, 1.0/pwm_f, 256.0, 256);
// PWM's the LED's to the requested color, waits 4 seconds and then sets it to dim white.
agent.on("rgb", function(data) {
    hardware.pin1.write(data.red.tointeger());
    hardware.pin2.write(data.blue.tointeger());
    hardware.pin5.write(data.green.tointeger());
    imp.sleep(4);
    hardware.pin1.write(20);
    hardware.pin2.write(20);
    hardware.pin5.write(20);
});
