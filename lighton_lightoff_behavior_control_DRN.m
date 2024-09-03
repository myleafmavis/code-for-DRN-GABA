clear all
close all
clc

[OFF_s11,OFF_s12,OFF_s13]=xlsread('C57_DRN_ChR2_行为表现.xlsx','C57_ChR2_DRN_OFF_winner');  %% OFF 原始文件中首行非正式数据的说明文字去掉
[ON_s11,ON_s12,ON_s13]=xlsread(['C57_DRN_ChR2_行为表现.xlsx'],'C57_ChR2_DRN_ON_loser');      %% ON

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 以下用于独立样本实验设计
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=unique(ON_s11(:,3));  % find the ID of animals
animal=A(~isnan(A));
for i=1:length(animal)
    temp=(find([ON_s13{:,3}]==animal(i)))';
    for j=1:length(temp)
        eval(['M_ON',int2str(animal(i)),'{j,1}=ON_s13{temp(j),1};']);
        eval(['M_ON',int2str(animal(i)),'{j,2}=ON_s13{temp(j),2};']);
        eval(['M_ON',int2str(animal(i)),'{j,3}=ON_s13{temp(j),3};']);
        eval(['M_ON',int2str(animal(i)),'{j,4}=ON_s13{temp(j),4};']);
    end
    eval(['num_t=unique(cell2mat(M_ON',int2str(animal(i)),'(:,1)));']);    %计算trial的个数
    for k=1:length(num_t)
        eval(['temp_1=find(cell2mat(M_ON',int2str(animal(i)),'(:,1))==k);']);
        eval(['M_ON',int2str(animal(i)),'_result_',int2str(k),'=caculate_behaviour(M_ON',int2str(animal(i)),'(temp_1,:),animal(i));']);   %输出结果格式   push-initiation数量    push-initiation持续时间
    end                                                                                                                                   %               push-back数量          push-back持续时间
                                                                                                                                          %               stillness数量          stillness持续时间
                                                                                                                                          %               resistance占比         retreat占比
end  

B=unique(OFF_s11(:,3));  % find the ID of animals
animal1=B(~isnan(B));
for i=1:length(animal1)
    temp=(find([OFF_s13{:,3}]==animal1(i)))';
    for j=1:length(temp)
        eval(['M_OFF',int2str(animal1(i)),'{j,1}=OFF_s13{temp(j),1};']);
        eval(['M_OFF',int2str(animal1(i)),'{j,2}=OFF_s13{temp(j),2};']);
        eval(['M_OFF',int2str(animal1(i)),'{j,3}=OFF_s13{temp(j),3};']);
        eval(['M_OFF',int2str(animal1(i)),'{j,4}=OFF_s13{temp(j),4};']);
    end
    eval(['num_t=unique(cell2mat(M_OFF',int2str(animal1(i)),'(:,1)));']); 
    for k=1:length(num_t)
        eval(['temp_1=find(cell2mat(M_OFF',int2str(animal1(i)),'(:,1))==k);']);
        eval(['M_OFF',int2str(animal1(i)),'_result_',int2str(k),'=caculate_behaviour(M_OFF',int2str(animal1(i)),'(temp_1,:),animal1(i));']);   %输出结果格式   push-initiation数量    push-initiation持续时间
    end                                                                                                                                        %               push-back数量          push-back持续时间
                                                                                                                                               %               stillness数量          stillness持续时间
                                                                                                                                               %               resistance占比         retreat占比
end  

