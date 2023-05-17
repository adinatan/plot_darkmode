close all

tiledlayout('flow','TileSpacing','tight')
% Random Line Plot
x = 0:pi/100:2*pi;
y1 = sin(x);
y2 = sin(x-0.25);
y3 = sin(x-0.5);
nexttile
plot(x,y1,x,y2,'--',x,y3,':',LineWidth=2)
title('Line Plot');
 plot_darkmode;
 
% Scatter Plot
x = linspace(0,10,75);
y = x + (rand(size(x)) - 0.5) * 5;
colorVector = parula(numel(x));
distFromXY = abs(y - x);
[ySort, sortIdx] = sort(distFromXY);
colorVector(sortIdx,:) = colorVector;
nexttile
scatter(x,y,40,colorVector,"filled",'o');  
title("Scatter Plot")
xlabel('x')
ylabel('y')
 plot_darkmode;

% Histogram
data = randn(1, 1000);
nexttile;
histogram(data);
title('Histogram');
xlabel('Data');
ylabel('Frequency');
 plot_darkmode;

% Histogram 2D
nexttile;
h = histogram2(randn(1000,1),randn(1000,1),[12 12],'FaceColor','flat');
colorbar
title('Histogram 2D');
xlabel('Data');
ylabel('Frequency');
 plot_darkmode

% Pie Chart
labels = {'Category 1', 'Category 2', 'Category 3'};
values = [30, 40, 20];
nexttile;
pie(values, labels);
title('Pie Chart');
 plot_darkmode;
 
% Area Plot
x = 0:0.1:2*pi;
y1 = sin(x);
y2 = cos(x);
nexttile;
fill([x, fliplr(x)], [y1, zeros(size(y1))], 'r');
hold on;
fill([x, fliplr(x)], [y2, zeros(size(y2))], 'b');
title('Area Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;

% Box chart Plot
nexttile;
data = [randn(100, 1), randn(100, 1) + 2];
boxchart(data)
title('Box Chart Plot');
xlabel('Groups');
ylabel('Data');
 plot_darkmode

 % Polar hist Plot
nexttile;
theta = atan2(rand(100000,1)-0.5,2*(rand(100000,1)-0.5));
polarhistogram(theta,50);
title('Polar histogram');
 plot_darkmode;

% Polar Plot
theta = linspace(0, 2*pi, 100);
rho = abs(sin(2*theta));
nexttile;
polarplot(theta, rho,'LineWidth',2);
title('Polar Plot');
plot_darkmode;

% Contour Plot
nexttile;
contour(peaks(100));
title('Contour Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;
 
% Contourslice Plot
[X,Y,Z] = meshgrid(-5:0.05:5);
V = X.*exp(-X.^2-Y.^2-Z.^2);

[xsurf,ysurf] = meshgrid(-2:0.05:2);
zsurf = xsurf.^2-ysurf.^2;
nexttile
contourslice(X,Y,Z,V,xsurf,ysurf,zsurf,20)
view(3)
grid on

title('ContourSlice Plot');
xlabel('X');
ylabel('Y');
ylabel('Z');
 plot_darkmode


% Surf Plot (Peaks)
[x, y] = meshgrid(-3:.1:3);
z = peaks(x, y);
nexttile;
surf(x, y, z);
title('Surf Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;

% Mesh Chart
nexttile
[X,Y] = meshgrid(-8:.5:8);
R = sqrt(X.^2 + Y.^2) + eps;
Z = sin(R)./R;
mesh(X,Y,Z)
title('Mesh Plot');
xlabel('X');
ylabel('Y');
zlabel('Z');
 plot_darkmode;


% Pcolor Chart
nexttile
[X,Y] = meshgrid(-3:6/17:3);
XX = 2*X.*Y;
YY = X.^2 - Y.^2;
colorscale = [1:18; 18:-1:1];
C = repmat(colorscale,9,1);
pcolor(XX,YY,C);
xlabel('X');
ylabel('Y');
plot_darkmode;
title('Pcolor Chart');
 
plot_darkmode;


% Quiver Plot
[x, y] = meshgrid(-2:.2:2, -2:.2:2);
u = cos(x) .* y;
v = sin(x) .* y;
nexttile;
quiver(x, y, u, v);
title('Quiver Plot');
xlabel('X');
ylabel('Y');
 plot_darkmode;
