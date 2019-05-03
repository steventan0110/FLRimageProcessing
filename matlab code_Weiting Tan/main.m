close all
clear
clc

%load the data files
load('in10.mat');
load('in9.mat');
M = in10;

%show the contour and mesh image without any processing
figure (1)
contour(M);
figure (2)
mesh(M);

%fin the two max value position with this function
[y1,x1,y2,x2] = find_max(M);
[y3,x3] = find_min(M);