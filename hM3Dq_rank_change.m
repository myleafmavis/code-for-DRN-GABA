clear all
close all
clc

%%% 画一笼在CNO后社会等级的动态变化
rankchange=[1	1	1	1	1	2	4	3	3   3       % 社会等级变化-化学遗传hM3Dq.xlsx 表单：等级改变2级个体
            2	2	2	2	2	1	1	1	1   1       % 打药个体等级变化填写在第一排
            4	4	4	4	4	4	3	4   4   4
            3	3	3	3	3	3	2	2	2   2];
rankchange=5-rankchange;
figure(1)
subplot(2,2,1)
plot(rankchange(1,:),'-sm','MarkerFaceColor','m','LineWidth',2);hold on;
plot(rankchange(2,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(rankchange(3,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(rankchange(4,:),'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
axis([0 11 0.5 4.5]);  %坐标轴范围
xticklabel_rotate([1:10],45,{'-72','-48','-24','0','1-1.5','3-5','6-8','24','48','72'},'interpreter','none'); 
text(11,0.2,'(hr)');set(gca,'linewidth',1);

%%%% 画实验组、盐水组及对照病毒组的社会等级动态变化
[hM3Dq_CNO_s11,hM3Dq_CNO_s12,hM3Dq_CNO_s13]=xlsread('C57_DRN_hM3Dq_原始等级记录.xlsx','C57_DRN_hM3Dq_CNO_RC');                  %实验组给CNO
[hM3Dq_Saline_s11,hM3Dq_Saline_s12,hM3Dq_Saline_s13]=xlsread('C57_DRN_hM3Dq_原始等级记录.xlsx','C57_DRN_hM3Dq_Saline_RC');      %实验组给Saline
[mCherry_CNO_s11,mCherry_CNO_s12,mCherry_CNO_s13]=xlsread('C57_DRN_hM3Dq_原始等级记录.xlsx','C57_DRN_mCherry_CNO_RC');                      %对照组给CNO
mean_hM3Dq_CNO=mean(hM3Dq_CNO_s11(:,2:end));std_hM3Dq_CNO=std(hM3Dq_CNO_s11(:,2:end))/sqrt(length(mean_hM3Dq_CNO(:,2:end)));
mean_hM3Dq_Saline=mean(hM3Dq_Saline_s11(:,2:end));std_hM3Dq_Saline=std(hM3Dq_Saline_s11(:,2:end))/sqrt(length(mean_hM3Dq_Saline(:,2:end)));
mean_mCherry_CNO=mean(mCherry_CNO_s11(:,2:end));std_mCherry_CNO=std(mCherry_CNO_s11(:,2:end))/sqrt(length(mean_mCherry_CNO(:,2:end)));
subplot(2,2,3)
plot(mean_hM3Dq_Saline+0.4,'-s','Color',[0.5 0.5 0.5],'MarkerFaceColor',[0.5 0.5 0.5],'LineWidth',2);hold on;
plot(mean_mCherry_CNO+0.2,'-s','Color',[255 165 0]/256,'MarkerFaceColor',[255 165 0]/256,'LineWidth',2);hold on;
axis([0 11 -2 1]);    %坐标轴范围
plot(mean_hM3Dq_CNO,'-sm','MarkerFaceColor','m','LineWidth',2);errorbar(mean_hM3Dq_CNO,std_hM3Dq_CNO,'m','LineWidth',2);hold on;
xticklabel_rotate([1:10],45,{'-72','-48','-24','0','1-1.5','3-5','6-8','24','48','72'},'interpreter','none');
text(11,-1.2,'(hr)');set(gca,'linewidth',1);
legend('mCherry+CNO','hM3Dq+Saline','hM3Dq+CNO')     %前72，48，24；给药后1.5，3.5，6；24，48，72 则xticklabel_rotate([1:10]


%%%% 画实验组中每只个体的动态变化，三维折线图
x=ones(1,10);y=1:10;                                     %前72，48，24；给药后1.5，3.5，6；24，48，72 则x=ones(1,10)
[hM3Dq_CNO_3d_line]=xlsread('C57_DRN_hM3Dq_原始等级记录.xlsx','C57_DRN_hM3Dq_CNO_RC');      %读取需要绘制3D图像的文件
hM3Dq_CNO_3d_line=fliplr(hM3Dq_CNO_3d_line(:,2:end));
subplot(2,2,2)
% 为不同个体分配不同的颜色 根据文件内个体数量需要增加或删除下面plot函数行数 并注意修改axis函数值
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
plot3(y,x+6,x-1,'--','Color',[128 0 0]/256,'LineWidth',2);              %绘制给药时刻标记
axis([0 8 0 10 -3 1]);   %坐标轴范围

%%%% 画一个trial对抗图      一对鼠在都注射saline行为表现 和 同一对鼠等级高的个体注射CNO 等级低的个体注射saline的行为表现

%色彩标签 
%[192 192 192]/256      stillness        灰色
%[255 0 0]/256          push-initiation  红色
%[255 215 0]/256        retreat          黄色
%[0 191 100]/256        push-back        绿色
%[0 125 255]/256        resistance       蓝色

%以下分别为 个体1注射saline 个体2注射saline  个体1注射CNO 个体2注射saline  行为发生改变的时间节点

x1=[7.9 8.533 16.6 17.267 18.033 20.1]-7.9; y1=[6 6 6 6 6 6];   %stii  res pb  res  pb 
x2=[7.9 8.533 16.6 17.267 18.033 20.1]-7.9; y2=[5 5 5 5 5 5 ];   %stii  pi  res pb  res      
x3=[0.4 1.367 3.033]-0.4; y3=[2 2 2];    %stii ret
x4=[0.4 1.367 3.033]-0.4; y4=[1 1 1];         %stii pi
subplot(2,2,4)

%以下是个体1在注射saline后的行为表现
%为了后续能够顺利生成正确的图例，需要在接下来绘图的过程中定义各个行为的颜色
     
stii = plot(x1(1:2),y1(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;        %stii   %指定该色块为stii
res = plot(x1(2:3),y1(2:3),'Color',[0 125 255]/256,'LineWidth',12);hold on;           %res    %指定该色块为res
pb = plot(x1(3:4),y1(3:4),'Color',[0 191 100]/256,'LineWidth',12);hold on;            %pb     %指定该色块为pb
plot(x1(4:5),y1(4:5),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res 
plot(x1(5:6),y1(5:6),'Color',[0 191 100]/256,'LineWidth',12);hold on;                 %pb
% plot(x1(6:7),y1(6:7),'Color',[0 125 255]/256,'LineWidth',12);hold on;               %res
% plot(x1(7:8),y1(7:8),'Color',[192 192 192]/256,'LineWidth',12);hold on;             %stii
% plot(x1(8:9),y1(8:9),'Color',[0 125 255]/256,'LineWidth',12);hold on;               %res
% plot(x1(9:10),y1(9:10),'Color',[0 191 100]/256,'LineWidth',12);hold on;             %pb
% plot(x1(10:11),y1(10:11),'Color',[0 125 255]/256,'LineWidth',12);hold on;           %res
% plot(x1(11:12),y1(11:12),'Color',[0 191 100]/256,'LineWidth',12);hold on;           %pb

%以下是个体2在个体1注射saline时注射saline后的行为表现 
plot(x2(1:2),y2(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;               %stii  
pi = plot(x2(2:3),y2(2:3),'Color',[255 0 0]/256,'LineWidth',12);hold on;              %pi     %指定该色块为pi 
plot(x2(3:4),y2(3:4),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res
plot(x2(4:5),y2(4:5),'Color',[0 191 100]/256,'LineWidth',12);hold on;                 %pb
plot(x2(5:6),y2(5:6),'Color',[0 125 255]/256,'LineWidth',12);hold on;                 %res
% plot(x2(6:7),y2(6:7),'Color',[0 191 100]/256,'LineWidth',12);hold on;               %pb
% plot(x2(7:8),y2(7:8),'Color',[192 192 192]/256,'LineWidth',12);hold on;             %stii
% plot(x2(8:9),y2(8:9),'Color',[255 0 0]/256,'LineWidth',12);hold on;                 %pi
% plot(x2(9:10),y2(9:10),'Color',[0 125 255]/256,'LineWidth',12);hold on;             %res
% plot(x2(10:11),y2(10:11),'Color',[0 191 100]/256,'LineWidth',12);hold on;           %pb
% plot(x2(11:12),y2(11:12),'Color',[255 215 0]/256,'LineWidth',12);hold on;           %ret

%以下是个体1在注射CNO后的行为表现 

plot(x3(1:2),y3(1:2),'Color',[192 192 192]/256,'LineWidth',12);hold on;      %stii
ret = plot(x3(2:3),y3(2:3),'Color',[255 215 0]/256,'LineWidth',12);hold on;          %ret  %指定该色块为ret
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

%以下是个体2在个体1注射CNO时注射saline后的行为表现  

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

axis([0 25 0 7]);  % 横纵坐标区间
xlabel('Time from meeting (s)');  % x轴命名
legend([pi pb stii res ret],{'Push initiation','Push back','Stillness','Resistance','Retreat'});   %根据绘图过程中的定义色块绘制图例