%%%%统计数据格式8列：PI数量, PI持续时间对照, PB数量, PB持续时间对照, Still数量, Still持续时间对照, Resistence占比, Retreat占比 
data_off =[M_OFF3497_result_1(1,1) M_OFF3497_result_1(1,2) M_OFF3497_result_1(2,1) M_OFF3497_result_1(2,2) M_OFF3497_result_1(3,1) M_OFF3497_result_1(3,2) M_OFF3497_result_1(4,1) M_OFF3497_result_1(4,2)
           M_OFF3497_result_2(1,1) M_OFF3497_result_2(1,2) M_OFF3497_result_2(2,1) M_OFF3497_result_2(2,2) M_OFF3497_result_2(3,1) M_OFF3497_result_2(3,2) M_OFF3497_result_2(4,1) M_OFF3497_result_2(4,2)
           M_OFF3497_result_3(1,1) M_OFF3497_result_3(1,2) M_OFF3497_result_3(2,1) M_OFF3497_result_3(2,2) M_OFF3497_result_3(3,1) M_OFF3497_result_3(3,2) M_OFF3497_result_3(4,1) M_OFF3497_result_3(4,2)
%            M_OFF3497_result_4(1,1) M_OFF3497_result_4(1,2) M_OFF3497_result_4(2,1) M_OFF3497_result_4(2,2) M_OFF3497_result_4(3,1) M_OFF3497_result_3(3,2) M_OFF3497_result_4(4,1) M_OFF3497_result_4(4,2)
%            M_OFF3497_result_5(1,1) M_OFF3497_result_5(1,2) M_OFF3497_result_5(2,1) M_OFF3497_result_5(2,2) M_OFF3497_result_5(3,1) M_OFF3497_result_3(3,2) M_OFF3497_result_5(4,1) M_OFF3497_result_5(4,2)
%            M_OFF3497_result_6(1,1) M_OFF3497_result_6(1,2) M_OFF3497_result_6(2,1) M_OFF3497_result_6(2,2) M_OFF3497_result_6(3,1) M_OFF3497_result_3(3,2) M_OFF3497_result_6(4,1) M_OFF3497_result_6(4,2)
           
           M_OFF3498_result_1(1,1) M_OFF3498_result_1(1,2) M_OFF3498_result_1(2,1) M_OFF3498_result_1(2,2) M_OFF3498_result_1(3,1) M_OFF3498_result_1(3,2) M_OFF3498_result_1(4,1) M_OFF3498_result_1(4,2)
           M_OFF3498_result_2(1,1) M_OFF3498_result_2(1,2) M_OFF3498_result_2(2,1) M_OFF3498_result_2(2,2) M_OFF3498_result_2(3,1) M_OFF3498_result_2(3,2) M_OFF3498_result_2(4,1) M_OFF3498_result_2(4,2)
           M_OFF3498_result_3(1,1) M_OFF3498_result_3(1,2) M_OFF3498_result_3(2,1) M_OFF3498_result_3(2,2) M_OFF3498_result_3(3,1) M_OFF3498_result_3(3,2) M_OFF3498_result_3(4,1) M_OFF3498_result_3(4,2)
%            M_OFF3498_result_4(1,1) M_OFF3498_result_4(1,2) M_OFF3498_result_4(2,1) M_OFF3498_result_4(2,2) M_OFF3498_result_4(3,1) M_OFF3498_result_4(3,2) M_OFF3498_result_4(4,1) M_OFF3498_result_4(4,2)
%            M_OFF3498_result_5(1,1) M_OFF3498_result_5(1,2) M_OFF3498_result_5(2,1) M_OFF3498_result_5(2,2) M_OFF3498_result_5(3,1) M_OFF3498_result_5(3,2) M_OFF3498_result_5(4,1) M_OFF3498_result_5(4,2)
%            M_OFF3498_result_6(1,1) M_OFF3498_result_6(1,2) M_OFF3498_result_6(2,1) M_OFF3498_result_6(2,2) M_OFF3498_result_6(3,1) M_OFF3498_result_6(3,2) M_OFF3498_result_6(4,1) M_OFF3498_result_6(4,2)
           
           M_OFF3499_result_1(1,1) M_OFF3499_result_1(1,2) M_OFF3499_result_1(2,1) M_OFF3499_result_1(2,2) M_OFF3499_result_1(3,1) M_OFF3499_result_1(3,2) M_OFF3499_result_1(4,1) M_OFF3499_result_1(4,2)
           M_OFF3499_result_2(1,1) M_OFF3499_result_2(1,2) M_OFF3499_result_2(2,1) M_OFF3499_result_2(2,2) M_OFF3499_result_2(3,1) M_OFF3499_result_2(3,2) M_OFF3499_result_2(4,1) M_OFF3499_result_2(4,2)
           M_OFF3499_result_3(1,1) M_OFF3499_result_3(1,2) M_OFF3499_result_3(2,1) M_OFF3499_result_3(2,2) M_OFF3499_result_3(3,1) M_OFF3499_result_3(3,2) M_OFF3499_result_3(4,1) M_OFF3499_result_3(4,2)
%            M_OFF3499_result_4(1,1) M_OFF3499_result_4(1,2) M_OFF3499_result_4(2,1) M_OFF3499_result_4(2,2) M_OFF3499_result_4(3,1) M_OFF3499_result_4(3,2) M_OFF3499_result_4(4,1) M_OFF3499_result_4(4,2)
%            M_OFF3499_result_5(1,1) M_OFF3499_result_5(1,2) M_OFF3499_result_5(2,1) M_OFF3499_result_5(2,2) M_OFF3499_result_5(3,1) M_OFF3499_result_5(3,2) M_OFF3499_result_5(4,1) M_OFF3499_result_5(4,2)
%            M_OFF3499_result_6(1,1) M_OFF3499_result_6(1,2) M_OFF3499_result_6(2,1) M_OFF3499_result_6(2,2) M_OFF3499_result_6(3,1) M_OFF3499_result_6(3,2) M_OFF3499_result_6(4,1) M_OFF3499_result_6(4,2)
          
           M_OFF3493_result_1(1,1) M_OFF3493_result_1(1,2) M_OFF3493_result_1(2,1) M_OFF3493_result_1(2,2) M_OFF3493_result_1(3,1) M_OFF3493_result_1(3,2) M_OFF3493_result_1(4,1) M_OFF3493_result_1(4,2)
           M_OFF3493_result_2(1,1) M_OFF3493_result_2(1,2) M_OFF3493_result_2(2,1) M_OFF3493_result_2(2,2) M_OFF3493_result_2(3,1) M_OFF3493_result_2(3,2) M_OFF3493_result_2(4,1) M_OFF3493_result_2(4,2)
           M_OFF3493_result_3(1,1) M_OFF3493_result_3(1,2) M_OFF3493_result_3(2,1) M_OFF3493_result_3(2,2) M_OFF3493_result_3(3,1) M_OFF3493_result_3(3,2) M_OFF3493_result_3(4,1) M_OFF3493_result_3(4,2)
%            M_OFF3493_result_4(1,1) M_OFF3493_result_4(1,2) M_OFF3493_result_4(2,1) M_OFF3493_result_4(2,2) M_OFF3493_result_4(3,1) M_OFF3493_result_4(3,2) M_OFF3493_result_4(4,1) M_OFF3493_result_4(4,2)
%            M_OFF3493_result_5(1,1) M_OFF3493_result_5(1,2) M_OFF3493_result_5(2,1) M_OFF3493_result_5(2,2) M_OFF3493_result_5(3,1) M_OFF3493_result_5(3,2) M_OFF3493_result_5(4,1) M_OFF3493_result_5(4,2)
%            M_OFF3493_result_6(1,1) M_OFF3493_result_6(1,2) M_OFF3493_result_6(2,1) M_OFF3493_result_6(2,2) M_OFF3493_result_6(3,1) M_OFF3493_result_6(3,2) M_OFF3493_result_6(4,1) M_OFF3493_result_6(4,2)
          
           M_OFF3495_result_1(1,1) M_OFF3495_result_1(1,2) M_OFF3495_result_1(2,1) M_OFF3495_result_1(2,2) M_OFF3495_result_1(3,1) M_OFF3495_result_1(3,2) M_OFF3495_result_1(4,1) M_OFF3495_result_1(4,2)
           M_OFF3495_result_2(1,1) M_OFF3495_result_2(1,2) M_OFF3495_result_2(2,1) M_OFF3495_result_2(2,2) M_OFF3495_result_2(3,1) M_OFF3495_result_2(3,2) M_OFF3495_result_2(4,1) M_OFF3495_result_2(4,2)
           M_OFF3495_result_3(1,1) M_OFF3495_result_3(1,2) M_OFF3495_result_3(2,1) M_OFF3495_result_3(2,2) M_OFF3495_result_3(3,1) M_OFF3495_result_3(3,2) M_OFF3495_result_3(4,1) M_OFF3495_result_3(4,2)
%            M_OFF3495_result_4(1,1) M_OFF3495_result_4(1,2) M_OFF3495_result_4(2,1) M_OFF3495_result_4(2,2) M_OFF3495_result_4(3,1) M_OFF3495_result_4(3,2) M_OFF3495_result_4(4,1) M_OFF3495_result_4(4,2)
%            M_OFF3495_result_5(1,1) M_OFF3495_result_5(1,2) M_OFF3495_result_5(2,1) M_OFF3495_result_5(2,2) M_OFF3495_result_5(3,1) M_OFF3495_result_5(3,2) M_OFF3495_result_5(4,1) M_OFF3495_result_5(4,2)
%            M_OFF3495_result_6(1,1) M_OFF3495_result_6(1,2) M_OFF3495_result_6(2,1) M_OFF3495_result_6(2,2) M_OFF3495_result_6(3,1) M_OFF3495_result_6(3,2) M_OFF3495_result_6(4,1) M_OFF3495_result_6(4,2)
          
           M_OFF3557_result_1(1,1) M_OFF3557_result_1(1,2) M_OFF3557_result_1(2,1) M_OFF3557_result_1(2,2) M_OFF3557_result_1(3,1) M_OFF3557_result_1(3,2) M_OFF3557_result_1(4,1) M_OFF3557_result_1(4,2)
           M_OFF3557_result_2(1,1) M_OFF3557_result_2(1,2) M_OFF3557_result_2(2,1) M_OFF3557_result_2(2,2) M_OFF3557_result_2(3,1) M_OFF3557_result_2(3,2) M_OFF3557_result_2(4,1) M_OFF3557_result_2(4,2)
           M_OFF3557_result_3(1,1) M_OFF3557_result_3(1,2) M_OFF3557_result_3(2,1) M_OFF3557_result_3(2,2) M_OFF3557_result_3(3,1) M_OFF3557_result_3(3,2) M_OFF3557_result_3(4,1) M_OFF3557_result_3(4,2)
% %            M_OFF3557_result_4(1,1) M_OFF3557_result_4(1,2) M_OFF3557_result_4(2,1) M_OFF3557_result_4(2,2) M_OFF3557_result_4(3,1) M_OFF3557_result_4(3,2) M_OFF3557_result_4(4,1) M_OFF3557_result_4(4,2)
% %            M_OFF3557_result_5(1,1) M_OFF3557_result_5(1,2) M_OFF3557_result_5(2,1) M_OFF3557_result_5(2,2) M_OFF3557_result_5(3,1) M_OFF3557_result_5(3,2) M_OFF3557_result_5(4,1) M_OFF3557_result_5(4,2)
% %            M_OFF3557_result_6(1,1) M_OFF3557_result_6(1,2) M_OFF3557_result_6(2,1) M_OFF3557_result_6(2,2) M_OFF3557_result_6(3,1) M_OFF3557_result_6(3,2) M_OFF3557_result_6(4,1) M_OFF3557_result_6(4,2) 
%           
           M_OFF3590_result_1(1,1) M_OFF3590_result_1(1,2) M_OFF3590_result_1(2,1) M_OFF3590_result_1(2,2) M_OFF3590_result_1(3,1) M_OFF3590_result_1(3,2) M_OFF3590_result_1(4,1) M_OFF3590_result_1(4,2)
           M_OFF3590_result_2(1,1) M_OFF3590_result_2(1,2) M_OFF3590_result_2(2,1) M_OFF3590_result_2(2,2) M_OFF3590_result_2(3,1) M_OFF3590_result_2(3,2) M_OFF3590_result_2(4,1) M_OFF3590_result_2(4,2)
           M_OFF3590_result_3(1,1) M_OFF3590_result_3(1,2) M_OFF3590_result_3(2,1) M_OFF3590_result_3(2,2) M_OFF3590_result_3(3,1) M_OFF3590_result_3(3,2) M_OFF3590_result_3(4,1) M_OFF3590_result_3(4,2)
% %            M_OFF3590_result_4(1,1) M_OFF3590_result_4(1,2) M_OFF3590_result_4(2,1) M_OFF3590_result_4(2,2) M_OFF3590_result_4(3,1) M_OFF3590_result_4(3,2) M_OFF3590_result_4(4,1) M_OFF3590_result_4(4,2)
% %            M_OFF3590_result_5(1,1) M_OFF3590_result_5(1,2) M_OFF3590_result_5(2,1) M_OFF3590_result_5(2,2) M_OFF3590_result_5(3,1) M_OFF3590_result_5(3,2) M_OFF3590_result_5(4,1) M_OFF3590_result_5(4,2)
% %            M_OFF3590_result_6(1,1) M_OFF3590_result_6(1,2) M_OFF3590_result_6(2,1) M_OFF3590_result_6(2,2) M_OFF3590_result_6(3,1) M_OFF3590_result_6(3,2) M_OFF3590_result_6(4,1) M_OFF3590_result_6(4,2)
%           
           M_OFF3596_result_1(1,1) M_OFF3596_result_1(1,2) M_OFF3596_result_1(2,1) M_OFF3596_result_1(2,2) M_OFF3596_result_1(3,1) M_OFF3596_result_1(3,2) M_OFF3596_result_1(4,1) M_OFF3596_result_1(4,2)
           M_OFF3596_result_2(1,1) M_OFF3596_result_2(1,2) M_OFF3596_result_2(2,1) M_OFF3596_result_2(2,2) M_OFF3596_result_2(3,1) M_OFF3596_result_2(3,2) M_OFF3596_result_2(4,1) M_OFF3596_result_2(4,2)
           M_OFF3596_result_3(1,1) M_OFF3596_result_3(1,2) M_OFF3596_result_3(2,1) M_OFF3596_result_3(2,2) M_OFF3596_result_3(3,1) M_OFF3596_result_3(3,2) M_OFF3596_result_3(4,1) M_OFF3596_result_3(4,2)
% %            M_OFF3596_result_4(1,1) M_OFF3596_result_4(1,2) M_OFF3596_result_4(2,1) M_OFF3596_result_4(2,2) M_OFF3596_result_4(3,1) M_OFF3596_result_4(3,2) M_OFF3596_result_4(4,1) M_OFF3596_result_4(4,2)
% %            M_OFF3596_result_5(1,1) M_OFF3596_result_5(1,2) M_OFF3596_result_5(2,1) M_OFF3596_result_5(2,2) M_OFF3596_result_5(3,1) M_OFF3596_result_5(3,2) M_OFF3596_result_5(4,1) M_OFF3596_result_5(4,2)
% %            M_OFF3596_result_6(1,1) M_OFF3596_result_6(1,2) M_OFF3596_result_6(2,1) M_OFF3596_result_6(2,2) M_OFF3596_result_6(3,1) M_OFF3596_result_6(3,2) M_OFF3596_result_6(4,1) M_OFF3596_result_6(4,2)

%            M_OFF3160_result_1(1,1) M_OFF3160_result_1(1,2) M_OFF3160_result_1(2,1) M_OFF3160_result_1(2,2) M_OFF3160_result_1(3,1) M_OFF3160_result_1(3,2) M_OFF3160_result_1(4,1) M_OFF3160_result_1(4,2)
%            M_OFF3160_result_2(1,1) M_OFF3160_result_2(1,2) M_OFF3160_result_2(2,1) M_OFF3160_result_2(2,2) M_OFF3160_result_2(3,1) M_OFF3160_result_2(3,2) M_OFF3160_result_2(4,1) M_OFF3160_result_2(4,2)
%            M_OFF3160_result_3(1,1) M_OFF3160_result_3(1,2) M_OFF3160_result_3(2,1) M_OFF3160_result_3(2,2) M_OFF3160_result_3(3,1) M_OFF3160_result_3(3,2) M_OFF3160_result_3(4,1) M_OFF3160_result_3(4,2)
%            M_OFF3160_result_4(1,1) M_OFF3160_result_4(1,2) M_OFF3160_result_4(2,1) M_OFF3160_result_4(2,2) M_OFF3160_result_4(3,1) M_OFF3160_result_4(3,2) M_OFF3160_result_4(4,1) M_OFF3160_result_4(4,2)
%            M_OFF3160_result_5(1,1) M_OFF3160_result_5(1,2) M_OFF3160_result_5(2,1) M_OFF3160_result_5(2,2) M_OFF3160_result_5(3,1) M_OFF3160_result_5(3,2) M_OFF3160_result_5(4,1) M_OFF3160_result_5(4,2)
%            M_OFF3160_result_6(1,1) M_OFF3160_result_6(1,2) M_OFF3160_result_6(2,1) M_OFF3160_result_6(2,2) M_OFF3160_result_6(3,1) M_OFF3160_result_6(3,2) M_OFF3160_result_6(4,1) M_OFF3160_result_6(4,2)
           
           ];

