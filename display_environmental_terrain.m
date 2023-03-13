% 添加 地理环境

% 获取灰度图
% https://github.com/tangrams/heightmapper
% https://tangrams.github.io/heightmapper/

% p_t = imread('demo.jpg');     % 获取地形图（山地——通道）   67
% p_t = imread('MyManualPrint_1.jpg');     % 获取地形图 (海岛——台湾)   
% p_t = imread('global_heightmap_512.png');     % 获取地形图（全球）
p_t = imread(['demo.png']);     % 获取地形图（曲线地形）    291
% p_t = imread(['demo2.png']);     % 获取地形图（城市——吃鸡——精度低）
% p_t = imread(['demo3.png']);     % 获取地形图（山地——精度中）
% p_t = imread('tw.png');     % 获取地形图 (海岛——台湾——精度中)
% p_t = imread('tw2.png');     % 获取地形图 (海岛——台湾——精度中)
% p_t = imread('taibei.png');     % 获取地形图 (海岛——台北市——精度中)
% p_t = imread('台北-h-0-300.png');     % 获取地形图 (海岛——台北市——精度中)
% p_t = imread('taibei (1).png');     % 获取地形图 (海岛——台北市——精度高)
% p_t = imread('longquan_Mountain.png');     % 获取地形图 (山地——龙泉山脉——精度中)
% p_t = imread('Loess_Plateau.png');     % 获取地形图 (山地——黄土高原——精度中)

g_t = rgb2gray(p_t);            % 转为灰阶图
gg_t = double(g_t);             % 转为数值矩阵
gg_t = 1-gg_t/255;              % 将彩色值转为 0-1 的渐变值
gg_t = 1-gg_t;

gg_t=flipud(gg_t);              % 上下翻转 后

[x_t,y_t] = size(gg_t);           % 取原图大小
[X_t,Y_t] = meshgrid(1:y_t,1:x_t);  % 以原图大小构建网格

%surf(X_t,Y_t,gg_t);               % 平面上画出图像
%mesh(X_t,Y_t,gg_t);               % 网格上画出图像

% colormap gray               % 设为灰阶图像


