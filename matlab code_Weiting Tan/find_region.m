function [x1,y1,x2,y2,x3,y3] = find_region(M)
%get dimensions:
M_size = size(M);
row = M_size(1);
col = M_size(2);

max = 0;
max_loc = [1,1];

%iterate through to find the sum of the 9 points in the region
for i = 2: (row-1)
    for j = 2:(col-1)
        sum = M(i,j) + M(i,j-1) + M(i,j+1) + M(i-1,j)+ M(i-1,j-1)+ M(i-1,j+1)+ M(i+1,j) + M(i+1,j-1)+ M(i+1,j+1);
        sum = sum/9;
        if sum > max
            max_loc = [i,j];
            max = sum;
        end
    end
end

%now we locate the maximum region, I use its index +- 1/4 of the image size
%as limitation to find another maximum region as well as minimum region
x1 = max_loc(1,1);
y1 = max_loc(1,2);
min = 100;
min_loc = [];
max2 = 0;
max2_loc = [];

for i = (x1 - row/4):(x1 + row/4)
    for j = (y1 - col/4): (y1 + col/4)
        sum_new = M(i,j) + M(i,j-1) + M(i,j+1) + M(i-1,j)+ M(i-1,j-1)+ M(i-1,j+1)+ M(i+1,j) + M(i+1,j-1)+ M(i+1,j+1);
        sum_new = sum_new/9;
        if ((sum_new > max2) && ((i ~= x1)||(j~=y1))&&(j+y1>=col))
            max2 = sum_new;
            max2_loc = [i,j];
        end 
        if min > sum_new
            min = sum_new;
            min_loc = [i, j];
        end
    end
end 
x2 = max2_loc(1,1); 
y2 = max2_loc(1,2);
x3 = min_loc(1,1);
y3 = min_loc(1,2);


        

         
        

