function [x1,y1,x2,y2] = find_max(M)

%first, limit the region to the local around eyes 
m = M(20:80, 75:175);
figure(3)
contour(m, [97:0.5:98]);

size_m =size(m);
row = size_m(1,1);
col = size_m(1,2);

num = 201;
low = 96;
while num > 100
    for i = 1:row
        for j = 1:col
            if m(i,j) <= low || m(i,j) >= 98
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
x1 = mean(x_im) + 20;
x2 = x1;

range  = max(y_im) - min(y_im);
y1 = min(y_im) + range/4 +75;
y2 = max(y_im) - range/4 + 75;



            





