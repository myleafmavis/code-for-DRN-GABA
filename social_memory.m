clear all;
close all
clc

%%%%% 1 distance
ChR2=xlsread('SM_statistic_lu.xlsx','C57_DRN_ChR2_DRN');  %%数据格式：NO. ID  3-12列第1－10分钟的distance(off on off...)  总距离off  总距离on  总距离
mCherry_473nm=xlsread('SM_statistic_lu.xlsx','C57_DRN_mCherry_473nm');
NPHR=xlsread('SM_statistic_lu.xlsx','C57_DRN_NPHR_DRN');
mCherry_589nm=xlsread('SM_statistic_lu.xlsx','C57_DRN_mCherry_589nm');

mean_ChR2=mean(ChR2);                std_ChR2=std(ChR2)./sqrt(length(ChR2(:,1)));  
mean_mCherry_473nm=mean(mCherry_473nm);                          std_mCherry_473nm=std(mCherry_473nm)./sqrt(length(mCherry_473nm(:,1)));
mean_NPHR=mean(NPHR);        std_NPHR=std(NPHR)./sqrt(length(NPHR(:,1)));
mean_mCherry_589nm=mean(mCherry_589nm);                  std_mCherry_589nm=std(mCherry_589nm)./sqrt(length(mCherry_589nm(:,1)));

x1=0.5; x2=1.0; x3=2.0; x4=2.5;
C1=[0 0 0];C2=[1 1 1];C3 = [0 191 255]/256;C4 = [255 128 0]/256;
figure(1)
subplot(1,2,1)
superbar(x1,mean_mCherry_473nm(13), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_mCherry_473nm(13), 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_mCherry_473nm(14), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_mCherry_473nm(14), 'ErrorbarColor',C3);
superbar(x3,mean_ChR2(13), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_ChR2(13), 'ErrorbarColor',C1);hold on; 
superbar(x4,mean_ChR2(14), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_ChR2(14), 'ErrorbarColor',C3);
legend('Familiar','Novel');
xlabel('mCherry             ChR2')
ylabel('In zone duration /min(s)');
set(gca,'linewidth',2);
axis([0 3 0 50]);
title('ChR2');

subplot(1,2,2)
superbar(x1,mean_mCherry_589nm(13), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_mCherry_589nm(13), 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_mCherry_589nm(14), 'BarWidth',0.5,'BarFaceColor',C4, 'E', std_mCherry_589nm(14), 'ErrorbarColor',C4);
superbar(x3,mean_NPHR(13), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', std_NPHR(13), 'ErrorbarColor',C1);hold on; 
superbar(x4,mean_NPHR(14), 'BarWidth',0.5,'BarFaceColor',C4, 'E', std_NPHR(14), 'ErrorbarColor',C4);
legend('Familiar','Novel');
xlabel('mCherry             NPHR')
ylabel('In zone duration /min(s)');
set(gca,'linewidth',2);
axis([0 3 0 50]);
title('NPHR');