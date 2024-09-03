clear all
close all
clc

[CNO_s11,CNO_s12,CNO_s13]=xlsread('C57_DRN_hM3Dq_行为表现.xlsx','CNO_after_3.5h');   %% 原始文件中首行非正式数据的说明文字去掉
[SAL_s11,SAL_s12,SAL_s13]=xlsread('C57_DRN_mCherry_行为表现_hM3Dq.xlsx','CNO_after_3.5h');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 以下用于重复测量实验设计
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A=unique(CNO_s11(:,3));  % find the ID of animals
% animal=A(~isnan(A));
% for i=1:length(animal)
%     temp=(find([CNO_s13{:,3}]==animal(i)))';
%     for j=1:length(temp)
%         eval(['M_CNO',int2str(animal(i)),'{j,1}=CNO_s13{temp(j),1};']);
%         eval(['M_CNO',int2str(animal(i)),'{j,2}=CNO_s13{temp(j),2};']);
%         eval(['M_CNO',int2str(animal(i)),'{j,3}=CNO_s13{temp(j),3};']);
%         eval(['M_CNO',int2str(animal(i)),'{j,4}=CNO_s13{temp(j),4};']);
%     end
%     eval(['M_CNO',int2str(animal(i)),'_result=caculate_behaviour(M_CNO',int2str(animal(i)),',animal(i));']);   %输出结果格式   push-initiation数量    push-initiation持续时间
% end                                                                                                            %               push-back数量          push-back持续时间
%                                                                                                                %               stillness数量          stillness持续时间
%                                                                                                                %               resistance占比         retreat占比
%                                                                                                             
% for i=1:length(animal) 
%     temp=(find([SAL_s13{:,3}]==animal(i)))';
%     for j=1:length(temp)
%         eval(['M_SAL',int2str(animal(i)),'{j,1}=SAL_s13{temp(j),1};']);
%         eval(['M_SAL',int2str(animal(i)),'{j,2}=SAL_s13{temp(j),2};']);
%         eval(['M_SAL',int2str(animal(i)),'{j,3}=SAL_s13{temp(j),3};']);
%         eval(['M_SAL',int2str(animal(i)),'{j,4}=SAL_s13{temp(j),4};']);
%     end
%     eval(['M_SAL',int2str(animal(i)),'_result=caculate_behaviour(M_SAL',int2str(animal(i)),',animal(i));']);
% end
% 
% %%%%统计数据格式16列：PI数量对照, PI数量CNO, PI持续时间对照, PI持续时间CNO, PB数量对照, PB数量CNO, PB持续时间对照, PB持续时间CNO, Still数量对照, Still数量CNO, Still持续时间对照, Still持续时间CNO,Resistence占比对照, Resistence占比CNO,Retreat占比对照, Retreat占比CNO 
% data_stat=[M_SAL3119_result(1,1) M_CNO3119_result(1,1) M_SAL3119_result(1,2)  M_CNO3119_result(1,2) M_SAL3119_result(2,1)  M_CNO3119_result(2,1) M_SAL3119_result(2,2)  M_CNO3119_result(2,2) M_SAL3119_result(3,1)  M_CNO3119_result(3,1) M_SAL3119_result(3,2)  M_CNO3119_result(3,2) M_SAL3119_result(4,1)  M_CNO3119_result(4,1) M_SAL3119_result(4,2)  M_CNO3119_result(4,2)
%            M_SAL3116_result(1,1) M_CNO3116_result(1,1) M_SAL3116_result(1,2)  M_CNO3116_result(1,2) M_SAL3116_result(2,1)  M_CNO3116_result(2,1) M_SAL3116_result(2,2)  M_CNO3116_result(2,2) M_SAL3116_result(3,1)  M_CNO3116_result(3,1) M_SAL3116_result(3,2)  M_CNO3116_result(3,2) M_SAL3116_result(4,1)  M_CNO3116_result(4,1) M_SAL3116_result(4,2)  M_CNO3116_result(4,2)
%            M_SAL3546_result(1,1) M_CNO3546_result(1,1) M_SAL3546_result(1,2)  M_CNO3546_result(1,2) M_SAL3546_result(2,1)  M_CNO3546_result(2,1) M_SAL3546_result(2,2)  M_CNO3546_result(2,2) M_SAL3546_result(3,1)  M_CNO3546_result(3,1) M_SAL3546_result(3,2)  M_CNO3546_result(3,2) M_SAL3546_result(4,1)  M_CNO3546_result(4,1) M_SAL3546_result(4,2)  M_CNO3546_result(4,2)
%            M_SAL3551_result(1,1) M_CNO3551_result(1,1) M_SAL3551_result(1,2)  M_CNO3551_result(1,2) M_SAL3551_result(2,1)  M_CNO3551_result(2,1) M_SAL3551_result(2,2)  M_CNO3551_result(2,2) M_SAL3551_result(3,1)  M_CNO3551_result(3,1) M_SAL3551_result(3,2)  M_CNO3551_result(3,2) M_SAL3551_result(4,1)  M_CNO3551_result(4,1) M_SAL3551_result(4,2)  M_CNO3551_result(4,2)
%            M_SAL3547_result(1,1) M_CNO3547_result(1,1) M_SAL3547_result(1,2)  M_CNO3547_result(1,2) M_SAL3547_result(2,1)  M_CNO3547_result(2,1) M_SAL3547_result(2,2)  M_CNO3547_result(2,2) M_SAL3547_result(3,1)  M_CNO3547_result(3,1) M_SAL3547_result(3,2)  M_CNO3547_result(3,2) M_SAL3547_result(4,1)  M_CNO3547_result(4,1) M_SAL3547_result(4,2)  M_CNO3547_result(4,2)
%            M_SAL3553_result(1,1) M_CNO3553_result(1,1) M_SAL3553_result(1,2)  M_CNO3553_result(1,2) M_SAL3553_result(2,1)  M_CNO3553_result(2,1) M_SAL3553_result(2,2)  M_CNO3553_result(2,2) M_SAL3553_result(3,1)  M_CNO3553_result(3,1) M_SAL3553_result(3,2)  M_CNO3553_result(3,2) M_SAL3553_result(4,1)  M_CNO3553_result(4,1) M_SAL3553_result(4,2)  M_CNO3553_result(4,2)
%            M_SAL628_result(1,1) M_CNO628_result(1,1) M_SAL628_result(1,2)  M_CNO628_result(1,2) M_SAL628_result(2,1)  M_CNO628_result(2,1) M_SAL628_result(2,2)  M_CNO628_result(2,2) M_SAL628_result(3,1)  M_CNO628_result(3,1) M_SAL628_result(3,2)  M_CNO628_result(3,2) M_SAL628_result(4,1)  M_CNO628_result(4,1) M_SAL628_result(4,2)  M_CNO628_result(4,2)
%            M_SAL3550_result(1,1) M_CNO3550_result(1,1) M_SAL3550_result(1,2)  M_CNO3550_result(1,2) M_SAL3550_result(2,1)  M_CNO3550_result(2,1) M_SAL3550_result(2,2)  M_CNO3550_result(2,2) M_SAL3550_result(3,1)  M_CNO3550_result(3,1) M_SAL3550_result(3,2)  M_CNO3550_result(3,2) M_SAL3550_result(4,1)  M_CNO3550_result(4,1) M_SAL3550_result(4,2)  M_CNO3550_result(4,2)
%            M_SAL2691_result(1,1) M_CNO2691_result(1,1) M_SAL2691_result(1,2)  M_CNO2691_result(1,2) M_SAL2691_result(2,1)  M_CNO2691_result(2,1) M_SAL2691_result(2,2)  M_CNO2691_result(2,2) M_SAL2691_result(3,1)  M_CNO2691_result(3,1) M_SAL2691_result(3,2)  M_CNO2691_result(3,2) M_SAL2691_result(4,1)  M_CNO2691_result(4,1) M_SAL2691_result(4,2)  M_CNO2691_result(4,2)];
% %            M_SAL362_result(1,1) M_CNO362_result(1,1) M_SAL362_result(1,2)  M_CNO362_result(1,2) M_SAL362_result(2,1)  M_CNO362_result(2,1) M_SAL362_result(2,2)  M_CNO362_result(2,2) M_SAL362_result(3,1)  M_CNO362_result(3,1) M_SAL362_result(3,2)  M_CNO362_result(3,2) M_SAL362_result(4,1)  M_CNO362_result(4,1) M_SAL362_result(4,2)  M_CNO362_result(4,2)
% %            M_SAL508_result(1,1) M_CNO508_result(1,1) M_SAL508_result(1,2)  M_CNO508_result(1,2) M_SAL508_result(2,1)  M_CNO508_result(2,1) M_SAL508_result(2,2)  M_CNO508_result(2,2) M_SAL508_result(3,1)  M_CNO508_result(3,1) M_SAL508_result(3,2)  M_CNO508_result(3,2) M_SAL508_result(4,1)  M_CNO508_result(4,1) M_SAL508_result(4,2)  M_CNO508_result(4,2)
% %            M_SAL779_result(1,1) M_CNO779_result(1,1) M_SAL779_result(1,2)  M_CNO779_result(1,2) M_SAL779_result(2,1)  M_CNO779_result(2,1) M_SAL779_result(2,2)  M_CNO779_result(2,2) M_SAL779_result(3,1)  M_CNO779_result(3,1) M_SAL779_result(3,2)  M_CNO779_result(3,2) M_SAL779_result(4,1)  M_CNO779_result(4,1) M_SAL779_result(4,2)  M_CNO779_result(4,2)];
% data_stat_mean=mean(data_stat(1:9,:));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 以下用于独立样本实验设计
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A=unique(CNO_s11(:,3));  % find the ID of animals
animal=A(~isnan(A));
for i=1:length(animal)
    temp=(find([CNO_s13{:,3}]==animal(i)))';
    for j=1:length(temp)
        eval(['M_CNO',int2str(animal(i)),'{j,1}=CNO_s13{temp(j),1};']);
        eval(['M_CNO',int2str(animal(i)),'{j,2}=CNO_s13{temp(j),2};']);
        eval(['M_CNO',int2str(animal(i)),'{j,3}=CNO_s13{temp(j),3};']);
        eval(['M_CNO',int2str(animal(i)),'{j,4}=CNO_s13{temp(j),4};']);
    end
    eval(['M_CNO',int2str(animal(i)),'_result=caculate_behaviour(M_CNO',int2str(animal(i)),',animal(i));']);   %输出结果格式   push-initiation数量    push-initiation持续时间
