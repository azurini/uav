clear

addpath(genpath('./image'));
addpath(genpath('./pso'));
addpath(genpath('./som'));

uav = 23;     % 无人机数量
% L = 216000;     % 轨迹步长
% L = 1000;     % 轨迹步长

D = 3;       % 约束条件个数 （解空间）

%% 构建环境
 
display_environmental      %构建环境


%% 初始化无人机数量和初始状态

[x_m,v_m] = creat_2_random_matrix(uav,D);

% 初始化PSO参数
max_iter = 1000;

w_ego=0.3;
c1=0.2;
c2=0.2;
MaxDT=1000;
eps=10^(-6);

% 初始化自适应控制参数
K1 = 8;
K2 = 5;
K3 = 5;
max_time = 10;


figure

N=uav;x=x_m;v=x_m;

% 生成一个随机的目标点
    target = rand(1, 3) * 5000;
        
    plot3(target(1),target(2),target(3),'*r');
%   hold on

pos=pos_o;

% 计算无人机群体的相互作用力
    sep = separation(pos);  % 分离力
    ali = alignment(vel);   % 对齐力
    coh = cohesion(pos);    % 凝聚力



%%------定义每只蜂的状态-----------%%

for i=1:N                                 %第一位 读者 从高处走来 去寻找查拉图斯特拉的灵魂
    p(i)=fitness4(x(i,:),D,w(i,:));               %这时他在林中遇到一位老者，老者说 "上帝已死，没有道德和真理，没有人可以成为至人"
    y(i,:)=x(i,:);                        %第一位 读者 叹息道“可惜老者并不知道，我所追寻的并非是已死上帝的真理 我将要旅途中创造的是我自己啊”
end                                       %便坚定的继续向前走去

pg=x(1,:);                                %第一位 读者 告诉路边的尼采 尽管没有人可以成为上帝那样的人，但是我可以把我的经验告诉你，你负责记录每一个读者的人生 最终一定能复原至人的灵魂。

for i=2:N                                 %其后的每一位 读者 从高处走来 去寻找查拉图斯特拉的灵魂
    if fitness4(x(i,:),D,w(i,:))<fitness4(pg,D,w(i,:))    %读者们都深知自己无法得到真理的全貌，但是可以从自己的一生中获得经验
        pg=x(i,:);                        %每个读者都将自己的故事告诉路边的尼采
    end                                   %当尼采走出了森林
end                                       %他拿着所有读者的记忆，准备打破上帝的诅咒，复活查拉图斯特拉，创造完美的人

%%------蜂群搜索得出最优值---------%%

for t=1:MaxDT                            %新生的查拉图斯特拉睁开了双眼
    for i=1:N                            %此刻的他 既不是 读者 也不是 查拉图斯特拉
        v(i,:)=w_ego*v(i,:)+c1*rand*(y(i,:)-x(i,:))+c2*rand*(pg-x(i,:));  %他在不断的否定着自己过去的经验
        x(i,:)=x(i,:)+v(i,:);            %每一刻都在创造着新的自己
        if fitness4(x(i,:),D,w(i,:))<p(i)        %他说到 如果真理不是我所定义和创造的"
            p(i)=fitness4(x(i,:),D,w(i,:));      %那么神所创造的 虚伪、无聊的真理 不要也罢"
            y(i,:)=x(i,:);               %“我就是我的真理”
        end                              %“任凭是神也无法撼动我的存在”
        if p(i)<fitness4(pg,D,w(i,:))            %然而 查拉图斯特拉 并不知道 上帝并没有死
            pg=y(i,:);                   %而是借由尼采复活查拉图斯特拉之际 也复活了自己
        end                              %新生的查拉图斯特便是新的上帝

        story(i,:)=pg;                   %故事流传于世

    end                                  %此刻的他 既是 上帝 也是 查拉图斯特拉
    Pbest(t)=fitness4(pg,D,w(i,:));              %他掌握了人性的真实
    book{t}=story;                       %文明汇聚成册

    % 显示当前迭代次数和全局最优值
%     fprintf('Iteration %d, Global best value = %.4f\n', t, min(pg));

    % 绘制无人机位置
    scatter3(x(:, 1), x(:, 2), x(:, 3), 'filled');
%     plot3(x(:, 1), x(:, 2), x(:, 3), 'o')

    hold on
    view(5,77);                 % 指定图形视点 
    axis off                    % 取消坐标轴 
    mesh(X_t,Y_t,gg_t);               % 网格上画出图像

    drawnow

    hold off

end                                      %查拉图斯特拉闭上了双眼
                                         %一切又陷入了混沌
%plot(Pbest);

hold on
plot3(N_link(1,:),N_link(2,:),N_link(3,:),'c',w(:,1),w(:,2),w(:,3),'.g','markersize',15)
% plot3(w(:,1),w(:,2),w(:,3),'.c','markersize',15)


% Plot 基地
% display_environmental_base


% % 统一坐标系单位向量
% numLines=1;
% 
% if numLines
%   axis('equal')
% end

% 设置展示角度
view(5,77);                 % 指定图形视点 
axis off                    % 取消坐标轴 

% 展示无人机轨迹

plot3(x_m(:,1),x_m(:,2),x_m(:,3),'ob','markersize',5)        %初始位置

% 生成无人机 %% 构建对象
% h=build_object(uav,L);
% 
% illustrate(uav,book,h);

xxxx=book{1,216000};

xxxx(:,3)=0.95;

plot3(xxxx(:,1),xxxx(:,2),xxxx(:,3),'or','markersize',5)     %结束位置

figure

plot(Pbest)
