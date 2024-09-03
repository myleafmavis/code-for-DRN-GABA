clear all;
close all
clc

%%%% 文件读取
DRN_ChR2_DRN = xlsread('OFT_Tracking_statistic_lu.xlsx','C57_DRN_ChR2_DRN')              
DRN_NPHR_DRN = xlsread('OFT_Tracking_statistic_lu.xlsx','C57_DRN_NPHR_DRN')
DRN_ChR2_DRN_CT = xlsread('OFT_CenterTime_statistic_lu.xlsx','C57_DRN_ChR2_DRN')
DRN_NPHR_DRN_CT = xlsread('OFT_CenterTime_statistic_lu.xlsx','C57_DRN_NPHR_DRN')
DRN_ChR2_DRN_CC = xlsread('OFT_CenterCount_statistic_lu.xlsx','C57_DRN_ChR2_DRN')
DRN_NPHR_DRN_CC = xlsread('OFT_CenterCount_statistic_lu.xlsx','C57_DRN_NPHR_DRN')

%%%% Total tracking
mean_DRN_ChR2_DRN=mean(DRN_ChR2_DRN);
std_DRN_ChR2_DRN=std(DRN_ChR2_DRN)./sqrt(length(DRN_ChR2_DRN(:,1)));

mean_DRN_NPHR_DRN=mean(DRN_NPHR_DRN);
std_DRN_NPHR_DRN=std(DRN_NPHR_DRN)./sqrt(length(DRN_NPHR_DRN(:,1)));

x=1:10;
figure(1)  %%%% OFF-ON期间 每一分钟 运动距离的变化
subplot(2,2,1)
plot(x,mean_DRN_ChR2_DRN(3:12),'-om','Color',[0 191 255]/256,'MarkerFaceColor',[0 191 255]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_ChR2_DRN(3:12),std_DRN_ChR2_DRN(3:12),'m','Color',[0 191 255]/256,'LineWidth',1);
axis([0 11 0 1500]);
xlabel('Time (min)');
ylabel('Average distance (cm/min)');
legend('ChR2');
title('ChR2');
set(gca,'linewidth',2);

subplot(2,2,2)
plot(x,mean_DRN_NPHR_DRN(3:12),'-om','Color',[255 128 0]/256,'MarkerFaceColor',[255 128 0]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_NPHR_DRN(3:12),std_DRN_NPHR_DRN(3:12),'m','Color',[255 128 0]/256,'LineWidth',1);
axis([0 11 0 1500]);
xlabel('Time (min)');
ylabel('Average distance (cm/min)');
legend('NPHR');
title('NPHR');
set(gca,'linewidth',2);

