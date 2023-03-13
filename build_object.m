function h = build_object(x,L)

% x 无人机数量
% L 无人机显示尾迹长度

% 配色
str_color = ['r','g','b','c','m','y',"#0072BD","#D95319","#EDB120","#7E2F8E","#77AC30","#4DBEEE","#A2142F"];

for i=1:1:x
    
    h{1,i} = animatedline('MaximumNumPoints',L,'Color',str_color(mod(i,12)+1));

end


