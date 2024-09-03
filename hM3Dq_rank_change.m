clear all
close all
clc

%%% ��һ����CNO�����ȼ��Ķ�̬�仯
rankchange=[1	1	1	1	1	2	4	3	3   3       % ���ȼ��仯-��ѧ�Ŵ�hM3Dq.xlsx �����ȼ��ı�2������
            2	2	2	2	2	1	1	1	1   1       % ��ҩ����ȼ��仯��д�ڵ�һ��
            4	4	4	4	4	4	3	4   4   4
            3	3	3	3	3	3	2	2	2   2];
rankchange=5-rankchange;
figure(1)
subplot(2,2,1)
plot(rankchange(1,:),'-sm','MarkerFaceColor','m','LineWidth',2);hold on;
plot(rankchange(2,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(rankchange(3,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(rankchange(4,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
axis([0 11 0.5 4.5]);  %�����᷶Χ
xticklabel_rotate([1:10],45,{'-72','-48','-24','0','1-1.5','3-5','6-8','24','48','72'},'interpreter','none'); 
text(11,0.2,'(hr)');set(gca,'linewidth',1);

%%%% ��ʵ���顢��ˮ�鼰���ղ���������ȼ���̬�仯
[hM3Dq_CNO_s11,hM3Dq_CNO_s12,hM3Dq_CNO_s13]=xlsread('C57_DRN_hM3Dq_ԭʼ�ȼ���¼.xlsx','C57_DRN_hM3Dq_CNO_RC');                  %ʵ�����CNO
[hM3Dq_Saline_s11,hM3Dq_Saline_s12,hM3Dq_Saline_s13]=xlsread('C57_DRN_hM3Dq_ԭʼ�ȼ���¼.xlsx','C57_DRN_hM3Dq_Saline_RC');      %ʵ�����Saline
[mCherry_CNO_s11,mCherry_CNO_s12,mCherry_CNO_s13]=xlsread('C57_DRN_hM3Dq_ԭʼ�ȼ���¼.xlsx','C57_DRN_mCherry_CNO_RC');                      %�������CNO
mean_hM3Dq_CNO=mean(hM3Dq_CNO_s11(:,2:end));std_hM3Dq_CNO=std(hM3Dq_CNO_s11(:,2:end))/sqrt(length(mean_hM3Dq_CNO(:,2:end)));
mean_hM3Dq_Saline=mean(hM3Dq_Saline_s11(:,2:end));std_hM3Dq_Saline=std(hM3Dq_Saline_s11(:,2:end))/sqrt(length(mean_hM3Dq_Saline(:,2:end)));
mean_mCherry_CNO=mean(mCherry_CNO_s11(:,2:end));std_mCherry_CNO=std(mCherry_CNO_s11(:,2:end))/sqrt(length(mean_mCherry_CNO(:,2:end)));
subplot(2,2,3)
plot(mean_hM3Dq_Saline+0.4,'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(mean_mCherry_CNO+0.2,'-s','Color',[255 165 0]/256,'MarkerFaceColor',[255 165 0]/256,'LineWidth',2);hold on;
axis([0 11 -2 1]);    %�����᷶Χ
plot(mean_hM3Dq_CNO,'-sm','MarkerFaceColor','m','LineWidth',2);errorbar(mean_hM3Dq_CNO,std_hM3Dq_CNO,'m','LineWidth',2);hold on;
xticklabel_rotate([1:10],45,{'-72','-48','-24','0','1-1.5','3-5','6-8','24','48','72'},'interpreter','none');
text(11,-1.2,'(hr)');set(gca,'linewidth',1);
legend('mCherry+CNO','hM3Dq+Saline','hM3Dq+CNO')     %ǰ72��48��24����ҩ��1.5��3.5��6��24��48��72 ��xticklabel_rotate([1:10]


%%%% ��ʵ������ÿֻ����Ķ�̬�仯����ά����ͼ
x=ones(1,10);y=1:10;                                     %ǰ72��48��24����ҩ��1.5��3.5��6��24��48��72 ��x=ones(1,10)
[hM3Dq_CNO_3d_line]=xlsread('C57_DRN_hM3Dq_ԭʼ�ȼ���¼.xlsx','C57_DRN_hM3Dq_CNO_RC');      %��ȡ��Ҫ����3Dͼ����ļ�
hM3Dq_CNO_3d_line=fliplr(hM3Dq_CNO_3d_line(:,2:end));
subplot(2,2,2)
% Ϊ��ͬ������䲻ͬ����ɫ �����ļ��ڸ���������Ҫ���ӻ�ɾ������plot�������� ��ע���޸�axis����ֵ
plot3(x,y,hM3Dq_CNO_3d_line(1,:),'Color',[255 0 0]/256,'LineWidth',2);hold on;
plot3(x+1,y,hM3Dq_CNO_3d_line(2,:),'Color',[255 97 0]/256,'LineWidth',2);hold on;
plot3(x+2,y,hM3Dq_CNO_3d_line(3,:),'Color',[244 164 96]/256,'LineWidth',2);hold on;
plot3(x+3,y,hM3Dq_CNO_3d_line(4,:),'Color',[255 215 0]/256,'LineWidth',2);hold on;
plot3(x+4,y,hM3Dq_CNO_3d_line(5,:),'Color',[100 230 100]/256,'LineWidth',2);hold on;
plot3(x+5,y,hM3Dq_CNO_3d_line(6,:),'Color',[48 128 20]/256,'LineWidth',2);hold on;
plot3(x+6,y,hM3Dq_CNO_3d_line(7,:),'Color',[30 144 255]/256,'LineWidth',2);hold on;
% plot3(x+7,y,hM3Dq_CNO_3d_line(8,:),'Color',[0 0 255]/256,'LineWidth',2);hold on;
% plot3(x+8,y,hM4Di_CNO_3d_line(9,:),'Color',[160 102 211]/256,'LineWidth',2);hold on;
set(gca,'linewidth',1);
plot3(y,x+6,x-1,'--','Color',[128 0 0]/256,'LineWidth',2);              %���Ƹ�ҩʱ�̱��
axis([0 8 0 10 -3 1]);   %�����᷶Χ

%%%% ��һ��trial�Կ�ͼ      һ�����ڶ�ע��saline��Ϊ���� �� ͬһ����ȼ��ߵĸ���ע��CNO �ȼ��͵ĸ���ע��saline����Ϊ����

%ɫ�ʱ�ǩ 
%[192 192 192]/256      stillness        ��ɫ
%[255 0 0]/256          push-initiation  ��ɫ
%[255 215 0]/256        retreat          ��ɫ
%[0 191 100]/256        push-back        ��ɫ
%[0 125 255]/256        resistance       ��ɫ

%���·ֱ�Ϊ ����1ע��saline ����2ע��saline  ����1ע��CNO ����2ע��saline  ��Ϊ�����ı��ʱ��ڵ�

x1=[7.9 8.533 16.6 17.267 18.033 20.1]-7.9; y1=[6 6 6 6 6 6];   %stii  res pb  res  pb 
x2=[7.9 8.533 16.6 17.267 18.033 20.1]-7.9; y2=[5 5 5 5 5 5 ];   %stii  pi  res pb  res      
x3=[0.4 1.367 3.033]-0.4; y3=[2 2 2];    %stii ret
x4=[0.4 1.367 3.033]-0.4; y4=[1 1 1];         %stii pi
subplot(2,2,4)

%�����Ǹ���1��ע��saline�����Ϊ����
%Ϊ�˺����ܹ�˳��������ȷ��ͼ������Ҫ�ڽ�������ͼ�Ĺ����ж��������Ϊ����ɫ
     
stii = plot(x1(1:2),y1(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;        %stii   %ָ����ɫ��Ϊstii
res = plot(x1(2:3),y1(2:3),'Color',[0 125 255]/256,'LineWidth',12);hold on;           %res    %ָ����ɫ��Ϊres
pb = plot(x1(3:4),y1(3:4),'Color',[0 191 100]/256,'LineWidth',12);hold on;            %pb     %ָ����ɫ��Ϊpb
plot(x1(4:5),y1(4:5),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res 
plot(x1(5:6),y1(5:6),'Color',[0 191 100]/256,'LineWidth',12);hold on;                 %pb
% plot(x1(6:7),y1(6:7),'Color',[0 125 255]/256,'LineWidth',12);hold on;               %res
% plot(x1(7:8),y1(7:8),'Color',[192 192 192]/256,'LineWidth',12);hold on;             %stii
% plot(x1(8:9),y1(8:9),'Color',[0 125 255]/256,'LineWidth',12);hold on;               %res
% plot(x1(9:10),y1(9:10),'Color',[0 191 100]/256,'LineWidth',12);hold on;             %pb
% plot(x1(10:11),y1(10:11),'Color',[0 125 255]/256,'LineWidth',12);hold on;           %res
% plot(x1(11:12),y1(11:12),'Color',[0 191 100]/256,'LineWidth',12);hold on;           %pb

%�����Ǹ���2�ڸ���1ע��salineʱע��saline�����Ϊ���� 
plot(x2(1:2),y2(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;               %stii  
pi = plot(x2(2:3),y2(2:3),'Color',[255 0 0]/256,'LineWidth',12);hold on;              %pi     %ָ����ɫ��Ϊpi 
plot(x2(3:4),y2(3:4),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res
plot(x2(4:5),y2(4:5),'Color',[0 191 100]/256,'LineWidth',12);hold on;                 %pb
plot(x2(5:6),y2(5:6),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res
% plot(x2(6:7),y2(6:7),'Color',[0 191 100]/256,'LineWidth',12);hold on;               %pb
% plot(x2(7:8),y2(7:8),'Color',[192 192 192]/256,'LineWidth',12);hold on;             %stii
% plot(x2(8:9),y2(8:9),'Color',[255 0 0]/256,'LineWidth',12);hold on;                 %pi
% plot(x2(9:10),y2(9:10),'Color',[0 125 255]/256,'LineWidth',12);hold on;             %res
% plot(x2(10:11),y2(10:11),'Color',[0 191 100]/256,'LineWidth',12);hold on;           %pb
% plot(x2(11:12),y2(11:12),'Color',[255 215 0]/256,'LineWidth',12);hold on;           %ret

%�����Ǹ���1��ע��CNO�����Ϊ���� 

plot(x3(1:2),y3(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;      %stii
ret = plot(x3(2:3),y3(2:3),'Color',[255 215 0]/256,'LineWidth',12);hold on;          %ret  %ָ����ɫ��Ϊret
% plot(x3(3:4),y3(3:4),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x3(4:5),y3(4:5),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x3(5:6),y3(5:6),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x3(6:7),y3(6:7),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x3(7:8),y3(7:8),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x3(8:9),y3(8:9),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x3(9:10),y3(9:10),'Color',[0 125 255]/256,'LineWidth',12);hold on;      %res
% plot(x3(10:11),y3(10:11),'Color',[0 191 100]/256,'LineWidth',12);hold on;    %pb
% plot(x3(11:12),y3(11:12),'Color',[0 125 255]/256,'LineWidth',12);hold on;    %res
% plot(x3(12:13),y3(12:13),'Color',[255 215 0]/256,'LineWidth',12);hold on;    %ret
% plot(x3(13:14),y3(13:14),'Color',[0 191 100]/256,'LineWidth',12);hold on;    %pb
% plot(x3(14:15),y3(14:15),'Color',[255 215 0]/256,'LineWidth',12);hold on;    %ret

%�����Ǹ���2�ڸ���1ע��CNOʱע��saline�����Ϊ����  

plot(x4(1:2),y4(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;      %stii
plot(x4(2:3),y4(2:3),'Color',[255 0 0]/256,'LineWidth',12);hold on;        %pi
% plot(x4(3:4),y4(3:4),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x4(4:5),y4(4:5),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x4(5:6),y4(5:6),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x4(6:7),y4(6:7),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x4(7:8),y4(7:8),'Color',[0 191 100]/256,'LineWidth',12);hold on;        %pb
% plot(x4(8:9),y4(8:9),'Color',[0 125 255]/256,'LineWidth',12);hold on;        %res
% plot(x4(9:10),y4(9:10),'Color',[0 191 100]/256,'LineWidth',12);hold on;      %pb
% plot(x4(10:11),y4(10:11),'Color',[0 125 255]/256,'LineWidth',12);hold on;    %res
% plot(x4(11:12),y4(11:12),'Color',[0 191 100]/256,'LineWidth',12);hold on;    %pb
% plot(x4(12:13),y4(12:13),'Color',[0 125 255]/256,'LineWidth',12);hold on;    %res
% plot(x4(13:14),y4(13:14),'Color',[0 191 100]/256,'LineWidth',12);hold on;    %pb

axis([0 25 0 7]);  % ������������
xlabel('Time from meeting (s)');  % x������
legend([pi pb stii res ret],{'Push initiation','Push back','Stillness','Resistance','Retreat'});   %���ݻ�ͼ�����еĶ���ɫ�����ͼ��

