%materials lab 8 Polymers 
clc; clear all; close all

tensionData = xlsread("lab8_tension.xlsx");

A = .5*.5;
L = 2;
stress = tensionData(:,2)/A;
strain = tensionData(:,3);

figure(1)
plot(strain, stress);
hold on
title('Stress vs Strain Tension'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )

%relaxation tests
dataSheets = ["lab8_100d.xlsx", "lab8_118d.xlsx", "lab8_140d.xlsx", "lab8_70d.xlsx", "lab8_90d.xlsx", "roomTemp.xlsx", "lab8_110d.xlsx", "lab8_133.xlsx", "lab8_60d.xlsx",   "lab8_80d.xlsx" ];

for i=1:length(dataSheets)

    data{i} = xlsread(dataSheets(i));
    
end

Width = 0.48;
Thickness = 0.245;
Area = 0.1176;
StrainRate = 0.1;

temp = [100 118 140 70 90 19.9 110 133 60 80];


for i=1:length(temp)
    
    stressR{i} = data{i}(:,2)/A;
    time{i} = data{i}(:,1);
    Er{i} = stressR{i}/StrainRate;
    
    figure(1+i)
    plot(time{i}, Er{i});
    hold on
    title( strcat("Stress vs Strain Relaxation ", num2str(temp(i)) )); 
    xlabel( 'time' )
    ylabel( 'Er [psi] ' )

    %E(i,:) = polyfit(strainR{i}, stressR{i}, 1);
    
end
figure(12)
scatter(temp,abs(E(:,1)))
set(gca,'yscale','log')
hold on
title('E vs Temp'); 
xlabel( 'Temp [C]' )
ylabel( 'E [psi/%]' )