data_on =[ M_ON3497_result_1(1,1) M_ON3497_result_1(1,2) M_ON3497_result_1(2,1) M_ON3497_result_1(2,2) M_ON3497_result_1(3,1) M_ON3497_result_1(3,2) M_ON3497_result_1(4,1) M_ON3497_result_1(4,2)
           M_ON3497_result_2(1,1) M_ON3497_result_2(1,2) M_ON3497_result_2(2,1) M_ON3497_result_2(2,2) M_ON3497_result_2(3,1) M_ON3497_result_2(3,2) M_ON3497_result_2(4,1) M_ON3497_result_2(4,2)
           M_ON3497_result_3(1,1) M_ON3497_result_3(1,2) M_ON3497_result_3(2,1) M_ON3497_result_3(2,2) M_ON3497_result_3(3,1) M_ON3497_result_3(3,2) M_ON3497_result_3(4,1) M_ON3497_result_3(4,2)
           M_ON3497_result_4(1,1) M_ON3497_result_4(1,2) M_ON3497_result_4(2,1) M_ON3497_result_4(2,2) M_ON3497_result_4(3,1) M_ON3497_result_4(3,2) M_ON3497_result_4(4,1) M_ON3497_result_4(4,2)
           M_ON3497_result_5(1,1) M_ON3497_result_5(1,2) M_ON3497_result_5(2,1) M_ON3497_result_5(2,2) M_ON3497_result_5(3,1) M_ON3497_result_5(3,2) M_ON3497_result_5(4,1) M_ON3497_result_5(4,2)
           M_ON3497_result_6(1,1) M_ON3497_result_6(1,2) M_ON3497_result_6(2,1) M_ON3497_result_6(2,2) M_ON3497_result_6(3,1) M_ON3497_result_6(3,2) M_ON3497_result_6(4,1) M_ON3497_result_6(4,2)
           
           M_ON3498_result_1(1,1) M_ON3498_result_1(1,2) M_ON3498_result_1(2,1) M_ON3498_result_1(2,2) M_ON3498_result_1(3,1) M_ON3498_result_1(3,2) M_ON3498_result_1(4,1) M_ON3498_result_1(4,2)
           M_ON3498_result_2(1,1) M_ON3498_result_2(1,2) M_ON3498_result_2(2,1) M_ON3498_result_2(2,2) M_ON3498_result_2(3,1) M_ON3498_result_2(3,2) M_ON3498_result_2(4,1) M_ON3498_result_2(4,2)
           M_ON3498_result_3(1,1) M_ON3498_result_3(1,2) M_ON3498_result_3(2,1) M_ON3498_result_3(2,2) M_ON3498_result_3(3,1) M_ON3498_result_3(3,2) M_ON3498_result_3(4,1) M_ON3498_result_3(4,2)
           M_ON3498_result_4(1,1) M_ON3498_result_4(1,2) M_ON3498_result_4(2,1) M_ON3498_result_4(2,2) M_ON3498_result_4(3,1) M_ON3498_result_4(3,2) M_ON3498_result_4(4,1) M_ON3498_result_4(4,2)
           M_ON3498_result_5(1,1) M_ON3498_result_5(1,2) M_ON3498_result_5(2,1) M_ON3498_result_5(2,2) M_ON3498_result_5(3,1) M_ON3498_result_5(3,2) M_ON3498_result_5(4,1) M_ON3498_result_5(4,2)
%            M_ON3498_result_6(1,1) M_ON3498_result_6(1,2) M_ON3498_result_6(2,1) M_ON3498_result_6(2,2) M_ON3498_result_6(3,1) M_ON3498_result_6(3,2) M_ON3498_result_6(4,1) M_ON3498_result_6(4,2)
          
           M_ON3499_result_1(1,1) M_ON3499_result_1(1,2) M_ON3499_result_1(2,1) M_ON3499_result_1(2,2) M_ON3499_result_1(3,1) M_ON3499_result_1(3,2) M_ON3499_result_1(4,1) M_ON3499_result_1(4,2)
           M_ON3499_result_2(1,1) M_ON3499_result_2(1,2) M_ON3499_result_2(2,1) M_ON3499_result_2(2,2) M_ON3499_result_2(3,1) M_ON3499_result_2(3,2) M_ON3499_result_2(4,1) M_ON3499_result_2(4,2)
           M_ON3499_result_3(1,1) M_ON3499_result_3(1,2) M_ON3499_result_3(2,1) M_ON3499_result_3(2,2) M_ON3499_result_3(3,1) M_ON3499_result_3(3,2) M_ON3499_result_3(4,1) M_ON3499_result_3(4,2)
           M_ON3499_result_4(1,1) M_ON3499_result_4(1,2) M_ON3499_result_4(2,1) M_ON3499_result_4(2,2) M_ON3499_result_4(3,1) M_ON3499_result_4(3,2) M_ON3499_result_4(4,1) M_ON3499_result_4(4,2)
           M_ON3499_result_5(1,1) M_ON3499_result_5(1,2) M_ON3499_result_5(2,1) M_ON3499_result_5(2,2) M_ON3499_result_5(3,1) M_ON3499_result_5(3,2) M_ON3499_result_5(4,1) M_ON3499_result_5(4,2)
%            M_ON3499_result_6(1,1) M_ON3499_result_6(1,2) M_ON3499_result_6(2,1) M_ON3499_result_6(2,2) M_ON3499_result_6(3,1) M_ON3499_result_6(3,2) M_ON3499_result_6(4,1) M_ON3499_result_6(4,2)
          
           M_ON3493_result_1(1,1) M_ON3493_result_1(1,2) M_ON3493_result_1(2,1) M_ON3493_result_1(2,2) M_ON3493_result_1(3,1) M_ON3493_result_1(3,2) M_ON3493_result_1(4,1) M_ON3493_result_1(4,2)
           M_ON3493_result_2(1,1) M_ON3493_result_2(1,2) M_ON3493_result_2(2,1) M_ON3493_result_2(2,2) M_ON3493_result_2(3,1) M_ON3493_result_2(3,2) M_ON3493_result_2(4,1) M_ON3493_result_2(4,2)
           M_ON3493_result_3(1,1) M_ON3493_result_3(1,2) M_ON3493_result_3(2,1) M_ON3493_result_3(2,2) M_ON3493_result_3(3,1) M_ON3493_result_3(3,2) M_ON3493_result_3(4,1) M_ON3493_result_3(4,2)
           M_ON3493_result_4(1,1) M_ON3493_result_4(1,2) M_ON3493_result_4(2,1) M_ON3493_result_4(2,2) M_ON3493_result_4(3,1) M_ON3493_result_4(3,2) M_ON3493_result_4(4,1) M_ON3493_result_4(4,2)
           M_ON3493_result_5(1,1) M_ON3493_result_5(1,2) M_ON3493_result_5(2,1) M_ON3493_result_5(2,2) M_ON3493_result_5(3,1) M_ON3493_result_5(3,2) M_ON3493_result_5(4,1) M_ON3493_result_5(4,2)
%            M_ON3493_result_6(1,1) M_ON3493_result_6(1,2) M_ON3493_result_6(2,1) M_ON3493_result_6(2,2) M_ON3493_result_6(3,1) M_ON3493_result_6(3,2) M_ON3493_result_6(4,1) M_ON3493_result_6(4,2)
           
           M_ON3495_result_1(1,1) M_ON3495_result_1(1,2) M_ON3495_result_1(2,1) M_ON3495_result_1(2,2) M_ON3495_result_1(3,1) M_ON3495_result_1(3,2) M_ON3495_result_1(4,1) M_ON3495_result_1(4,2)
           M_ON3495_result_2(1,1) M_ON3495_result_2(1,2) M_ON3495_result_2(2,1) M_ON3495_result_2(2,2) M_ON3495_result_2(3,1) M_ON3495_result_2(3,2) M_ON3495_result_2(4,1) M_ON3495_result_2(4,2)
           M_ON3495_result_3(1,1) M_ON3495_result_3(1,2) M_ON3495_result_3(2,1) M_ON3495_result_3(2,2) M_ON3495_result_3(3,1) M_ON3495_result_3(3,2) M_ON3495_result_3(4,1) M_ON3495_result_3(4,2)
           M_ON3495_result_4(1,1) M_ON3495_result_4(1,2) M_ON3495_result_4(2,1) M_ON3495_result_4(2,2) M_ON3495_result_4(3,1) M_ON3495_result_4(3,2) M_ON3495_result_4(4,1) M_ON3495_result_4(4,2)
           M_ON3495_result_5(1,1) M_ON3495_result_5(1,2) M_ON3495_result_5(2,1) M_ON3495_result_5(2,2) M_ON3495_result_5(3,1) M_ON3495_result_5(3,2) M_ON3495_result_5(4,1) M_ON3495_result_5(4,2)
           M_ON3495_result_6(1,1) M_ON3495_result_6(1,2) M_ON3495_result_6(2,1) M_ON3495_result_6(2,2) M_ON3495_result_6(3,1) M_ON3495_result_6(3,2) M_ON3495_result_6(4,1) M_ON3495_result_6(4,2)
           
           M_ON3557_result_1(1,1) M_ON3557_result_1(1,2) M_ON3557_result_1(2,1) M_ON3557_result_1(2,2) M_ON3557_result_1(3,1) M_ON3557_result_1(3,2) M_ON3557_result_1(4,1) M_ON3557_result_1(4,2)
           M_ON3557_result_2(1,1) M_ON3557_result_2(1,2) M_ON3557_result_2(2,1) M_ON3557_result_2(2,2) M_ON3557_result_2(3,1) M_ON3557_result_2(3,2) M_ON3557_result_2(4,1) M_ON3557_result_2(4,2)
           M_ON3557_result_3(1,1) M_ON3557_result_3(1,2) M_ON3557_result_3(2,1) M_ON3557_result_3(2,2) M_ON3557_result_3(3,1) M_ON3557_result_3(3,2) M_ON3557_result_3(4,1) M_ON3557_result_3(4,2)
           M_ON3557_result_4(1,1) M_ON3557_result_4(1,2) M_ON3557_result_4(2,1) M_ON3557_result_4(2,2) M_ON3557_result_4(3,1) M_ON3557_result_4(3,2) M_ON3557_result_4(4,1) M_ON3557_result_4(4,2)
           M_ON3557_result_5(1,1) M_ON3557_result_5(1,2) M_ON3557_result_5(2,1) M_ON3557_result_5(2,2) M_ON3557_result_5(3,1) M_ON3557_result_5(3,2) M_ON3557_result_5(4,1) M_ON3557_result_5(4,2)
           M_ON3557_result_6(1,1) M_ON3557_result_6(1,2) M_ON3557_result_6(2,1) M_ON3557_result_6(2,2) M_ON3557_result_6(3,1) M_ON3557_result_6(3,2) M_ON3557_result_6(4,1) M_ON3557_result_6(4,2)
           
           M_ON3590_result_1(1,1) M_ON3590_result_1(1,2) M_ON3590_result_1(2,1) M_ON3590_result_1(2,2) M_ON3590_result_1(3,1) M_ON3590_result_1(3,2) M_ON3590_result_1(4,1) M_ON3590_result_1(4,2)
           M_ON3590_result_2(1,1) M_ON3590_result_2(1,2) M_ON3590_result_2(2,1) M_ON3590_result_2(2,2) M_ON3590_result_2(3,1) M_ON3590_result_2(3,2) M_ON3590_result_2(4,1) M_ON3590_result_2(4,2)
           M_ON3590_result_3(1,1) M_ON3590_result_3(1,2) M_ON3590_result_3(2,1) M_ON3590_result_3(2,2) M_ON3590_result_3(3,1) M_ON3590_result_3(3,2) M_ON3590_result_3(4,1) M_ON3590_result_3(4,2)
           M_ON3590_result_4(1,1) M_ON3590_result_4(1,2) M_ON3590_result_4(2,1) M_ON3590_result_4(2,2) M_ON3590_result_4(3,1) M_ON3590_result_4(3,2) M_ON3590_result_4(4,1) M_ON3590_result_4(4,2)
%            M_ON3590_result_5(1,1) M_ON3590_result_5(1,2) M_ON3590_result_5(2,1) M_ON3590_result_5(2,2) M_ON3590_result_5(3,1) M_ON3590_result_5(3,2) M_ON3590_result_5(4,1) M_ON3590_result_5(4,2)
%            M_ON3590_result_6(1,1) M_ON3590_result_6(1,2) M_ON3590_result_6(2,1) M_ON3590_result_6(2,2) M_ON3590_result_6(3,1) M_ON3590_result_6(3,2) M_ON3590_result_6(4,1) M_ON3590_result_6(4,2)
          
           M_ON3596_result_1(1,1) M_ON3596_result_1(1,2) M_ON3596_result_1(2,1) M_ON3596_result_1(2,2) M_ON3596_result_1(3,1) M_ON3596_result_1(3,2) M_ON3596_result_1(4,1) M_ON3596_result_1(4,2)
           M_ON3596_result_2(1,1) M_ON3596_result_2(1,2) M_ON3596_result_2(2,1) M_ON3596_result_2(2,2) M_ON3596_result_2(3,1) M_ON3596_result_2(3,2) M_ON3596_result_2(4,1) M_ON3596_result_2(4,2)
           M_ON3596_result_3(1,1) M_ON3596_result_3(1,2) M_ON3596_result_3(2,1) M_ON3596_result_3(2,2) M_ON3596_result_3(3,1) M_ON3596_result_3(3,2) M_ON3596_result_3(4,1) M_ON3596_result_3(4,2)
           M_ON3596_result_4(1,1) M_ON3596_result_4(1,2) M_ON3596_result_4(2,1) M_ON3596_result_4(2,2) M_ON3596_result_4(3,1) M_ON3596_result_4(3,2) M_ON3596_result_4(4,1) M_ON3596_result_4(4,2)
           M_ON3596_result_5(1,1) M_ON3596_result_5(1,2) M_ON3596_result_5(2,1) M_ON3596_result_5(2,2) M_ON3596_result_5(3,1) M_ON3596_result_5(3,2) M_ON3596_result_5(4,1) M_ON3596_result_5(4,2)
           M_ON3596_result_6(1,1) M_ON3596_result_6(1,2) M_ON3596_result_6(2,1) M_ON3596_result_6(2,2) M_ON3596_result_6(3,1) M_ON3596_result_6(3,2) M_ON3596_result_6(4,1) M_ON3596_result_6(4,2)
           
%            M_ON3160_result_1(1,1) M_ON3160_result_1(1,2) M_ON3160_result_1(2,1) M_ON3160_result_1(2,2) M_ON3160_result_1(3,1) M_ON3160_result_1(3,2) M_ON3160_result_1(4,1) M_ON3160_result_1(4,2)
%            M_ON3160_result_2(1,1) M_ON3160_result_2(1,2) M_ON3160_result_2(2,1) M_ON3160_result_2(2,2) M_ON3160_result_2(3,1) M_ON3160_result_2(3,2) M_ON3160_result_2(4,1) M_ON3160_result_2(4,2)
%            M_ON3160_result_3(1,1) M_ON3160_result_3(1,2) M_ON3160_result_3(2,1) M_ON3160_result_3(2,2) M_ON3160_result_3(3,1) M_ON3160_result_3(3,2) M_ON3160_result_3(4,1) M_ON3160_result_3(4,2)
%            M_ON3160_result_4(1,1) M_ON3160_result_4(1,2) M_ON3160_result_4(2,1) M_ON3160_result_4(2,2) M_ON3160_result_4(3,1) M_ON3160_result_4(3,2) M_ON3160_result_4(4,1) M_ON3160_result_4(4,2)
%            M_ON3160_result_5(1,1) M_ON3160_result_5(1,2) M_ON3160_result_5(2,1) M_ON3160_result_5(2,2) M_ON3160_result_5(3,1) M_ON3160_result_5(3,2) M_ON3160_result_5(4,1) M_ON3160_result_5(4,2)
%            M_ON3160_result_6(1,1) M_ON3160_result_6(1,2) M_ON3160_result_6(2,1) M_ON3160_result_6(2,2) M_ON3160_result_6(3,1) M_ON3160_result_6(3,2) M_ON3160_result_6(4,1) M_ON3160_result_6(4,2)

           ];   

