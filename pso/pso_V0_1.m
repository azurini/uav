%%蜂群算法pso%%

%%------初始格式化-----------%%

clc;                                      %第一日，上帝说要有光，于是便有了光
clear all;                                %第二日，上帝说诸水之向要有空气隔开
format long;                              %第三日，上帝说普天之下的水要汇聚在一处，让旱地露出来
                                          %......

%%------初始化蜂群-----------%%

                                          %直到某日，上帝预感到人类自伐的命运，想引导人类走向救赎，便在世间降下了：
N=40;                                     %40个读者
D=10;                                     %上帝将查拉图斯特拉（至人）灵魂被分为D块碎片散落人间

for i=1:N                                 %上帝安排给每个 读者 寻找 查拉图斯特拉灵魂 的任务
    for j=1:D                             %每个读者自降生以来 皆背负着 七情六欲、喜怒哀乐
        x(i,j)=randn;                     %上帝告诉读者 “你将在旅途中遇见查拉图斯特拉的某种灵魂”
        v(i,j)=randn;                     %唯有当你体会到所有灵魂碎片时 便可找到真理 达到神的境界 成为至人
    end                                   %而查拉图斯特拉 作为神性的代理 却受到了神的诅咒 灵魂被拆散 无法重生于世
end                                       %安排完之后 人类宣称 上帝已死

%%------定义每只蜂的状态-----------%%

for i=1:N                                 %第一位 读者 从高处走来 去寻找查拉图斯特拉的灵魂
    p(i)=fitness(x(i,:),D);               %这时他在林中遇到一位老者，老者说 "上帝已死，没有道德和真理，没有人可以成为至人"
    y(i,:)=x(i,:);                        %第一位 读者 叹息道“可惜老者并不知道，我所追寻的并非是已死上帝的真理 我将要旅途中创造的是我自己啊”
end                                       %便坚定的继续向前走去

pg=x(1,:);                                %第一位 读者 告诉路边的尼采 尽管没有人可以成为上帝那样的人，但是我可以把我的经验告诉你，你负责记录每一个读者的人生 最终一定能复原至人的灵魂。

for i=2:N                                 %其后的每一位 读者 从高处走来 去寻找查拉图斯特拉的灵魂
    if fitness(x(i,:),D)<fitness(pg,D)    %读者们都深知自己无法得到真理的全貌，但是可以从自己的一生中获得经验
        pg=x(i,:);                        %每个读者都将自己的故事告诉路边的尼采
    end                                   %当尼采走出了森林
end                                       %他拿着所有读者的记忆，准备打破上帝的诅咒，复活查拉图斯特拉，创造完美的人

%%------蜂群搜索得出最优值---------%%

%尼采的本子上记载着复活 查拉图斯特拉 所需的：
w=0.7298;                                %本我
c1=1.4962;                               %自我
c2=1.4962;                               %超我
MaxDT=1000;                              %时间
eps=10^(-6);                             %理想

for t=1:MaxDT                            %新生的查拉图斯特拉睁开了双眼
    for i=1:N                            %此刻的他 既不是 读者 也不是 查拉图斯特拉
        v(i,:)=w*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));  %他在不断的否定着自己过去的经验
        x(i,:)=x(i,:)+v(i,:);            %每一刻都在创造着新的自己
        if fitness(x(i,:),D)<p(i)        %他说到 如果真理不是我所定义和创造的”
            p(i)=fitness(x(i,:),D);      %那么神所创造的 虚伪、无聊的真理 不要也罢”
            y(i,:)=x(i,:);               %“我就是我的真理”
        end                              %“任凭是神也无法撼动我的存在”
        if p(i)<fitness(pg,D)            %然而 查拉图斯特拉 并不知道 上帝并没有死
            pg=y(i,:);                   %而是借由尼采复活查拉图斯特拉之际 也复活了自己
        end                              %新生的查拉图斯特便是新的上帝
    end                                  %此刻的他 既是 上帝 也是 查拉图斯特拉
    Pbest(t)=fitness(pg,D);              %他掌握了人性的真实
end                                      %查拉图斯特拉闭上了双眼
                                         %一切又陷入了混沌



 


    