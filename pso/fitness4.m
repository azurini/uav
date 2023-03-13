function result=fitness4(x,D,w)
% 适应度函数源程序（fitness.m）

% 需要求解的解空间 任务目标 机械限制 
% 任务目标：打击目标 运送模块 —————————— 模块化实现平台
% 机械限制：避障 电池补充 自组织网络


sum=0;

for i=1:1:(D-1)

    sum=sum+(x(i)-w(i)).^2;

end

result=sum;