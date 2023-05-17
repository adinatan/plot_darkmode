close all
% Random Line Plot
x = 0:pi/100:2*pi;
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);

plot(x,y1,x,y2,'--',x,y3,':',LineWidth=2)
title('Random Line Plot');
 plot_darkmode;

% Stairs Plot
X = linspace(0,4*pi,50)';
Y = [0.5*cos(X), 2*cos(X)];
figure
stairs(Y)
title('Stairs Plot',LineWidth=2);
 plot_darkmode;

% Errorbar Plot
x = 1:5;
y = [5, 8, 3, 6, 2];
err = [0.5, 0.7, 0.3, 0.9, 0.2];
figure;
errorbar(x, y, err);
title('Errorbar Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;

% Bar Plot
x = 1:5;
y = [5, 8, 3, 6, 2];
figure;
bar(x, y);
title('Bar Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;


% 3D Bar Plot
figure;
z = sort(rand(4),2);
bar3(z)
title('3D Bar Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;


 plot_darkmode;
% Scatter Plot
x = rand(1, 50);
y = rand(1, 50);
figure;
scatter(x, y);
title('Scatter Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;

% Histogram
data = randn(1, 1000);
figure;
histogram(data);
title('Histogram');
xlabel('Data');
ylabel('Frequency');
 plot_darkmode;

% Histogram 2D
figure;
h = histogram2(randn(1000,1),randn(1000,1),[12 12],'FaceColor','flat');
colorbar
title('Histogram');
xlabel('Data');
ylabel('Frequency');
 plot_darkmode

% Pie Chart
labels = {'Category 1', 'Category 2', 'Category 3'};
values = [30, 40, 20];
figure;
pie(values, labels);
title('Pie Chart');
 plot_darkmode;

% Area Plot
x = 0:0.1:2*pi;
y1 = sin(x);
y2 = cos(x);
figure;
fill([x, fliplr(x)], [y1, zeros(size(y1))], 'r');
hold on;
fill([x, fliplr(x)], [y2, zeros(size(y2))], 'b');
title('Area Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;

% Box chart Plot
figure;
data = [randn(100, 1), randn(100, 1) + 2];
boxchart(data)
title('Box Chart Plot');
xlabel('Groups');
ylabel('Data');
 plot_darkmode

% Polar Plot
theta = linspace(0, 2*pi, 100);
rho = abs(sin(2*theta));
figure;
polarplot(theta, rho);
title('Polar Plot');
 plot_darkmode;

% Contour Plot
x = linspace(-2, 2, 100);  plot_darkmode
y = linspace(-2, 2, 100);
[X, Y] = meshgrid(x, y);
Z = X.*exp(-X.^2 - Y.^2);
figure;
contour(X, Y, Z);
title('Contour Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;


% Contourf Plot
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);
[X, Y] = meshgrid(x, y);
Z = X.^2 + Y.^2;
figure;
contourf(X, Y, Z);
title('Contourf Plot');
xlabel('X');
ylabel('Y');
colorbar;
 plot_darkmode;

% Contourslice Plot
[X,Y,Z] = meshgrid(-5:0.05:5);
V = X.*exp(-X.^2-Y.^2-Z.^2);

[xsurf,ysurf] = meshgrid(-2:0.05:2);
zsurf = xsurf.^2-ysurf.^2;
figure
contourslice(X,Y,Z,V,xsurf,ysurf,zsurf,20)
view(3)
grid on

title('ContourSlice Plot');
xlabel('X');
ylabel('Y');
ylabel('Z');
 plot_darkmode

% Contour3 Plot
x = linspace(-2, 2, 100);
y = linspace(-2, 2, 100);
[X, Y] = meshgrid(x, y);
Z = X.^2 + Y.^2;
figure;
contour3(X, Y, Z);
title('Contour3 Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;

% Surf Plot (Peaks)
[x, y] = meshgrid(-3:.1:3);
z = peaks(x, y);
figure;
surf(x, y, z);
title('Surf Plot (Peaks)');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;


% Waterfall Chart
[X,Y] = meshgrid(-3:.125:3);
Z = peaks(X,Y);
waterfall(X,Y,Z)
title('Waterfall Chart');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;


% Quiver Plot
[x, y] = meshgrid(-2:.2:2, -2:.2:2);
u = cos(x) .* y;
v = sin(x) .* y;
figure;
quiver(x, y, u, v);
title('Quiver Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;


% Stem Plot
x = 0:0.1:2*pi;
y = sin(x);
figure;
stem(x, y);
title('Stem Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;

% Stem3 Plot
x = 1:10;
y = rand(1, 10);
z = rand(1, 10);
figure;
stem3(x, y, z);
title('Stem3 Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;