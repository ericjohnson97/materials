%materials lab 9
clc; clear all; close all

[~,sheet_name]=xlsfinfo('lab9.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('lab9.xlsx',sheet_name{k});
end

material = ["0_sg" "45_sg" "90_sg" "0_str" "45_str"];
dimensions = [.4995, .0555; .499, .062; .502, .087; .494, .144; .4778, .0803];
L = 8;
%Strain gauge calculations
 for i=1:3
    
     A = dimensions(i,1)*dimensions(i,2);
     stress{i} = data{i}(:,3)/A;
     strain{i}=abs(data{i}(:,5)/L);
    
     %Young's Modulus
     youngs(i) = mean(stress{i}(150:400)./strain{i}(150:400));
     
     %Poisson's Ratio
     strainTrans{i} = abs(data{i}(:,4)/dimensions(i,1));
     poissons(i) = mean(strainTrans{i}(150:600)./strain{i}(150:600)); 
     
     fprintf('Youngs Mod %s : %f \n', material(i), youngs(i) );
     fprintf('Poissons Ratio %s : %f \n', material(i), poissons(i) );
 end

v12 = poissons(1);
v21 = poissons(2);
vxy = poissons(3);

E1 = youngs(1);
E2 = youngs(2); 

%Lamina Shear Modulus
G12 = E1/(2*(1+vxy));

%compliance matrix
CM = [ 1/E1, -v21/E2, 0; -v12/E1, 1/E2, 0; 0, 0, 1/G12];
    
figure(1)
plot(strain{1}, stress{1});
hold on
title('Stress vs Strain 0 Strain Gauge'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )

figure(2)
plot(strain{2}, stress{2});
hold on 
title('Stress vs Strain 45 Strain Gauge'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )

figure(3)
plot(strain{3}, stress{3});
hold on 
title('Stress vs Strain 90 Strain Gauge'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )


%fracture test
for i=4:5
    
     A = dimensions(i,1)*dimensions(i,2);
     stress{i} = data{i}(:,3)/A;
     strain{i}=abs(data{i}(:,2)/L);

     %young's modulus
     youngs(i) = mean(stress{i}(150:400)./strain{i}(150:400));

     
     fprintf('Youngs Mod %s : %f \n', material(i), youngs(i) );
     tensileStress(i-3) =  max(stress{i});
     fprintf('Tensile strength %s : %f psi \n', material(i), max(stress{i}) );
end


figure(4)
plot(strain{4}, stress{4});
hold on 
title('Stress vs Strain 0 Strain Gauge'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )

figure(5)
plot(strain{5}, stress{5});
hold on 
title('Stress vs Strain 45 Strain Gauge'); 
xlabel( 'Strain [%]' )
ylabel( 'Stress [psi]' )