%%%%定义数值 简化代码
x1=[0.5 2.0 3.5 5.0 6.5];
x2=[1.0 2.5 4.0 5.5 7.0];
C1=[0 0 0];C2=[1 1 1];C3 = [0 191 255]./256;C4 = [255 128 0]./256;
mean_du_permin_DRN_ChR2_DRN=mean_DRN_ChR2_DRN([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_ChR2_DRN=std_DRN_ChR2_DRN([13 14])./5;
mean_du_permin_DRN_NPHR_DRN=mean_DRN_NPHR_DRN([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_NPHR_DRN=std_DRN_NPHR_DRN([13 14])./5;

subplot(2,2,3)   %%%% OFF-ON期间 运动距离的变化
superbar(x1(1),mean_du_permin_DRN_ChR2_DRN(1), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_du_permin_DRN_ChR2_DRN(1), 'ErrorbarColor',C1);hold on; 
superbar(x2(1),mean_du_permin_DRN_ChR2_DRN(2), 'BarWidth',0.5,'BarEdgeColor',C3, 'BarFaceColor', C3, 'E', std_du_permin_DRN_ChR2_DRN(2), 'ErrorbarColor',C3);hold on; 
set(gca,'linewidth',2);
ylabel('Average distance (cm/min)');
legend('Light off','Light on');
title('ChR2')

subplot(2,2,4)
superbar(x1(2),mean_du_permin_DRN_NPHR_DRN(1), 'BarWidth',0.5,'BarEdgeColor',C1,'BarFaceColor', C2, 'E', std_du_permin_DRN_NPHR_DRN(1), 'ErrorbarColor',C1);hold on;
superbar(x2(2),mean_du_permin_DRN_NPHR_DRN(2), 'BarWidth',0.5,'BarFaceColor',C4,'BarFaceColor', C4, 'E', std_du_permin_DRN_NPHR_DRN(2), 'ErrorbarColor',C4);hold on; 
set(gca,'linewidth',2);
ylabel('Average distance (cm/min)');
legend('Light off','Light on');
title('NPHR')

%%%%  Center Time
mean_DRN_ChR2_DRN_CT=mean(DRN_ChR2_DRN_CT);
std_DRN_ChR2_DRN_CT=std(DRN_ChR2_DRN_CT)./sqrt(length(DRN_ChR2_DRN_CT(:,1)));

mean_DRN_NPHR_DRN_CT=mean(DRN_NPHR_DRN_CT);
std_DRN_NPHR_DRN_CT=std(DRN_NPHR_DRN_CT)./sqrt(length(DRN_NPHR_DRN_CT(:,1)));

figure(2)  %%%% OFF-ON期间 每一分钟 中央区时长占总时间的百分比
subplot(2,2,1)
plot(x,mean_DRN_ChR2_DRN_CT(3:12),'-om','Color',[0 191 255]/256,'MarkerFaceColor',[0 191 255]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_ChR2_DRN_CT(3:12),std_DRN_ChR2_DRN_CT(3:12),'m','Color',[0 191 255]/256,'LineWidth',1);
xlabel('Time (min)');
ylabel('% of center duration /min');
legend('ChR2');
title('ChR2');
axis([0 11 0 18]);
set(gca,'linewidth',2);

subplot(2,2,2)
plot(x,mean_DRN_NPHR_DRN_CT(3:12),'-om','Color',[255 128 0]/256,'MarkerFaceColor',[255 128 0]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_NPHR_DRN_CT(3:12),std_DRN_NPHR_DRN_CT(3:12),'m','Color',[255 128 0]/256,'LineWidth',1);
xlabel('Time (min)');
ylabel('% of center duration /min');
legend('NPHR');
title('NPHR');
axis([0 11 0 18]);
set(gca,'linewidth',2);

mean_du_permin_DRN_ChR2_DRN_CT=mean_DRN_ChR2_DRN_CT([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_ChR2_DRN_CT=std_DRN_ChR2_DRN_CT([13 14])./5;
mean_du_permin_DRN_NPHR_DRN_CT=mean_DRN_NPHR_DRN_CT([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_NPHR_DRN_CT=std_DRN_NPHR_DRN_CT([13 14])./5;

subplot(2,2,3)   %%%% OFF-ON期间 中央区时间百分百变化
superbar(x1(1),mean_du_permin_DRN_ChR2_DRN_CT(1), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_du_permin_DRN_ChR2_DRN_CT(1), 'ErrorbarColor',C1);hold on; 
superbar(x2(1),mean_du_permin_DRN_ChR2_DRN_CT(2), 'BarWidth',0.5,'BarEdgeColor',C3, 'BarFaceColor', C3, 'E', std_du_permin_DRN_ChR2_DRN_CT(2), 'ErrorbarColor',C3);hold on; 
set(gca,'linewidth',2);
ylabel('% of center duratin /min');
legend('Light off','Light on');
title('ChR2');

subplot(2,2,4)
superbar(x1(2),mean_du_permin_DRN_NPHR_DRN_CT(1), 'BarWidth',0.5,'BarEdgeColor',C1,'BarFaceColor', C2, 'E', std_du_permin_DRN_NPHR_DRN_CT(1), 'ErrorbarColor',C1);hold on; 
superbar(x2(2),mean_du_permin_DRN_NPHR_DRN_CT(2), 'BarWidth',0.5,'BarFaceColor',C4,'BarFaceColor', C4, 'E', std_du_permin_DRN_NPHR_DRN_CT(2), 'ErrorbarColor',C4);hold on; 
set(gca,'linewidth',2);
ylabel('% of center duratin /min');
legend('Light off','Light on');
title('NPHR');


%%%% Center Count
mean_DRN_ChR2_DRN_CC=mean(DRN_ChR2_DRN_CC);
std_DRN_ChR2_DRN_CC=std(DRN_ChR2_DRN_CC)./sqrt(length(DRN_ChR2_DRN_CC(:,1)));

mean_DRN_NPHR_DRN_CC=mean(DRN_NPHR_DRN_CC);
std_DRN_NPHR_DRN_CC=std(DRN_NPHR_DRN_CC)./sqrt(length(DRN_NPHR_DRN_CC(:,1)));

figure(3)  %%%% OFF-ON期间 每一分钟 进入中央区的次数
subplot(2,2,1)
plot(x,mean_DRN_ChR2_DRN_CC(3:12),'-om','Color',[0 191 255]/256,'MarkerFaceColor',[0 191 255]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_ChR2_DRN_CC(3:12),std_DRN_ChR2_DRN_CC(3:12),'m','Color',[0 191 255]/256,'LineWidth',1);
xlabel('Time (min)');
ylabel('Number of entering center /min');
legend('ChR2');
title('ChR2');
axis([0 11 0 10]);
set(gca,'linewidth',2);

subplot(2,2,2)
plot(x,mean_DRN_NPHR_DRN_CC(3:12),'-om','Color',[255 128 0]/256,'MarkerFaceColor',[255 128 0]/256,'LineWidth',1);hold on;
errorbar(x,mean_DRN_NPHR_DRN_CC(3:12),std_DRN_NPHR_DRN_CC(3:12),'m','Color',[255 128 0]/256,'LineWidth',1);
xlabel('Time (min)');
ylabel('Number of entering center /min');
legend('NPHR');
title('NPHR');
axis([0 11 0 10]);
set(gca,'linewidth',2);

mean_du_permin_DRN_ChR2_DRN_CC=mean_DRN_ChR2_DRN_CC([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_ChR2_DRN_CC=std_DRN_ChR2_DRN_CC([13 14])./5;
mean_du_permin_DRN_NPHR_DRN_CC=mean_DRN_NPHR_DRN_CC([13 14])./5;   %针对light off（13）和light on（14）进行5分钟平均
std_du_permin_DRN_NPHR_DRN_CC=std_DRN_NPHR_DRN_CC([13 14])./5;

subplot(2,2,3)   %%%% OFF-ON期间 中央区次数统计
superbar(x1(1),mean_du_permin_DRN_ChR2_DRN_CC(1), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_du_permin_DRN_ChR2_DRN_CC(1), 'ErrorbarColor',C1);hold on; 
superbar(x2(1),mean_du_permin_DRN_ChR2_DRN_CC(2), 'BarWidth',0.5,'BarEdgeColor',C3, 'BarFaceColor', C3, 'E', std_du_permin_DRN_ChR2_DRN_CC(2), 'ErrorbarColor',C3);hold on; 
set(gca,'linewidth',2);
ylabel('Number of entering center /min');
legend('Light off','Light on');
title('ChR2');

subplot(2,2,4)
superbar(x1(2),mean_du_permin_DRN_NPHR_DRN_CC(1), 'BarWidth',0.5,'BarEdgeColor',C1,'BarFaceColor', C2, 'E', std_du_permin_DRN_NPHR_DRN_CC(1), 'ErrorbarColor',C1);hold on; 
superbar(x2(2),mean_du_permin_DRN_NPHR_DRN_CC(2), 'BarWidth',0.5,'BarFaceColor',C4,'BarFaceColor', C4, 'E', std_du_permin_DRN_NPHR_DRN_CC(2), 'ErrorbarColor',C4);hold on; 
set(gca,'linewidth',2);
ylabel('Number of entering center /min');
legend('Light off','Light on');
title('NPHR');













