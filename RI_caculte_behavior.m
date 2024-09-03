%%% ���Ƚ�light on and light off �ҳ���������Ϊ10��block���Ա��ڶ�ÿ�� block���з���
%%% ����������ʱ����Ƿ�ɶԳ��֣����粻�ǳɶԳ��֣�����   
%%% ��Ϊ����  �����ԣ�chase\attack\lateral threat\keep down  �罻̽����socal-exploration\move towards\ago-gential sniffing\upright posture   ʣ�¾���rearing(���¼�)��non-social exploration
%%% ����������chase��������ʱ�䣬attack��������ʱ�䣬lateral threat��������ʱ�䣬keep down��������ʱ�䣬�����������ܳ���ʱ�䣨������4����Ϊ���ܺͣ�
%%%          ��socal-exploration��������ʱ�䣬move towards��������ʱ�䣬ago-gential sniffing��������ʱ�䣬upright posture��������ʱ�䣬�罻̽���������ܳ���ʱ�䣨������4����Ϊ���ܺͣ�
%%%          ��rearing(���¼�)����non-social exploration��������ʱ��
%%%          ��inactivity��������ʱ��
%%% ��������Results��ʽ  �д���ڼ�����
%%%         ��1��         2-3                          4-5                       6-7                              8-9                        10-11
%%%         ����=1   Chase��������ʱ��           attack��������ʱ��        lateral threat��������ʱ��        keep down��������ʱ��        �����������ܳ���ʱ��
%%%                      12-13                       14-15                     16-17                             18-19                       20-21             
%%%              socal-exploration��������ʱ��  move towards��������ʱ��  ago-gential sniffing��������ʱ��  upright posture��������ʱ��  �罻̽���������ܳ���ʱ��
%%%                       22                         23-24                       25-26                      27
%%%                rearing(���¼�)��   non-social exploration��������ʱ��  inactivity��������ʱ��         ID of mouse                   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% ʹ��˵����1.��22���е�excel�ļ���������
%%%%          2. �����һ���еı����ļ���
%%%%          3.��������󣬿�������Ƿ��б�����ʾ�����У�Ӧ���Excel�ļ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
clc
[ON_s11,ON_s12,ON_s13]=xlsread('Results_RI_DRN_CeA_EYFP_rawdata.xlsx','DRN_CeA_EYFP_������_818');  %% OFF ԭʼ�ļ������з���ʽ���ݵ�˵������ȥ��
A=unique(ON_s11(:,2));  % find the ID of animals
animal=A(~isnan(A));
if length(animal)>1
    display('The ID of mouse is wrong !')
    animal
end
M455=ON_s13;

Results=[];
sequence=cell2mat(M455(:,1));
for i=1:(length(sequence)-1)   %% �ж�ʱ����Ƿ�Ϊ����
    if sequence(i) > sequence(i+1)
        display('The timepoint of the sequence is wrong ! Line =');
        i
    end
end

T_trial=findInCell('trial',M455(:,3));          
if length(T_trial)~=2  
    display('The number of trials is wrong !'); 
end
T_LightON=findInCell('LightON',M455(:,3));     % LightONӦΪ5�Σ�10����
if mod(length(T_LightON),2)~=0
    display('The number of LightON is wrong !'); 
end
T_LightOFF=findInCell('LightOFF',M455(:,3));    % LightOFFӦΪ5�Σ�10����    
if mod(length(T_LightOFF),2)~=0 
    display('The number of LightOFF is wrong !'); 
end
lightonoff1=[T_LightON;T_LightOFF];
onoff=sort(lightonoff1);         %�ҳ�light on and light off ʱ���
if T_LightON(1) < T_LightOFF(1)  %˵����һ��block�Ǹ���  
    for i_on=1:length(T_LightON)/2
        Results(2*i_on-1,1)=1;
        Results(2*i_on,1)=0;
    end
else                             %˵����һ��block�ǲ�����  
    for i_on=1:length(T_LightON)/2
        Results(2*i_on-1,1)=0;
        Results(2*i_on,1)=1;
    end
end

