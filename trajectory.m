%构建对象
h1 = animatedline('MaximumNumPoints',100);
h2 = animatedline('MaximumNumPoints',100);
axis([0,4*pi,-1,1])


%轨迹矩阵
x2 = linspace(0,4*pi,1000)+5;
y2 = sin(x2)+1;

x1 = linspace(0,4*pi,1000);
y1 = sin(x1);

%展示
for k = 1:length(x)
    addpoints(h1,x1(k),y1(k));
    addpoints(h2,x2(k),y2(k));
    drawnow
end
