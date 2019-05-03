function [x1,y1] = find_min(M)

%first, limit the region to the local around eyes 
m = M(50:90, 100:150);
figure(3)
contour(m, [87:0.5:88]);

size_m =size(m);
row = size_m(1,1);
col = size_m(1,2);

num = 201;
low = 86;
while num > 100
    for i = 1:row
        for j = 1:col
            if m(i,j) <= low || m(i,j) >= 88
                %delete these out of interest point
                m(i,j) = 0;
            end
        end
    end
    im = m>0;
    num = sum(im(:));
    low = low+0.2;
end

size_m = size(im);

%now we need to separate out the two regions:
x_im=[];
y_im =[];
%we first find the first maximum
for i = 2:size_m(1,1)-1
    for j = 2:size_m(1,2)-1
        sum_im = im(i,j) + im(i,j-1) + im(i,j+1) + im(i-1,j)+ im(i-1,j-1)+ im(i-1,j+1)+ im(i+1,j) + im(i+1,j-1)+ im(i+1,j+1);
        if sum_im >=5
            x_im = [x_im,i];
            y_im = [y_im,j]; 
        end
    end
end
range = max(x_im) - min(x_im);
x1 = mean(x_im) + range/2 + 50;
y1 = mean(y_im) + 100;




            