for j=1:(length(onoff)/2)
    mice=M455(onoff(2*j-1):onoff(2*j),:);      %%% ��ȡ����һ��block
    T_Chase=findInCell('Chase',mice(:,3));     %%% �����ԣ�chase\attack\lateral threat\keep down 
    if mod(length(T_Chase),2)~=0 
       display('The number of Chase is wrong ! Block number ='); 
       j 
    end
    T_Attack=findInCell('Attack',mice(:,3));      
    if mod(length(T_Attack),2)~=0 
       display('The number of Attack is wrong ! Block number ='); 
       j 
    end
    T_Lateral_threat=findInCell('Lateral threat',mice(:,3));      
    if mod(length(T_Lateral_threat),2)~=0 
       display('The number of Lateral threat is wrong ! Block number ='); 
       j 
    end
    T_Keep_down=findInCell('Keep down',mice(:,3));      
    if mod(length(T_Keep_down),2)~=0 
       display('The number of Keep down is wrong ! Block number ='); 
       j 
    end
    
    T_Social_exploration=findInCell('Social exploration',mice(:,3));   %%% �罻̽����socal-exploration\move towards\ago-gential sniffing\upright posture
    if mod(length(T_Social_exploration),2)~=0 
       display('The number of Social exploration is wrong ! Block number ='); 
       j 
    end
    T_Moveto=findInCell('Move towards',mice(:,3));      
    if mod(length(T_Moveto),2)~=0 
       display('The number of Move towards is wrong ! Block number ='); 
       j 
    end
    T_Agogential_sniffing=findInCell('Ago-gential sniffing',mice(:,3));      
    if mod(length(T_Agogential_sniffing),2)~=0 
       display('The number of Ago-gential sniffing is wrong ! Block number ='); 
       j 
    end    
    T_Upright_posture=findInCell('Upright posture',mice(:,3));      
    if mod(length(T_Upright_posture),2)~=0 
       display('The number of Upright posture is wrong ! Block number ='); 
       j 
    end
    
    T_Rearing=findInCell('Rearing',mice(:,3));                                 %%% ���¼�
    T_Non_social_exploration=findInCell('Non-social exploration',mice(:,3));   %%% ���罻̽��   
    if mod(length(T_Non_social_exploration),2)~=0 
       display('The number of Non-social exploration is wrong ! Block number ='); 
       j 
    end
    
    T_Inactivity=findInCell('Inactivity',mice(:,3));                           %%% ��ֹ
    if mod(length(T_Inactivity),2)~=0 
       display('The number of Inactivity is wrong ! Block number ='); 
       j 
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%��ÿ��block���з���%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
T_time=cell2mat(mice(:,1));  %��һ��Ϊʱ��㣬��ʱ���תΪ����

T_Chase_du1=[];
if ~isempty(T_Chase)  
    T_Chase_num=(length(T_Chase))/2;  %% the number of Chase
    for i=1:length(T_Chase)/2
        T_Chase_du1(i)=T_time(T_Chase(2*i))-T_time(T_Chase(2*i-1));
    end
    T_Chase_du=sum(T_Chase_du1);      %% The duration of Chase   
else
    T_Chase_num=0;
    T_Chase_du=0;
end
Results(j,2:3)=[T_Chase_num T_Chase_du];

T_Attack_du1=[];
if ~isempty(T_Attack)
    T_Attack_num=(length(T_Attack))/2;  %% the number of Attack
    for i=1:length(T_Attack)/2
        T_Attack_du1(i)=T_time(T_Attack(2*i))-T_time(T_Attack(2*i-1));
    end
    T_Attack_du=sum(T_Attack_du1);      %% The duration of Attack   
else
    T_Attack_num=0;
    T_Attack_du=0;
end
Results(j,4:5)=[T_Attack_num T_Attack_du]; 

T_Lateral_threat_du1=[];
if ~isempty(T_Lateral_threat)
    T_Lateral_threat_num=(length(T_Lateral_threat))/2;  %% the number of Lateral_threat
    for i=1:length(T_Lateral_threat)/2
        T_Lateral_threat_du1(i)=T_time(T_Lateral_threat(2*i))-T_time(T_Lateral_threat(2*i-1));
    end
    T_Lateral_threat_du=sum(T_Lateral_threat_du1);      %% The duration of Lateral_threat   
else
    T_Lateral_threat_num=0;
    T_Lateral_threat_du=0;
end
Results(j,6:7)=[T_Lateral_threat_num T_Lateral_threat_du];

T_Keep_down_du1=[];
if ~isempty(T_Keep_down)  
    T_Keep_down_num=(length(T_Keep_down))/2;     %% the number of Keep_down
    for i=1:length(T_Keep_down)/2
        T_Keep_down_du1(i)=T_time(T_Keep_down(2*i))-T_time(T_Keep_down(2*i-1));
    end
    T_Keep_down_du=sum(T_Keep_down_du1);         %% The duration of Keep_down   
else
    T_Keep_down_num=0;
    T_Keep_down_du=0;
end
Results(j,8:9)=[T_Keep_down_num T_Keep_down_du];

Results(j,10:11)=[T_Chase_num+T_Attack_num+T_Lateral_threat_num+T_Keep_down_num T_Chase_du+T_Attack_du+T_Lateral_threat_du+T_Keep_down_du];  %�����������ܳ���ʱ��

