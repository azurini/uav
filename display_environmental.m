% 构建环境
%  clf
%  clear
%  figure(3)
% hold on

% 地理
display_environmental_terrain

% 基地
% display_environmental_base

% 区域
[w,N_link]=display_environmental_quyu(1,[10 10 10],gg_t);

% hold off

% % 归一化
% numLines=1;
% 
% if numLines
%   axis('equal')
% end