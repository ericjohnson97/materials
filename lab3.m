clc; clear all; close all;
%materials lab 3 

%specimen arrays: D0 Df Lo Lf
annealedM = [.5082, .4093, 2, 2.5953];
untreatedM = [.5075, .4243, 2, 2.3668];
min30M = [.5000, .4160, 2, 2,433];
hrs2M = [.4990, .4588, 2, 2.2200];
hrs6M = [.5029, .4265, 2, 2.7580];
hrs24M = [.5018, .4245, 2, 2.2300];

%Time, Load, Extension, Axial, Transverse
untreated = xlsread('T_Lab3.xlsx');
annealed = xlsread('annealed.xlsx');
min30 = xlsread('min30.xlsx');
hrs2 =  xlsread('hrs2.xlsx');
hrs6 =  xlsread('hrs6.xlsx');
hrs24 =  xlsread('hrs24.xlsx');

%stress calculation
untreatedStress = untreated(:,2)/(pi*(untreatedM(1)/2)^2);
annealedStress = annealed(:,2)/(pi*(annealedM(1)/2)^2);
min30Stress = min30(:,2)/(pi*(min30M(1)/2)^2);
hrs2Stress = hrs2(:,2)/(pi*(hrs2M(1)/2)^2);
hrs6Stress = hrs6(:,2)/(pi*(hrs6M(1)/2)^2);
hrs24Stress = hrs24(:,2)/(pi*(hrs24M(1)/2)^2);

untreatedStrain = untreated(:,4)/untreatedM(3);
annealedStrain = annealed(:,4)/annealedM(3);
min30Strain = min30(:,4)/min30M(3);
hrs2Strain = hrs2(:,4)/hrs2M(3);
hrs6Strain = hrs6(:,4)/hrs6M(3);
hrs24Strain = hrs24(:,4)/hrs24M(3);

%calc Young's Modulus
untreatedYM = (sum(untreatedStress(50:100)) / length(untreatedStress(50:100)))  /   (sum(untreatedStrain(50:100)) / length(untreatedStrain(50:100)));
annealedYM = (sum(annealedStress(50:100)) / length(annealedStress(50:100)))  /   (sum(annealedStrain(50:100)) / length(annealedStrain(50:100)));
min30YM = (sum(min30Stress(50:100)) / length(min30Stress(50:100)))  /   (sum(min30Strain(50:100)) / length(min30Strain(50:100)));
hrs2YM = (sum(hrs2Stress(50:100)) / length(hrs2Stress(50:100)))  /   (sum(hrs2Strain(50:100)) / length(hrs2Strain(50:100)));
hrs6YM = (sum(hrs6Stress(50:100)) / length(hrs6Stress(50:100)))  /   (sum(hrs6Strain(50:100)) / length(hrs6Strain(50:100)));
hrs24YM = (sum(hrs24Stress(50:100)) / length(hrs24Stress(50:100)))  /   (sum(hrs24Strain(50:100)) / length(hrs24Strain(50:100)));


figure(1)
plot(untreatedStrain, untreatedStress);
title("Stress vs Strain of Untreated Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(2)
plot(annealedStrain, annealedStress);
title("Stress vs Strain of Annealed Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(3)
plot(min30Strain, min30Stress);
title("Stress vs Strain of 30 min Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(4)
plot(hrs2Strain, hrs2Stress);
title("Stress vs Strain of 2 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(5)
plot(hrs6Strain, hrs6Stress);
title("Stress vs Strain of 6 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(6)
plot(hrs24Strain, hrs24Stress);
title("Stress vs Strain of 24 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

