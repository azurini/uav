function [w,N_link]=display_environmental_quyu(v,dim,gg_t)

[x_t,y_t] = size(gg_t);

  dims = length(dim);

% 选择网格类型
if v==1
    pos = grid_top(dim);
elseif v==2
    pos = rand_top(dim);
elseif v==3
    pos = hex_top(dim);
end

M = max(pos,[],2);


% 筛选网格区域
a=find(pos(3,:)/M(3)>0.1 & pos(3,:)/M(3)<1); %hex的高度归一化参数7.3485

yy_t=y_t/(dim(2)-1);
xx_t=x_t/(dim(1)-1);

% % len=1;
% % pos(1,1) = 0;
% %   for i=1:length(dim)
% %     dimi = dim(i);
% %     newlen = len*dimi;
% %     pos(1:(i-1),1:newlen) = pos(1:(i-1),rem(0:(newlen-1),len)+1);
% %     posi = 0:(dimi-1);
% %     pos(i,1:newlen) = posi(floor((0:(newlen-1))/len)+1);
% %     len = newlen;
% %   end


gg_tt=ones(1,dim(1)*dim(2));


gg_tt(1)=gg_t(1,1);
for xlen=1:1:(dim(1)-1)
        gg_tt(xlen+1)=gg_t(ceil(xlen*xx_t),1);
end

for ylen=1:1:(dim(2)-1)
        gg_tt(ylen*dim(1)+1)=gg_t(1,ceil(ylen*yy_t));
end

for ylen=1:1:(dim(2)-1)
    for xlen=1:1:(dim(1)-1)

        llen=ylen*dim(1)+xlen+1;                                  %llen=12;
        gg_tt(llen)=gg_t(ceil(xlen*xx_t),ceil(ylen*yy_t));    %第一行报错
        
    end
end

% gg_tt(llen)=gg_t(ceil(xlen*xx_t),ceil(ylen*yy_t));

gggg_t=[gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt];
% gggg_t=[gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt gg_tt];

pos([1 2 3],:)=pos([2 1 3],:);

for i=1:1:dim(1)*dim(2)*dim(3)
    b_b(i)=pos(3,i)>(dim(3)*gggg_t(i)+2); %筛选地形以上的节点
end
b=find(b_b==1);

pos_ab=intersect(a,b);

% 自组织连接网格节点
% plot_som_V0_1(pos(:,a))
% plot_som_V1_1(pos(:,a),x_t,y_t)
N_link= plot_som_V1_2(pos(:,pos_ab));

% 归一化
w = pos(:,pos_ab)';
w(:,1)=w(:,1)*y_t/M(2);   % 10*10*10=1000个点的 固定参数
w(:,2)=w(:,2)*x_t/M(1);
w(:,3)=w(:,3)/M(3);

N_link(1,:)=N_link(1,:)*y_t/M(2);   % 10*10*10=1000个点的 固定参数
N_link(2,:)=N_link(2,:)*x_t/M(1);
N_link(3,:)=N_link(3,:)/M(3);
