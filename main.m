%% 基础设置

clear

addpath(genpath('./image'));
addpath(genpath('./pso'));
addpath(genpath('./som'));

uav = 50;     % 无人机数量
L = 200000;     % 轨迹步长

D = 3;       % 约束条件个数 （解空间）

%% 构建环境
 
display_environmental      %构建环境


%% 轨迹矩阵

% matrix_of_trajectory;
% [x_m,v_m] = get_random_matrix(uav,D);
[x_m,v_m] = creat_1_random_matrix(uav,D);


% 粒子群优化
% book = pso_V1_1(uav,D,x_m,v_m);
% [book,Pbest] = pso_V1_2(uav,D,x_m,v_m,w);
% [book,Pbest] = pso_V1_3(uav,D,x_m,v_m,w);
% [book,Pbest] = pso_V1_4(uav,D,x_m,v_m,w);
[book,Pbest] = pso_V1_5(uav,D,x_m,v_m,w);


%% 展示

figure

hold on

%surf(X_t,Y_t,gg_t);               % 平面上画出图像
mesh(X_t,Y_t,gg_t);               % 网格上画出图像

% colormap gray               % 设为灰阶图像

% Plot 自组织节点
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
view(5,77);               % 指定图形视点 
axis off                    % 取消坐标轴 

% 展示无人机轨迹

plot3(x_m(:,1),x_m(:,2),x_m(:,3),'ob','markersize',5)

%生成无人机 %% 构建对象
h=build_object(uav,L);

illustrate(uav,book,h);

xxxx=book{1,216000};

xxxx(:,3)=0.95;

plot3(xxxx(:,1),xxxx(:,2),xxxx(:,3),'or','markersize',5)

figure

plot(Pbest)
