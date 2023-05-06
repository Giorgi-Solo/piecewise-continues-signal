format shortEng;
clc;
clear;

Range = 2-(-2);
step = Range/(10^4);
t = -2:step:2;

pulse_neg2_neg1 = (t>=(-2))&((t)<(-1)); % pulse from -2 to -1
pulse_neg1_0 = (t>=(-1))&((t)<(0)); % pulse from -1 to 0
pulse_0_1 = (t>=(0))&((t)<(1)); % pulse from 0 to 1
pulse_1_2 = (t>=(1))&((t)<(2)); % pulse from 1 to 2

h = pulse_neg2_neg1.*cos(pi*t/2) + pulse_neg1_0.*(1+t.^3) + pulse_0_1.*1 + pulse_1_2.*(1+sin(2*pi*t));

figure;plot(t,h);

t1 = t(t>=(-2)&t<=(1)); % time interval [-2,1]
h1 = h(t>=(-2)&t<=(1)); % values of the function at time interval [-2,1]
I1 = trapz(t1,h1); % integral of h over time interval [-2,1]

t2 = t(t>=(-2)&t<=(2)); % time interval [-2,2]
h2 = h(t>=(-2)&t<=(2)); % values of the function at time interval [-2,2] 
I2 = trapz(t2,h2); % integral of h over time interval [-2,2]

t3 = t(t>=(-0.5)&t<=(1.5)); % time interval [-0.5,1.5]
h3 = h(t>=(-0.5)&t<=(1.5)); % values of the function at time interval [-0.5,1.5] 
I3 = trapz(t3,h3); % integral of h over time interval [-0.5,1.5]

t4 = t(t>=(-1)&t<=(1)); % time interval [-1,1]
h4 = h(t>=(-1)&t<=(1)); % values of the function at time interval [-1,1] 
I4 = trapz(t4,h4); % integral of h over time interval [-1,1]

I_matlab = [I1 I2 I3 I4];
I_hand = [1.11338 2.11338 2.302684886 1.75];
diff = I_matlab - I_hand;
diff = diff./I_hand;
diff = diff*100;
["Integral from -2 to 1" "Integral from -2 to 2" "Integral from -0.5 to 1.5" "Integral from -1 to 1"];
I=[ans(:) I_matlab(:) I_hand(:) diff(:)];
I=["time interval" "MATLAB calc" "Hand calc" "% diff"; I] % rounded to 4 decimal
