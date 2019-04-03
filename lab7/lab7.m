clc; clear all; close all;

% data = xlsread('Lab7Data.xlsx');

[~,sheet_name]=xlsfinfo('Lab7Data.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('Lab7Data.xlsx',sheet_name{k});
end

d = 0.02055; %(thickness)
b =	0.4735; %(width)
L = 1.3; %(length)
c = d/2;

figure(1)
title("Stress Strain Curve for Alumina"); 
xlabel( 'strain [in]' )
ylabel( 'stress [lb/in^2]' )
hold on
for i=1:length(data)

    for row=5:length(data{i})
        stress{i}(row-4) = (3*data{i}(row,2)*L)/(2*b*d^2);
        strain{i}(row-4) = (12*c*data{i}(row,1))/(L^2);
    end
    plot(strain{i}, stress{i})
    youngs(i) = mean(stress{i}(45:length(stress{i})) ./ strain{i}(45:length(stress{i})) );
    flexuralStrength(i) = stress{i}(length(stress{i}));
    hold on
end
mean(youngs)
mean(flexuralStrength)
hold off 

