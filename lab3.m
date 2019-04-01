clc; clear all; close all;
%materials lab 3 

%specimen arrays: D0 Df Lo Lf
annealedM = [.5082, .4093, 2, 2.5953];
untreatedM = [.5075, .4243, 2, 2.3668];
min30M = [.5000, .4160, 2, 2.433];
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

%calc strain from crosshead displacement
untreatedStrainCross =  (untreated(:,3) - untreated(1,3)) / untreatedM(3);
annealedStrainCross =  (annealed(:,3) - annealed(1,3)) / annealedM(3);
min30StrainCross =  (min30(:,3) - min30(1,3)) / min30M(3);
hrs2StrainCross =  (hrs2(:,3) - hrs2(1,3)) / hrs2M(3);
hrs6StrainCross =  (hrs6(:,3) - hrs6(1,3)) / hrs6M(3);
hrs24StrainCross =  (hrs24(:,3) - hrs24(1,3)) / hrs24M(3);

%calc max strain
untreatedStrainMax = max(untreatedStrain);
annealedStrainMax = max(annealedStrain);
min30StrainMax = max(min30Strain);
hrs2StrainMax = max(hrs2Strain);
hrs6StrainMax = max(hrs6Strain);
hrs24StrainMax = max(hrs24Strain);

%calc Young's Modulus 

%SUMTING WONG
%calc poisson's ratio
% untreatedP = (sum(untreated(50:100,5)) /length(untreated(50:100,5)))  ./ (sum(untreated(:,4))/length(untreated(:,4)))
% annealedP = (sum(annealed(50:100,5)) /length(annealed(50:100,5)))  ./ (sum(annealed(:,4))/length(annealed(:,4)))
% min30P = (sum(min30(50:100,5)) /length(min30(50:100,5)))  ./ (sum(min30(:,4))/length(min30(:,4)))
% hrs2P = (sum(hrs2(50:100,5)) /length(hrs2(50:100,5)))  ./ (sum(hrs2(:,4))/length(hrs2(:,4)))
% hrs6P = (sum(hrs6(50:100,5)) /length(hrs6(50:100,5)))  ./ (sum(hrs6(:,4))/length(hrs6(:,4)))
% hrs24P = (sum(hrs24(50:100,5)) /length(hrs24(50:100,5)))  ./ (sum(hrs24(:,4))/length(hrs24(:,4)))

%calc ultimate tensile strength
untreatedUltimate = max(untreatedStress)
annealedUltimate = max(annealedStress)
min30Ultimate = max(min30Stress)
hrs2Ultimate = max(hrs2Stress)
hrs6Ultimate = max(hrs6Stress)
hrs24Ultimate = max(hrs24Stress)

%calc ductility (based on axial deformation)
untreatedDuctilityLinear = ( untreatedM(4) - untreatedM(3) )  / untreatedM(3)
annealedDuctilityLinear = ( annealedM(4) - annealedM(3) )  / annealedM(3)
min30DuctilityLinear = ( min30M(4) - min30M(3) )  / min30M(3)
hrs2DuctilityLinear = ( hrs2M(4) - hrs2M(3) )  / hrs2M(3)
hrs6DuctilityLinear = ( hrs6M(4) - hrs6M(3) )  / hrs6M(3)
hrs24DuctilityLinear = ( hrs24M(4) - hrs24M(3) )  / hrs24M(3)

%calc toughness 
untreatedToughness = 0;
for i=1:length(untreatedStress)-1
	untreatedToughness = untreatedStress(i)*(untreatedStrain(i+1)-untreatedStrain(i)) + untreatedToughness;
end
untreatedToughness

annealedToughness = 0;
for i=1:length(annealedStress)-1
	annealedToughness = annealedStress(i)*(annealedStrain(i+1)-annealedStrain(i)) + annealedToughness;
end
annealedToughness

min30Toughness = 0;
for i=1:length(min30Stress)-1
	min30Toughness = min30Stress(i)*(min30Strain(i+1)-min30Strain(i)) + min30Toughness;
end
min30Toughness

hrs2Toughness = 0;
for i=1:length(hrs2Stress)-1
	hrs2Toughness = hrs2Stress(i)*(hrs2Strain(i+1)-hrs2Strain(i)) + hrs2Toughness;
end
hrs2Toughness

hrs6Toughness = 0;
for i=1:length(hrs6Stress)-1
	hrs6Toughness = hrs6Stress(i)*(hrs6Strain(i+1)-hrs6Strain(i)) + hrs6Toughness;
end
hrs6Toughness

