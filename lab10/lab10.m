%materials lab 10
clc; clear all; close all;

[~,sheet_name]=xlsfinfo('Lab10FractureData.xlsx')
for k=1:numel(sheet_name)
  data{k}=xlsread('Lab10FractureData.xlsx',sheet_name{k})
end

b = [0.5, 0.25, 0.125];
blabel = ["0.5", "0.25", "0.125"];
w = 2;
a{1} = [0.9495, 0.8095, 1.17, 0.779];
a{2} = [0.674, 0.902, 1.082, 0.936];
a{3} = [0.667, 1.051, 0.8525];	


for i=2:length(data)
    for ii=1:length(a{i-1})
        Pmax = max(data{i}(:,(ii-1)*4+2))
        x = a{i-1}(ii)/w;
        fx = 29.6*x^(1/2)-185.5*x^(3/2)+655.7*x^(5/2)-1017*x^(7/2)+639*x^(9/2);
        Kc{i-1}(ii) = (Pmax/(b(i-1)*w^(1/2)))*fx;
        
        
       
    end
end



aCombined = [a{1}, a{2}, a{3}];
KcCombined = [Kc{1}, Kc{2}, Kc{3}];
bCombined = [0.5, 0.5, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.125, 0.125, 0.125];

figure(1)
scatter(aCombined, KcCombined)

aAvg(1) = mean(a{1});
aAvg(2) = mean(a{2});
aAvg(3) = mean(a{3});

figure(2)
scatter(b, aAvg);
hold on
title('Toughness vs Thickness');
xlabel('thickness [in]')
ylabel('toughness [lb-in^1/2]')

%determain if Kc can be KIC
stressY = 57000;

for i=1:length(KcCombined)
    2.58*(KcCombined(i)/stressY)^2
    if aCombined(i) > 2.58*(KcCombined(i)/stressY)^2 && bCombined(i) > 2.58*(KcCombined(i)/stressY)^2
        fprintf('Kc = %f for b = %f and a = %f can be KCI ', KcCombined(i), bCombined(i), aCombined(i))
    end
end

%load vs displacement
for i=2:length(data)
    for ii=1:length(a{i-1})
        load{i}{ii} = data{i}(:,(ii-1)*4+2);
        disp{i}{ii} = data{i}(:,(ii-1)*4+1);
        
       	
    end
    figure(i + 2)
    ax1 = subplot(4,1,1);
    plot(disp{i}{1}/disp{i}{1}(1),load{i}{1})
    title(strcat("Load vs Displacement ", blabel(i-1)) )
    ylabel('load [psi]')
    ax2 = subplot(4,1,2);
    plot(disp{i}{2}/disp{i}{2}(1),load{i}{2})
    ylabel('load [psi]')
    ax3 = subplot(4,1,3);
    plot(disp{i}{3}/disp{i}{3}(1),load{i}{3})
    ylabel('load [psi]')
    if i == length(data)
        linkaxes([ax1,ax2,ax3],'xy')
    else
        ax4 = subplot(4,1,4);
        plot(disp{i}{4}/disp{i}{4}(1),load{i}{4})
        hold on
        linkaxes([ax1,ax2,ax3, ax4],'xy')
    end
    xlabel('Displacement [%]')
    ylabel('load [psi]')
    

end
    




[~,sheet_name]=xlsfinfo('Lab10FractureDataLinear.xlsx')
for k=1:numel(sheet_name)
  dataL{k}=xlsread('Lab10FractureDataLinear.xlsx',sheet_name{k})
end

for i=1:length(dataL)
    slope(i,:) = polyfit(dataL{i}(:,2), dataL{i}(:,1), 1); 
  
end
slope
figure(7)
scatter(aCombined, slope(:,1) )

    
    
    
    
    