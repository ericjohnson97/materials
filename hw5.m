clc; clear all;

%1

t = [0, 50, 200, 400, 600, 800, 1000];
stress3000 = [0, 0.020, 0.028, 0.030, 0.031, 0.033, 0.035];
stress5000 = [0, 0.045, 0.053, 0.055, 0.058, 0.062, 0.065];
stress8000  = [0.0, 0.099, 0.140, 0.149, 0.155, 0.164, 0.173];
stress11000 = [0.0, 0.135, 0.238, 0.305, 0.368, 0.433, 0.520];

Ess3000 = 0;
Ess5000 = 0;
Ess8000 = 0;
Ess11000 = 0;

for i=3:6
	Ess3000 = (stress3000(i+1) - stress3000(i))/200 + Ess3000;
	Ess5000 = (stress5000(i+1) - stress5000(i))/200 + Ess5000;
	Ess8000 = (stress8000(i+1)  - stress8000(i))/200 + Ess8000;
	Ess11000 = (stress11000(i+1) - stress11000(i))/200 + Ess11000;
end

Ess3000 = Ess3000/4
Ess5000 = Ess5000/4
Ess8000 = Ess8000/4
Ess11000 = Ess11000/4






%2

ruptureTime650 = [12, 56, 165, 319, 479, 504];
ruptureTime705 = [23, 110, 254, 478];
ruptureTime760 = [28, 62, 291, 390];
ruptureTime815 = [15, 47, 91, 379, 773];
ruptureTime870 = [33, 73, 196, 300];
ruptureTime900 = [69, 163, 738];

stress650 = [1000, 950, 895, 840, 820, 790];
stress705 = [815, 695, 635, 590];
stress760 = [600, 515, 440, 415];
stress815 = [460, 395, 345, 260, 220];
stress870 = [260, 215, 180, 145];
stress900 = [170, 140, 105];

    
figure(1)    
loglog( ruptureTime650, stress650)
xlabel('rupture time')
ylabel('stress')
title('T = 650 C')
figure(2)
loglog( ruptureTime705, stress705)
xlabel('rupture time')
ylabel('stress')
title('T = 705 C')
figure(3)
loglog( ruptureTime760, stress760)
xlabel('rupture time')
ylabel('stress')
title('T = 650 C')
figure(4)
loglog( ruptureTime815, stress815)
xlabel('rupture time')
ylabel('stress')
title('T = 815 C')
figure(5)
loglog( ruptureTime870, stress870)
xlabel('rupture time')
ylabel('stress')
title('T = 870 C')
figure(6)
loglog( ruptureTime900, stress900)
xlabel('rupture time')
ylabel('stress')
title('T = 900 C')