end                                                                                                            %               push-back数量          push-back持续时间
                                                                                                               %               stillness数量          stillness持续时间
                                                                                                               %               resistance占比         retreat占比
B=unique(SAL_s11(:,3));  % find the ID of animals
animal1=B(~isnan(B));                                                                                                           
for i=1:length(animal1) 
    temp=(find([SAL_s13{:,3}]==animal1(i)))';
    for j=1:length(temp)
        eval(['M_SAL',int2str(animal1(i)),'{j,1}=SAL_s13{temp(j),1};']);
        eval(['M_SAL',int2str(animal1(i)),'{j,2}=SAL_s13{temp(j),2};']);
        eval(['M_SAL',int2str(animal1(i)),'{j,3}=SAL_s13{temp(j),3};']);
        eval(['M_SAL',int2str(animal1(i)),'{j,4}=SAL_s13{temp(j),4};']);
    end
    eval(['M_SAL',int2str(animal1(i)),'_result=caculate_behaviour(M_SAL',int2str(animal1(i)),',animal1(i));']);
end

%%%%统计数据格式16列：PI数量对照, PI数量CNO, PI持续时间对照, PI持续时间CNO, PB数量对照, PB数量CNO, PB持续时间对照, PB持续时间CNO, Still数量对照, Still数量CNO, Still持续时间对照, Still持续时间CNO,Resistence占比对照, Resistence占比CNO,Retreat占比对照, Retreat占比CNO 
data_stat=[M_SAL3484_result(1,1) M_CNO3119_result(1,1) M_SAL3484_result(1,2)  M_CNO3119_result(1,2) M_SAL3484_result(2,1)  M_CNO3119_result(2,1) M_SAL3484_result(2,2)  M_CNO3119_result(2,2) M_SAL3484_result(3,1)  M_CNO3119_result(3,1) M_SAL3484_result(3,2)  M_CNO3119_result(3,2) M_SAL3484_result(4,1)  M_CNO3119_result(4,1) M_SAL3484_result(4,2)  M_CNO3119_result(4,2)
           M_SAL3482_result(1,1) M_CNO3116_result(1,1) M_SAL3482_result(1,2)  M_CNO3116_result(1,2) M_SAL3482_result(2,1)  M_CNO3116_result(2,1) M_SAL3482_result(2,2)  M_CNO3116_result(2,2) M_SAL3482_result(3,1)  M_CNO3116_result(3,1) M_SAL3482_result(3,2)  M_CNO3116_result(3,2) M_SAL3482_result(4,1)  M_CNO3116_result(4,1) M_SAL3482_result(4,2)  M_CNO3116_result(4,2)
           M_SAL3486_result(1,1) M_CNO3546_result(1,1) M_SAL3486_result(1,2)  M_CNO3546_result(1,2) M_SAL3486_result(2,1)  M_CNO3546_result(2,1) M_SAL3486_result(2,2)  M_CNO3546_result(2,2) M_SAL3486_result(3,1)  M_CNO3546_result(3,1) M_SAL3486_result(3,2)  M_CNO3546_result(3,2) M_SAL3486_result(4,1)  M_CNO3546_result(4,1) M_SAL3486_result(4,2)  M_CNO3546_result(4,2)
           M_SAL3479_result(1,1) M_CNO3551_result(1,1) M_SAL3479_result(1,2)  M_CNO3551_result(1,2) M_SAL3479_result(2,1)  M_CNO3551_result(2,1) M_SAL3479_result(2,2)  M_CNO3551_result(2,2) M_SAL3479_result(3,1)  M_CNO3551_result(3,1) M_SAL3479_result(3,2)  M_CNO3551_result(3,2) M_SAL3479_result(4,1)  M_CNO3551_result(4,1) M_SAL3479_result(4,2)  M_CNO3551_result(4,2)
           M_SAL3483_result(1,1) M_CNO3547_result(1,1) M_SAL3483_result(1,2)  M_CNO3547_result(1,2) M_SAL3483_result(2,1)  M_CNO3547_result(2,1) M_SAL3483_result(2,2)  M_CNO3547_result(2,2) M_SAL3483_result(3,1)  M_CNO3547_result(3,1) M_SAL3483_result(3,2)  M_CNO3547_result(3,2) M_SAL3483_result(4,1)  M_CNO3547_result(4,1) M_SAL3483_result(4,2)  M_CNO3547_result(4,2)
           M_SAL3488_result(1,1) M_CNO3553_result(1,1) M_SAL3488_result(1,2)  M_CNO3553_result(1,2) M_SAL3488_result(2,1)  M_CNO3553_result(2,1) M_SAL3488_result(2,2)  M_CNO3553_result(2,2) M_SAL3488_result(3,1)  M_CNO3553_result(3,1) M_SAL3488_result(3,2)  M_CNO3553_result(3,2) M_SAL3488_result(4,1)  M_CNO3553_result(4,1) M_SAL3488_result(4,2)  M_CNO3553_result(4,2)
           M_SAL3477_result(1,1) M_CNO3550_result(1,1) M_SAL3477_result(1,2)  M_CNO3550_result(1,2) M_SAL3477_result(2,1)  M_CNO3550_result(2,1) M_SAL3477_result(2,2)  M_CNO3550_result(2,2) M_SAL3477_result(3,1)  M_CNO3550_result(3,1) M_SAL3477_result(3,2)  M_CNO3550_result(3,2) M_SAL3477_result(4,1)  M_CNO3550_result(4,1) M_SAL3477_result(4,2)  M_CNO3550_result(4,2)];
