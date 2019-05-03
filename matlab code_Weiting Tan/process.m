M = in10;
M_size = size(M);
row = M_size(1);
col = M_size(2);

%find the maximum and minimun value of the image, get a rough idea of the
%imgae
max = M(1,1);
max_loc = [1,1];
min = M(1,1);
min_loc = [1,1];
for i = 1: row
    for j = 1: col
        if M(i,j) > max
            max = M(i,j);
            max_loc = [i,j];
        end
        if M(i,j) < min
            min = M(i,j);
            min_loc = [i,j];
        end
    end 
end
fprintf('the maximum value %d locates at %i, %i\n', max, max_loc(1,1), max_loc(1,2));
fprintf('the minimum value %d locates at %i, %i\n', min, min_loc(1,1), min_loc(1,2));


%apply filters to the image to find maximum region and mimimun region:
[x1, y1, x2, y2, x3, y3] = find_region(M);
fprintf('the maximum region1 locates around %i, %i\n',x1,y1);
fprintf('the maximum region2 locates around %i, %i\n',x2,y2);
fprintf('the minimum region locates around %i, %i\n',x3,y3);
   