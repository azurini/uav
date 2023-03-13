% 适应度函数源程序（fitness.m）

% 需要求解的解空间 任务目标 机械限制 
% 任务目标：打击目标 运送模块 —————————— 模块化实现平台
% 机械限制：避障 电池补充 自组织网络

% function result=fitness(x,D)
% 
% sum=0;
%  
% for i=1:D
% 
%     sum=sum+x(i)^2;
% 
% end
% 
% result=sum;

function result=fitness(x,D)

sum=0;
 
for i=1:D

    sum=sum+x(i)^2;

end

result=sum;