data_off_mean=mean(data_off); [m1 n1]=size(data_off); data_off_std=std(data_off)./sqrt(m1);
data_on_mean =mean(data_on); [m2 n2]=size(data_on); data_on_std =std(data_on)./sqrt(m2);
 
save data_onoff_control_for3 data_on data_off;
%%%%% 画图 
x1=0.5; x2=1.0;
C1=[0 0 0];C2=[1 1 1];C3 = [0 191 255]./256;
figure(1)
subplot(2,4,1)
superbar(x1,data_off_mean(1), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(1)/50 data_off_std(1)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(1), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(1), 'ErrorbarColor',C3);
xlabel('Push-initiated');ylabel('Number of behaviors/trials');set(gca,'linewidth',2);
subplot(2,4,2)
superbar(x1,data_off_mean(2), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(2)/50 data_off_std(2)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(2), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(2), 'ErrorbarColor',C3);
xlabel('Push-initiated');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,3)
superbar(x1,data_off_mean(3), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(3)/85 data_off_std(3)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(3), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(3), 'ErrorbarColor',C3);
xlabel('Push-back');ylabel('Number of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,4)
superbar(x1,data_off_mean(4), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(4)/105 data_off_std(4)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(4), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(4), 'ErrorbarColor',C3);
xlabel('Push-back');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,5)
superbar(x1,data_off_mean(5), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(5)/55 data_off_std(5)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(5), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(5), 'ErrorbarColor',C3);
xlabel('Stillness');ylabel('Number of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,6)
superbar(x1,data_off_mean(6), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(6)/80 data_off_std(6)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(6), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(6), 'ErrorbarColor',C3);
xlabel('Stillness');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,7)
superbar(x1,data_off_mean(7), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(7)/100 data_off_std(7)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(7), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(7), 'ErrorbarColor',C3);
xlabel('Resistence');ylabel('% time');set(gca,'linewidth',2);
subplot(2,4,8)
superbar(x1,data_off_mean(8), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [data_off_std(8)/100 data_off_std(8)], 'ErrorbarColor',C1);hold on; 
superbar(x2,data_on_mean(8), 'BarWidth',0.5,'BarFaceColor',C3, 'E', data_on_std(8), 'ErrorbarColor',C3);
legend('Light off','Light on');xlabel('Retreat');ylabel('% time');set(gca,'linewidth',2);

             
          