hrs24Toughness = 0;
for i=1:length(hrs24Stress)-1
	hrs24Toughness = hrs24Stress(i)*(hrs24Strain(i+1)-hrs24Strain(i)) + hrs24Toughness;
end
hrs24Toughness

%calc .2% offset 


figure(1)
plot(untreatedStrain, untreatedStress);
hold on
plot(untreatedStrainCross, untreatedStress);
title("Stress vs Strain of Untreated Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(2)
plot(annealedStrain, annealedStress);
hold on
plot(annealedStrainCross, annealedStress);
title("Stress vs Strain of Annealed Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(3)
plot(min30Strain, min30Stress);
hold on
plot(min30StrainCross, min30Stress);
title("Stress vs Strain of 30 min Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(4)
plot(hrs2Strain, hrs2Stress);
hold on
plot(hrs2StrainCross, hrs2Stress);
title("Stress vs Strain of 2 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(5)
plot(hrs6Strain, hrs6Stress);
hold on
plot(hrs6StrainCross, hrs6Stress);
title("Stress vs Strain of 6 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(6)
plot(hrs24Strain, hrs24Stress);
hold on
plot(hrs24StrainCross, hrs24Stress);
title("Stress vs Strain of 24 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','crosshead');

figure(7)
subplot(3,2,1)
plot(untreatedStrain, untreatedStress);
title("Stress vs Strain of Untreated Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

subplot(3,2,2)
plot(annealedStrain, annealedStress);
title("Stress vs Strain of Annealed Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

subplot(3,2,3)
plot(min30Strain, min30Stress);
title("Stress vs Strain of 30 min Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

subplot(3,2,4)
plot(hrs2Strain, hrs2Stress);
title("Stress vs Strain of 2 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

subplot(3,2,5)
plot(hrs6Strain, hrs6Stress);
title("Stress vs Strain of 6 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

subplot(3,2,6)
plot(hrs24Strain, hrs24Stress);
title("Stress vs Strain of 24 Hr Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )


figure(8)
subplot(3,2,1)
plot(untreatedStrain(300:1000), untreatedStress(300:1000));
title("Stress vs Strain of Untreated Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
subplot(3,2,2)
plot(annealedStrain(500:1000), annealedStress(500:1000));
title("Stress vs Strain of Annealed Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
subplot(3,2,3)
plot(min30Strain(300:800), min30Stress(300:800));
title("Stress vs Strain of 30 min Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
subplot(3,2,4)
plot(hrs2Strain(300:1000), hrs2Stress(300:1000));
title("Stress vs Strain of 2 Hr Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
subplot(3,2,5)
plot(hrs6Strain(300:1000), hrs6Stress(300:1000));
title("Stress vs Strain of 6 Hr Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
subplot(3,2,6)
plot(hrs24Strain(300:1000), hrs24Stress(300:1000));
title("Stress vs Strain of 24 Hr Aluminium for the Elastic Region"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )

figure(9)
subplot(3,2,1)
plot(untreatedStrain(300:1000), untreated(300:1000,5));
title("Transverse Strain vs Axial Strain of Untreated Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )
subplot(3,2,2)
plot(annealedStrain(200:500), annealed(200:500,5));
title("Transverse Strain vs Axial Strain of Annealed Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )
subplot(3,2,3)
plot(min30Strain(300:800), min30(300:800,5));
title("Transverse Strain vs Axial Strain of 30 min Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )
subplot(3,2,4)
plot(hrs2Strain(300:1000), hrs2(300:1000,5));
title("Transverse Strain vs Axial Strain of 2 Hr Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )
subplot(3,2,5)
plot(hrs6Strain(300:1000), hrs6(300:1000,5));
title("Transverse Strain vs Axial Strain of 6 Hr Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )
subplot(3,2,6)
plot(hrs24Strain(300:1000), hrs24(300:1000,5));
title("Transverse Strain vs Axial Strain of 24 Hr Aluminium for the Elastic Region"); 
xlabel( 'Axial Strain' )
ylabel( 'Transverse Strain' )

figure(10)
untreatedYM = 8.5688e6;
untreatedYeildp2 = untreatedYM*[0:.001:.03] - untreatedYM*(.002*untreatedStrain(length(untreatedStrain)))  
plot(untreatedStrain(1:1500), untreatedStress(1:1500));
hold on
plot([0:.001:.03], untreatedYeildp2);
title("Stress vs Strain of Untreated Aluminium"); 
xlabel( 'Strain' )
ylabel( 'Stress [lbf]' )
legend('extensometer','2 percent offset');










