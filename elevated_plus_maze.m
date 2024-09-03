clear all
close all
clc

%��ȡ����
% %%%�����ChR2
[DRN_ChR2,OFF_s12,OFF_s13]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_ChR2_DRN');   %ʵ����  ��3��5��Ӧ������3���ӽ��뿪�ű۵ĳ���ʱ��
[DRN_mCherry_437nm,OFF_s22,OFF_s23]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_mCherry_473nm');          %������
% 
% %%%�����NPHR
% [DRN_NPHR,OFF_s12,OFF_s13]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_NPHR_DRN');   %ʵ����  ��3��5��Ӧ������3���ӽ��뿪�ű۵ĳ���ʱ��
% [DRN_mCherry_589nm,OFF_s22,OFF_s23]=xlsread('EPM-statistics_lu.xlsx','C57_DRN_mCherry_589nm');               %������
% 
% ��ͼ
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



