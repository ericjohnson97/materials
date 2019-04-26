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
    d=data{i}(1,2);
    b=data{i}(2,2);
    L=data{i}(3,2);
    c = d/2;
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

figure(2)
title("Weibull Distribution"); 
xlabel( 'Stress [MPa]' )
ylabel( 'Probability' )

hold on
sigma0 = 300;
sigma = [0:600];
m = [5, 10, 20];
for color=1:3
    P{color} = exp(-(sigma./sigma0).^m(color) );
end
plot(sigma, P{1})
hold on
plot(sigma, P{2})
hold on
plot(sigma, P{3})
hold on
legend('m=5', 'm=10', 'm=20')


figure(3)
title("Weibull Distribution"); 
xlabel( 'Stress [psi]' )
ylabel( 'Probability' )
hold on
V = d*b*L;
style = [ "r", "b", "g"];
e = 2.718;
sigma = [0:600]*145.038;
for ii=1:length(sigma)
    counter=0;
    for i=1:length(data)
        if sigma(ii) < flexuralStrength(i)
            counter = counter + 1;
        end
    end
    Pex(ii) = counter/29;
end

[val, pos] = min(abs(Pex - .3679));
refStress = sigma(pos);

plot(sigma, Pex);
figure()
title("Finding Weibull Modulus"); 
xlabel( 'ln[sig/sig0]' )
ylabel( 'ln[ln[P(sig, V0)]]' )
hold on

for i=1:length(flexuralStrength)
   [val, pos] = min(abs(sigma - flexuralStrength(i)));
   Pexf(i) = Pex(pos);
end


hold on 
A = log(log(1./Pexf));
A(9) = 1;
A(12) = -3;
B = sortrows(A);
fit = polyfit(B(:,1), B(:,2), 1);
scatter(log(flexuralStrength/refStress), A)