%            M_SAL3484_result(1,1) M_CNO2691_result(1,1) M_SAL2615_result(1,2)  M_CNO2691_result(1,2) M_SAL2615_result(2,1)  M_CNO2691_result(2,1) M_SAL2615_result(2,2)  M_CNO2691_result(2,2) M_SAL2615_result(3,1)  M_CNO2691_result(3,1) M_SAL2615_result(3,2)  M_CNO2691_result(3,2) M_SAL2615_result(4,1)  M_CNO2691_result(4,1) M_SAL2615_result(4,2)  M_CNO2691_result(4,2)];
%            M_SAL362_result(1,1) M_CNO362_result(1,1) M_SAL362_result(1,2)  M_CNO362_result(1,2) M_SAL362_result(2,1)  M_CNO362_result(2,1) M_SAL362_result(2,2)  M_CNO362_result(2,2) M_SAL362_result(3,1)  M_CNO362_result(3,1) M_SAL362_result(3,2)  M_CNO362_result(3,2) M_SAL362_result(4,1)  M_CNO362_result(4,1) M_SAL362_result(4,2)  M_CNO362_result(4,2)
%            M_SAL508_result(1,1) M_CNO508_result(1,1) M_SAL508_result(1,2)  M_CNO508_result(1,2) M_SAL508_result(2,1)  M_CNO508_result(2,1) M_SAL508_result(2,2)  M_CNO508_result(2,2) M_SAL508_result(3,1)  M_CNO508_result(3,1) M_SAL508_result(3,2)  M_CNO508_result(3,2) M_SAL508_result(4,1)  M_CNO508_result(4,1) M_SAL508_result(4,2)  M_CNO508_result(4,2)
%            M_SAL779_result(1,1) M_CNO779_result(1,1) M_SAL779_result(1,2)  M_CNO779_result(1,2) M_SAL779_result(2,1)  M_CNO779_result(2,1) M_SAL779_result(2,2)  M_CNO779_result(2,2) M_SAL779_result(3,1)  M_CNO779_result(3,1) M_SAL779_result(3,2)  M_CNO779_result(3,2) M_SAL779_result(4,1)  M_CNO779_result(4,1) M_SAL779_result(4,2)  M_CNO779_result(4,2)];
data_stat_mean=mean(data_stat(1:7,:));
data_for_stat=[M_SAL3484_result(1,1) M_SAL3484_result(1,2) M_SAL3484_result(2,1) M_SAL3484_result(2,2) M_SAL3484_result(3,1) M_SAL3484_result(3,2) M_SAL3484_result(4,1)  M_SAL3484_result(4,2)  %用于U检验
               M_SAL3482_result(1,1) M_SAL3482_result(1,2) M_SAL3482_result(2,1) M_SAL3482_result(2,2) M_SAL3482_result(3,1) M_SAL3482_result(3,2) M_SAL3482_result(4,1)  M_SAL3482_result(4,2)
               M_SAL3486_result(1,1) M_SAL3486_result(1,2) M_SAL3486_result(2,1) M_SAL3486_result(2,2) M_SAL3486_result(3,1) M_SAL3486_result(3,2) M_SAL3486_result(4,1)  M_SAL3486_result(4,2)
               M_SAL3479_result(1,1) M_SAL3479_result(1,2) M_SAL3479_result(2,1) M_SAL3479_result(2,2) M_SAL3479_result(3,1) M_SAL3479_result(3,2) M_SAL3479_result(4,1)  M_SAL3479_result(4,2)
               M_SAL3483_result(1,1) M_SAL3483_result(1,2) M_SAL3483_result(2,1) M_SAL3483_result(2,2) M_SAL3483_result(3,1) M_SAL3483_result(3,2) M_SAL3483_result(4,1)  M_SAL3483_result(4,2)
               M_SAL3488_result(1,1) M_SAL3488_result(1,2) M_SAL3488_result(2,1) M_SAL3488_result(2,2) M_SAL3488_result(3,1) M_SAL3488_result(3,2) M_SAL3488_result(4,1)  M_SAL3488_result(4,2)
%                M_SAL2691_result(1,1) M_SAL2691_result(1,2) M_SAL2691_result(2,1) M_SAL2691_result(2,2) M_SAL2691_result(3,1) M_SAL2691_result(3,2) M_SAL2691_result(4,1)  M_SAL2691_result(4,2)
               M_SAL3477_result(1,1) M_SAL3477_result(1,2) M_SAL3477_result(2,1) M_SAL3477_result(2,2) M_SAL3477_result(3,1) M_SAL3477_result(3,2) M_SAL3477_result(4,1)  M_SAL3477_result(4,2)
%                M_SAL2615_result(1,1) M_SAL2615_result(1,2) M_SAL2615_result(2,1) M_SAL2615_result(2,2) M_SAL2615_result(3,1) M_SAL2615_result(3,2) M_SAL2615_result(4,1)  M_SAL2615_result(4,2)
               M_CNO3119_result(1,1) M_CNO3119_result(1,2) M_CNO3119_result(2,1) M_CNO3119_result(2,2) M_CNO3119_result(3,1) M_CNO3119_result(3,2) M_CNO3119_result(4,1)  M_CNO3119_result(4,2)
               M_CNO3116_result(1,1) M_CNO3116_result(1,2) M_CNO3116_result(2,1) M_CNO3116_result(2,2) M_CNO3116_result(3,1) M_CNO3116_result(3,2) M_CNO3116_result(4,1)  M_CNO3116_result(4,2)
               M_CNO3546_result(1,1) M_CNO3546_result(1,2) M_CNO3546_result(2,1) M_CNO3546_result(2,2) M_CNO3546_result(3,1) M_CNO3546_result(3,2) M_CNO3546_result(4,1)  M_CNO3546_result(4,2)
               M_CNO3551_result(1,1) M_CNO3551_result(1,2) M_CNO3551_result(2,1) M_CNO3551_result(2,2) M_CNO3551_result(3,1) M_CNO3551_result(3,2) M_CNO3551_result(4,1)  M_CNO3551_result(4,2)
               M_CNO3547_result(1,1) M_CNO3547_result(1,2) M_CNO3547_result(2,1) M_CNO3547_result(2,2) M_CNO3547_result(3,1) M_CNO3547_result(3,2) M_CNO3547_result(4,1)  M_CNO3547_result(4,2)
               M_CNO3553_result(1,1) M_CNO3553_result(1,2) M_CNO3553_result(2,1) M_CNO3553_result(2,2) M_CNO3553_result(3,1) M_CNO3553_result(3,2) M_CNO3553_result(4,1)  M_CNO3553_result(4,2)
               M_CNO3550_result(1,1) M_CNO3550_result(1,2) M_CNO3550_result(2,1) M_CNO3550_result(2,2) M_CNO3550_result(3,1) M_CNO3550_result(3,2) M_CNO3550_result(4,1)  M_CNO3550_result(4,2)];
