% 添加 基地环境

%% demo.jpg  （山地——通道）
% 基地
plot3(122,92,0.3,'v','Color','r','MarkerSize',10,'MarkerFaceColor','#FFFFD9')
plot3(22,158,0.6,'v','Color','b','MarkerSize',10,'MarkerFaceColor','#D9FFFF')

% 地标 环境

% 电磁 环境
[Xsp,Ysp,Zsp] = sphere;

plot3(134,92,0.560784,'x','Color','r','MarkerSize',10)
plot3(38,156,0.752941,'x','Color','b','MarkerSize',10)

mesh(Xsp*30+134,Ysp*30+92,Zsp*0.3+0.560784,"EdgeColor","r")
hidden off
mesh(Xsp*30+38,Ysp*30+156,Zsp*0.3+0.752941,"EdgeColor","b")
hidden off

% 