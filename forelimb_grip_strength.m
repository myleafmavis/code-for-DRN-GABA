
clear all
close all
clc

[DRN_ChR2_EGFP,OFF_s12,OFF_s13]=xlsread('握力数据.xlsx','C57-DRN-ChR2-473nm10mw');   %%第23列分别为ON OFF
% [DRN_EYFP,OFF_s22,OFF_s23]=xlsread('握力数据.xlsx','C57-DRN-ochIEF-473nm20hz20sm8mw'); 
% [DRN_CeA_ChR2_EYFP,OFF_s32,OFF_s33]=xlsread('5前爪抓力测试.xlsx','DRN-CeA-ChR2-EYFP'); 
% [DRN_CeA_EYFP,OFF_s42,OFF_s43]=xlsread('5前爪抓力测试.xlsx','DRN-CeA-EYFP'); 

mean_DRN_ChR2_EGFP=mean(DRN_ChR2_EGFP(:,2:3));std_DRN_ChR2_EGFP=std(DRN_ChR2_EGFP(:,2:3));
% mean_DRN_EYFP=mean(DRN_EYFP(:,2:3));std_DRN_EYFP=std(DRN_EYFP(:,2:3));
% mean_DRN_CeA_ChR2_EYFP=mean(DRN_CeA_ChR2_EYFP(:,2:3));std_DRN_CeA_ChR2_EYFP=std(DRN_CeA_ChR2_EYFP(:,2:3));
% mean_DRN_CeA_EYFP=mean(DRN_CeA_EYFP(:,2:3));std_DRN_CeA_EYFP=std(DRN_CeA_EYFP(:,2:3));

%%%%% 画图 
x1=0.5; x2=1.0; x3=2.0; x4=2.5;
C1=[0 0 0];C2=[1 1 1];C3 = [0 191 255]./256;
figure(1)
% subplot(1,2,1)  %%% 第2列对应OFF
% superbar(x1,mean_DRN_EYFP(2), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_DRN_EYFP(2)/40 std_DRN_EYFP(2)], 'ErrorbarColor',C1);hold on; 
% superbar(x2,mean_DRN_EYFP(1), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_DRN_EYFP(1), 'ErrorbarColor',C3);
superbar(x3,mean_DRN_ChR2_EGFP(2), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_DRN_ChR2_EGFP(2)/40 std_DRN_ChR2_EGFP(2)], 'ErrorbarColor',C1);hold on; 
superbar(x4,mean_DRN_ChR2_EGFP(1), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_DRN_ChR2_EGFP(1), 'ErrorbarColor',C3);
xlabel('DRN');ylabel('Grip strength of forelimb  (N)');set(gca,'linewidth',2);legend('Light off','Light on');

% subplot(1,2,2)  %%% 第2列对应OFF
% superbar(x1,mean_DRN_CeA_EYFP(2), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_DRN_CeA_EYFP(2)/40 std_DRN_CeA_EYFP(2)], 'ErrorbarColor',C1);hold on; 
% superbar(x2,mean_DRN_CeA_EYFP(1), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_DRN_CeA_EYFP(1), 'ErrorbarColor',C3);
% superbar(x3,mean_DRN_CeA_ChR2_EYFP(2), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_DRN_CeA_ChR2_EYFP(2)/40 std_DRN_CeA_ChR2_EYFP(2)], 'ErrorbarColor',C1);hold on; 
% superbar(x4,mean_DRN_CeA_ChR2_EYFP(1), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_DRN_CeA_ChR2_EYFP(1), 'ErrorbarColor',C3);
% xlabel('DRN-CeA-EYFP  DRN-CeA-ChR2-EYFP');ylabel('Grip strength of forelimb  (N)');set(gca,'linewidth',2);legend('Light off','Light on');

