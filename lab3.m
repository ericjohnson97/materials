clc; clear all; close all;
%materials lab 3 

%specimen arrays: D0 Df Lo Lf
annealedM = [.5082, .4093, 2, 2.5953];
untreatedM = [.5075, .4243, 2, 2.3668];
min30M = [.5000, .4160, 2, 2,433];
hrs2M = [.4990, .4588, 2, 2.2200];
hrs6M = [.5029, .4265, 2, 2.7580];
hrs24M = [.5018, .4245, 2, 2.2300];

%Time:1, Load:2, Extension:3, Axial:4, Transverse:5
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

%calc strain
untreatedStrain = untreated(:,4);
annealedStrain = annealed(:,4);
min30Strain = min30(:,4);
hrs2Strain = hrs2(:,4);
hrs6Strain = hrs6(:,4);
hrs24Strain = hrs24(:,4);

%calc max strain
untreatedStrainMax = max(untreatedStrain);
annealedStrainMax = max(annealedStrain);
min30StrainMax = max(min30Strain);
hrs2StrainMax = max(hrs2Strain);
hrs6StrainMax = max(hrs6Strain);
hrs24StrainMax = max(hrs24Strain);

%calc Young's Modulus 

%SUMTING WONG
untreatedYM = (sum(untreatedStress(50:100)) / length(untreatedStress(50:100)))  /   (sum(untreatedStrain(50:100)) / length(untreatedStrain(50:100)))
annealedYM = (sum(annealedStress(50:100)) / length(annealedStress(50:100)))  /   (sum(annealedStrain(50:100)) / length(annealedStrain(50:100)))
min30YM = (sum(min30Stress(50:100)) / length(min30Stress(50:100)))  /   (sum(min30Strain(50:100)) / length(min30Strain(50:100)))
hrs2YM = (sum(hrs2Stress(50:100)) / length(hrs2Stress(50:100)))  /   (sum(hrs2Strain(50:100)) / length(hrs2Strain(50:100)))
hrs6YM = (sum(hrs6Stress(50:100)) / length(hrs6Stress(50:100)))  /   (sum(hrs6Strain(50:100)) / length(hrs6Strain(50:100)))
hrs24YM = (sum(hrs24Stress(50:100)) / length(hrs24Stress(50:100)))  /   (sum(hrs24Strain(50:100)) / length(hrs24Strain(50:100)))

%calc poisson's ratio
untreatedP = (sum(untreated(50:100,5)) /length(untreated(50:100,5)))  ./ (sum(untreated(:,4))/length(untreated(:,4)));
annealedP = (sum(annealed(50:100,5)) /length(annealed(50:100,5)))  ./ (sum(annealed(:,4))/length(annealed(:,4)));
min30P = (sum(min30(50:100,5)) /length(min30(50:100,5)))  ./ (sum(min30(:,4))/length(min30(:,4)));
hrs2P = (sum(hrs2(50:100,5)) /length(hrs2(50:100,5)))  ./ (sum(hrs2(:,4))/length(hrs2(:,4)));
hrs6P = (sum(hrs6(50:100,5)) /length(hrs6(50:100,5)))  ./ (sum(hrs6(:,4))/length(hrs6(:,4)));
hrs24P = (sum(hrs24(50:100,5)) /length(hrs24(50:100,5)))  ./ (sum(hrs24(:,4))/length(hrs24(:,4)));

%calc ultimate tensile strength
untreatedUltimate = max(untreatedStress);
annealedUltimate = max(annealedStress);
min30Ultimate = max(min30Stress);
hrs2Ultimate = max(hrs2Stress);
hrs6Ultimate = max(hrs6Stress);
hrs24Ultimate = max(hrs24Stress);

%calc ductility (based on final diameter)
untreatedDuctilityLinear = ( untreatedM(2) - untreatedM(1) )  / untreatedM(1);
annealedDuctilityLinear = ( annealedM(2) - annealedM(1) )  / annealedM(1);
min30DuctilityLinear = ( min30M(2) - min30M(1) )  / min30M(1);
hrs2DuctilityLinear = ( hrs2M(2) - hrs2M(1) )  / hrs2M(1);
hrs6DuctilityLinear = ( hrs6M(2) - hrs6M(1) )  / hrs6M(1);
hrs24DuctilityLinear = ( hrs24M(2) - hrs24M(1) )  / hrs24M(1);

%calc ductility (based on final Area)
untreatedDuctilityArea = ( pi*(untreated(2)/2)^2 - pi*(untreated(1)/2)^2) / (pi*(untreated(1)/2)^2);
annealedDuctilityArea = ( pi*(annealed(2)/2)^2 - pi*(annealed(1)/2)^2) / (pi*(annealed(1)/2)^2);
min30DuctilityArea = ( pi*(min30(2)/2)^2 - pi*(min30(1)/2)^2) / (pi*(min30(1)/2)^2);
hrs2DuctilityArea = ( pi*(hrs2(2)/2)^2 - pi*(hrs2(1)/2)^2 )/ (pi*(hrs2(1)/2)^2);
hrs6DuctilityArea = ( pi*(hrs6(2)/2)^2 - pi*(hrs6(1)/2)^2 )/ (pi*(hrs6(1)/2)^2);
hrs24DuctilityArea = ( pi*(hrs24(2)/2)^2 - pi*(hrs24(1)/2)^2) / (pi*(hrs24(1)/2)^2);



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

