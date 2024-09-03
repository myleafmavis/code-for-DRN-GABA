clear all
close all
clc

%读取数据
% %%%光调控ChR2
[DRN_ChR2,OFF_s12,OFF_s13]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_ChR2_DRN');   %实验组  第3－5对应于三个3分钟进入开放臂的持续时间
[DRN_mCherry_437nm,OFF_s22,OFF_s23]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_mCherry_473nm');          %对照组
% 
% %%%光调控NPHR
% [DRN_NPHR,OFF_s12,OFF_s13]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_NPHR_DRN');   %实验组  第3－5对应于三个3分钟进入开放臂的持续时间
% [DRN_mCherry_589nm,OFF_s22,OFF_s23]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_mCherry_589nm');               %对照组
% 
% 绘图
figure(1)
subplot(1,2,1)
x=1:3;
for i=1:length(DRN_ChR2(:,1))
 plot(x,DRN_ChR2(i,3:5),'-om','Color',[255 0 0]/256,'MarkerFaceColor',[255 0 0]/256,'LineWidth',1);hold on;
%  plot(x,DRN_mCherry_437nm(i,3:5),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
end
for i=1:length(DRN_mCherry_437nm(:,1))
%  plot(x,DRN_ChR2(i,3:5),'-om','Color',[255 0 0]/256,'MarkerFaceColor',[255 0 0]/256,'LineWidth',1);hold on;
 plot(x,DRN_mCherry_437nm(i,3:5),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
end
axis([0.5 3.5 0 120]);ylabel('Duration in open arm (s)');legend('ChR2','mCherry');xlabel('ChR2')
% 
% subplot(1,2,2)
% x=1:3;
% for i=1:length(DRN_NPHR(:,1))
%  plot(x,DRN_NPHR(i,3:5),'-om','Color',[255 128 0]/256,'MarkerFaceColor',[255 128 0]/256,'LineWidth',1);hold on;
%  plot(x,DRN_mCherry_589nm(i,3:5),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
% end
% axis([0.5 3.5 0 120]);ylabel('Duration in open arm (s)');legend('NPHR','mCherry');xlabel('SNr-DRN')



