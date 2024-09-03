clear all
close all
clc

[DRN_hM3Dq_Saline,OFF_s12,OFF_s13]=xlsread('WST_DRN_hM3Dq_analyse_lu.xlsx','DRN_hM3Dq_Saline_alter');   %control  第3－5对应于三个3分钟进入开放臂的持续时间
[DRN_hM3Dq_CNO,OFF_s22,OFF_s23]=xlsread('WST_DRN_hM3Dq_analyse_lu.xlsx','DRN_hM3Dq_CNO_alter');

SAL=DRN_hM3Dq_Saline(:,3:5);mean_SAL=mean(SAL);std_SAL=std(SAL)./sqrt(length(SAL(:,1)));
CNO=DRN_hM3Dq_CNO(:,3:5);   mean_CNO=mean(CNO);std_CNO=std(CNO)./sqrt(length(CNO(:,1)));

figure(1)
subplot(2,2,1)
x=1:3;
for i=1:length(DRN_hM3Dq_Saline(:,1))
 plot(x,DRN_hM3Dq_Saline(i,3:5),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
 plot(x,mean_SAL,'-o','Color',[0 191 255]/256,'MarkerFaceColor',[0 191 255]/256,'LineWidth',2);hold on;errorbar(x,mean_SAL,std_SAL,'Color',[0 191 255]/256,'LineWidth',2);
end
xlabel('Time from injection');ylabel('Duration in warm spot (s)');title('DRN hM3Dq Saline');axis([0.5 3.5 0 600]);
subplot(2,2,2)
for i=1:length(DRN_hM3Dq_CNO(:,1))
 plot(x,DRN_hM3Dq_CNO(i,3:5),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
 plot(x,mean_CNO,'-om','MarkerFaceColor',[180 130 190]/256,'LineWidth',2);hold on;errorbar(x,mean_CNO,std_CNO,[180 130 190]/256,'LineWidth',2);
end
xlabel('Time from injection');ylabel('Duration in warm spot (s)');title('DRN hM3Dq CNO');axis([0.5 3.5 0 800]);

% figure(2)
SAL_rank1=DRN_hM3Dq_Saline(:,12:14);SAL_rank=5-SAL_rank1;mean_SAL_rank=mean(SAL_rank);std_SAL_rank=std(SAL_rank)./sqrt(length(SAL_rank(:,1)));
CNO_rank1=DRN_hM3Dq_CNO(:,12:14);   CNO_rank=5-CNO_rank1;mean_CNO_rank=mean(CNO_rank);std_CNO_rank=std(CNO_rank)./sqrt(length(CNO_rank(:,1)));
subplot(2,2,3)
for i=1:length(DRN_hM3Dq_Saline(:,1))
 plot(x,SAL_rank(i,:),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
 plot(x,mean_SAL_rank,'-o','Color',[0 191 255]/256,'MarkerFaceColor',[0 191 255]/256,'LineWidth',2);hold on;errorbar(x,mean_SAL_rank,std_SAL_rank,'Color',[0 191 255]/256,'LineWidth',2);
end
xlabel('Time from injection');ylabel('Rank in warm spot test (s)');title('DRN hM3Dq Saline');axis([0.5 3.5 0 5]);
subplot(2,2,4)
for i=1:length(DRN_hM3Dq_CNO(:,1))
 plot(x,CNO_rank(i,:),'-o','Color',[190 190 190]/256,'MarkerFaceColor',[190 190 190]/256,'LineWidth',1);hold on; 
 plot(x,mean_CNO_rank,'-om','MarkerFaceColor','m','LineWidth',2);hold on;errorbar(x,mean_CNO_rank,std_CNO_rank,'m','LineWidth',2);
end
xlabel('Time from injection');ylabel('Rank in warm spot test (s)');title('DRN hM3Dq CNO');axis([0.5 3.5 0 5]);



