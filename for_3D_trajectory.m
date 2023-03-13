%构建对象
h1 = animatedline('MaximumNumPoints',100);
h2 = animatedline('MaximumNumPoints',100);
axis([0,6*pi,-3,4,-3,4])
view(30,10);              %指定图形视点 
axis off                   %取消坐标轴  

%轨迹矩阵
x2 = linspace(0,4*pi,1000)+5;
y2 = sin(x2)+1;
z2 = sin(x2)+1;

x1 = linspace(0,4*pi,1000);
y1 = sin(x1);
z1 = sin(x1);

%展示
for k = 1:length(x1)
    addpoints(h1,x1(k),y1(k),z1(k));
    addpoints(h2,x2(k),y2(k),z2(k));
    drawnow
end
