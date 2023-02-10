function illustrate(n,book,h)

for j=1:1:n
    for i=1:1:length(book)
        x_i(j,i)=book{1,i}(j,1);
        y_i(j,i)=book{1,i}(j,2); 
        z_i(j,i)=book{1,i}(j,3);
    end
end


for k = 1:length(book)

    for j=1:1:n
        addpoints(h{1,j},x_i(j,k),y_i(j,k),z_i(j,k));
    end
    
    drawnow

end
