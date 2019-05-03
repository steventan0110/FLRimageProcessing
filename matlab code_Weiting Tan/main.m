close all
clear
clc

%load the data files
load('in10.mat');
load('in9.mat');
M = in9;

%show the contour and mesh image without any processing
figure (1)
contour(M);
figure (2)
mesh(M);

%fin the two max value position with this function
[x1,y1,x2,y2] = find_max(M);