%                M_CNO2691_result(1,1) M_CNO2691_result(1,2) M_CNO2691_result(2,1) M_CNO2691_result(2,2) M_CNO2691_result(3,1) M_CNO2691_result(3,2) M_CNO2691_result(4,1)  M_CNO2691_result(4,2)];
           
%%%%% 画图           
mean_data_stat=mean(data_stat); std_data_stat=std(data_stat)./sqrt(length(animal1));
x1=0.5; x2=1.0;
C1=[0 0 0];C2=[1 1 1];C3 = [180 130 190]/256;
figure(1)
subplot(2,4,1)
superbar(x1,mean_data_stat(1), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(1)/40 std_data_stat(1)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(2), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(2), 'ErrorbarColor',C3);
xlabel('Push-initiated');ylabel('Number of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,2)
superbar(x1,mean_data_stat(3), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(3)/90 std_data_stat(3)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(4), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(4), 'ErrorbarColor',C3);
xlabel('Push-initiated');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,3)
superbar(x1,mean_data_stat(5), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(5)/80 std_data_stat(5)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(6), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(6), 'ErrorbarColor',C3);
xlabel('Push-back');ylabel('Number of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,4)
superbar(x1,mean_data_stat(7), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(7)/100 std_data_stat(7)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(8), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(8), 'ErrorbarColor',C3);
xlabel('Push-back');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,5)
superbar(x1,mean_data_stat(9), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(9)/55 std_data_stat(9)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(10), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(10), 'ErrorbarColor',C3);
xlabel('Stillness');ylabel('Number of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,6)
superbar(x1,mean_data_stat(11), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(11)/80 std_data_stat(11)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(12), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(12), 'ErrorbarColor',C3);
xlabel('Stillness');ylabel('Duration of behaviors/trial');set(gca,'linewidth',2);
subplot(2,4,7)
superbar(x1,mean_data_stat(13), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(13)/40 std_data_stat(13)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(14), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(14), 'ErrorbarColor',C3);
xlabel('Resistence');ylabel('% time');set(gca,'linewidth',2);
subplot(2,4,8)
superbar(x1,mean_data_stat(15), 'BarWidth',0.5,'BarEdgeColor',C1, 'BarFaceColor', C2, 'E', [std_data_stat(15)/50 std_data_stat(15)], 'ErrorbarColor',C1);hold on; 
superbar(x2,mean_data_stat(16), 'BarWidth',0.5,'BarFaceColor',C3, 'E', std_data_stat(16), 'ErrorbarColor',C3);
legend('mCherry','hM3Dq+mCherry');xlabel('Retreat');ylabel('% time');set(gca,'linewidth',2);


% figure(2)
% x1=0.25;x2=0.5;
% subplot(2,4,1)
% bar(x1,mean_data_stat(1),0.25,'w');hold on;errorbar(x1,mean_data_stat(1),std_data_stat(1),'+');hold on;
% bar(x2,mean_data_stat(2),0.25,'b');hold on;errorbar(x2,mean_data_stat(2),std_data_stat(2),'+');xlabel('Push-initiated');ylabel('Number of behaviors/trial');
% subplot(2,4,2)
% bar(x1,mean_data_stat(3),0.25,'w');hold on;errorbar(x1,mean_data_stat(3),std_data_stat(3),'+');hold on;
% bar(x2,mean_data_stat(4),0.25,'b');hold on;errorbar(x2,mean_data_stat(4),std_data_stat(4),'+');xlabel('Push-initiated');ylabel('Duration of behaviors/trial');
% subplot(2,4,3)
% bar(x1,mean_data_stat(5),0.25,'w');hold on;errorbar(x1,mean_data_stat(5),std_data_stat(5),'+');hold on;
% bar(x2,mean_data_stat(6),0.25,'b');hold on;errorbar(x2,mean_data_stat(6),std_data_stat(6),'+');xlabel('Push-back');ylabel('Number of behaviors/trial');
% subplot(2,4,4)
% bar(x1,mean_data_stat(7),0.25,'w');hold on;errorbar(x1,mean_data_stat(7),std_data_stat(7),'+');hold on;
% bar(x2,mean_data_stat(8),0.25,'b');hold on;errorbar(x2,mean_data_stat(8),std_data_stat(8),'+');xlabel('Push-back');ylabel('Duration of behaviors/trial');
% subplot(2,4,5)
% bar(x1,mean_data_stat(9),0.25,'w');hold on;errorbar(x1,mean_data_stat(9),std_data_stat(9),'+');hold on;
% bar(x2,mean_data_stat(10),0.25,'b');hold on;errorbar(x2,mean_data_stat(10),std_data_stat(10),'+');xlabel('Stillness');ylabel('Number of behaviors/trial');
% subplot(2,4,6)
% bar(x1,mean_data_stat(11),0.25,'w');hold on;errorbar(x1,mean_data_stat(11),std_data_stat(11),'+');hold on;
% bar(x2,mean_data_stat(12),0.25,'b');hold on;errorbar(x2,mean_data_stat(12),std_data_stat(12),'+');xlabel('Stillness');ylabel('Duration of behaviors/trial');
% subplot(2,4,7)
% bar(x1,mean_data_stat(13),0.25,'w');hold on;errorbar(x1,mean_data_stat(13),std_data_stat(13),'+');hold on;
% bar(x2,mean_data_stat(14),0.25,'b');hold on;errorbar(x2,mean_data_stat(14),std_data_stat(14),'+');xlabel('Resistence');ylabel('% time');
% subplot(2,4,8)
% bar(x1,mean_data_stat(15),0.25,'w');hold on;bar(x2,mean_data_stat(16),0.25,'b');hold on;errorbar(x1,mean_data_stat(15),std_data_stat(15),'+');hold on;
% errorbar(x2,mean_data_stat(16),std_data_stat(16),'+');hold on;legend('mCherry','hM3Dq+mCherry');xlabel('Retrest');ylabel('% time');
% 
% figure(3)   %%不同画法
% x1=[0.25 0.30];
% subplot(2,4,1)
% bar(x1,mean_data_stat([1 2]),1.0,'w');hold on;errorbar(x1,mean_data_stat([1 2]),std_data_stat([1 2]),'+');hold on;xlabel('Push-initiated');ylabel('Number of behaviors/trial');
% subplot(2,4,2)
% bar(x1,mean_data_stat([3 4]),1.0,'w');hold on;errorbar(x1,mean_data_stat([3 4]),std_data_stat([3 4]),'+');hold on;xlabel('Push-initiated');ylabel('Duration of behaviors/trial');
% subplot(2,4,3)
% bar(x1,mean_data_stat([5 6]),1.0,'w');hold on;errorbar(x1,mean_data_stat([5 6]),std_data_stat([5 6]),'+');hold on;xlabel('Push-back');ylabel('Number of behaviors/trial');
% subplot(2,4,4)
% bar(x1,mean_data_stat([7 8]),1.0,'w');hold on;errorbar(x1,mean_data_stat([7 8]),std_data_stat([7 8]),'+');hold on;xlabel('Push-back');ylabel('Duration of behaviors/trial');
% subplot(2,4,5)
% bar(x1,mean_data_stat([9 10]),1.0,'w');hold on;errorbar(x1,mean_data_stat([9 10]),std_data_stat([9 10]),'+');hold on;xlabel('Stillness');ylabel('Number of behaviors/trial');
% subplot(2,4,6)
% bar(x1,mean_data_stat([11 12]),1.0,'w');hold on;errorbar(x1,mean_data_stat([11 12]),std_data_stat([11 12]),'+');hold on;xlabel('Stillness');ylabel('Duration of behaviors/trial');
% subplot(2,4,7)
% bar(x1,mean_data_stat([13 14]),1.0,'w');hold on;errorbar(x1,mean_data_stat([13 14]),std_data_stat([13 14]),'+');hold on;xlabel('Resistence');ylabel('% time');
% subplot(2,4,8)
% bar(x1,mean_data_stat([15 16]),1.0,'w');hold on;errorbar(x1,mean_data_stat([15 16]),std_data_stat([15 16]),'+');hold on;xlabel('Retrest');ylabel('% time');hold on;legend('EYFP','hM4Di+EYFP');
             
          