T_Social_exploration_du1=[];
if ~isempty(T_Social_exploration)  
    T_Social_exploration_num=(length(T_Social_exploration))/2;  %% the number of Social_exploration
    for i=1:length(T_Social_exploration)/2
        T_Social_exploration_du1(i)=T_time(T_Social_exploration(2*i))-T_time(T_Social_exploration(2*i-1));
    end
    T_Social_exploration_du=sum(T_Social_exploration_du1);      %% The duration of Social_exploration   
else
    T_Social_exploration_num=0;
    T_Social_exploration_du=0;
end
Results(j,12:13)=[T_Social_exploration_num T_Social_exploration_du];

T_Moveto_du1=[];
if ~isempty(T_Moveto)  
    T_Moveto_num=(length(T_Moveto))/2;  %% the number of Move towards
    for i=1:length(T_Moveto)/2
        T_Moveto_du1(i)=T_time(T_Moveto(2*i))-T_time(T_Moveto(2*i-1));
    end
    T_Moveto_du=sum(T_Moveto_du1);      %% The duration of Move towards   
else
    T_Moveto_num=0;
    T_Moveto_du=0;
end
Results(j,14:15)=[T_Moveto_num T_Moveto_du];

T_Agogential_sniffing_du1=[];
if ~isempty(T_Agogential_sniffing)  
    T_Agogential_sniffing_num=(length(T_Agogential_sniffing))/2;  %% the number of Agogential_sniffing
    for i=1:length(T_Agogential_sniffing)/2
        T_Agogential_sniffing_du1(i)=T_time(T_Agogential_sniffing(2*i))-T_time(T_Agogential_sniffing(2*i-1));
    end
    T_Agogential_sniffing_du=sum(T_Agogential_sniffing_du1);      %% The duration of Agogential_sniffing   
else
    T_Agogential_sniffing_num=0;
    T_Agogential_sniffing_du=0;
end
Results(j,16:17)=[T_Agogential_sniffing_num T_Agogential_sniffing_du];

T_Upright_posture_du1=[];
if ~isempty(T_Upright_posture)  
    T_Upright_posture_num=(length(T_Upright_posture))/2;  %% the number of Upright_posture
    for i=1:length(T_Upright_posture)/2
        T_Upright_posture_du1(i)=T_time(T_Upright_posture(2*i))-T_time(T_Upright_posture(2*i-1));
    end
    T_Upright_posture_du=sum(T_Upright_posture_du1);      %% The duration of Upright_posture   
else
    T_Upright_posture_num=0;
    T_Upright_posture_du=0;
end
Results(j,18:19)=[T_Upright_posture_num T_Upright_posture_du];

Results(j,20:21)=[T_Social_exploration_num+T_Moveto_num+T_Agogential_sniffing_num+T_Upright_posture_num  T_Social_exploration_du+T_Moveto_du+T_Agogential_sniffing_du+T_Upright_posture_du];  %�罻̽���������ܳ���ʱ��

if ~isempty(T_Rearing)  
    T_Rearing_num=length(T_Rearing);  %% the number of Rearing
else
    T_Rearing_num=0;
end
Results(j,22)=T_Rearing_num;

T_Non_social_exploration_du1=[];
if ~isempty(T_Non_social_exploration)  
    T_Non_social_exploration_num=(length(T_Non_social_exploration))/2;  %% the number of Non_social_exploration
    for k=1:length(T_Non_social_exploration)/2
        T_Non_social_exploration_du1(k)=T_time(T_Non_social_exploration(2*k))-T_time(T_Non_social_exploration(2*k-1));
    end
    T_Non_social_exploration_du=sum(T_Non_social_exploration_du1);      %% The duration of Non_social_exploration 
else
    T_Non_social_exploration_num=0;
    T_Non_social_exploration_du=0;
end
Results(j,23:24)=[T_Non_social_exploration_num T_Non_social_exploration_du];

T_Inactivity_du1=[];
if ~isempty(T_Inactivity)  
    T_Inactivity_num=(length(T_Inactivity))/2;  %% the number of Inactivity
    for i=1:length(T_Inactivity)/2
        T_Inactivity_du1(i)=T_time(T_Inactivity(2*i))-T_time(T_Inactivity(2*i-1));
    end
    T_Inactivity_du=sum(T_Inactivity_du1);      %% The duration of Inactivity   
else
    T_Inactivity_num=0;
    T_Inactivity_du=0;
end
Results(j,25:26)=[T_Inactivity_num T_Inactivity_du];

Results(j,27)=animal;

end

save RI_DRN_CeA_EYFP_������_818 Results;
