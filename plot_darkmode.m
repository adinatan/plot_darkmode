function  plot_darkmode(varargin)
% The function generates from a Matlab plot figure a version that can be
% copied to a dark mode theme presentation or website.
% The function replaces the default texts and boxes color to
% a user input color (default is white), make the plot area transparent
% and brighten plot line colors if there are too dim (set by the user)
%
% The function doesn't support tiledlayout at the moment.


%  Inputs:
%  varargin(1)- The text color to modify (default is white)
%  varargin(2)- The threshold from which to apply the brightness correction (default is <0.5)
%  varargin(3)- The Gamma factor that modifies the brightness (default is 0.5)
%
%   Example:
%
%       plot(bsxfun(@times,[1:4],[2:5]'));xlabel('X');ylabel('Y');
%       plot_darkmode
%
%  next copy the figure from the clipboard using Edit>Copy Figure and
%  paste it on top of the dark background theme, for example in
%  PowerPoint. Make sure that in the Copy Option, the  Transparent
%  Background is enabled


%   Ver 1 (2021-01-27)
%   Adi Natan (natan@stanford.edu)

%% defaults
switch nargin
    case 3
        textcolor=varargin(1);
        brightness_threshold=varargin(2);
        GammaFactor=varargin(3);
    case 2
        textcolor=varargin(1);
        brightness_threshold=varargin(2);
        GammaFactor=0.5;
    case 1
        textcolor=varargin(1);
        brightness_threshold=0.5;
        GammaFactor=0.5;
    otherwise
        textcolor=[1,1,1];
        brightness_threshold=0.5;
        GammaFactor=0.5;
end

brightness = @(color) 0.2989*color(1) + 0.5870*color(2) +0.1140*color(3);


g = get(get(gcf,'children'),'type');
h = get(gcf,'children');

axes_ind      =  find(strcmp(g,'axes'));
legend_ind    =  find(strcmp(g,'legend'));
colorbar_ind  =  find(strcmp(g,'colorbar'));
%tiled_ind     =  find(strcmp(g,'tiledlayout'));


%% modify Axes
for n=1:numel(axes_ind)
    
    % edit x-ticks color
    for m=1:numel(h(axes_ind(n)).XTickLabel)
        h(axes_ind(n)).XTickLabel{m} = ['\color[rgb]' sprintf('{%f,%f,%f}%s',textcolor)   h(axes_ind(n)).XTickLabel{m} ];
    end
    
    % edit y-ticks color
    for m=1:numel(h(axes_ind(n)).YTickLabel)
        h(axes_ind(n)).YTickLabel{m} = ['\color[rgb]' sprintf('{%f,%f,%f}%s',textcolor)   h(axes_ind(n)).YTickLabel{m} ];
    end
    
    h(axes_ind(n)).Color        = 'none';    % make white area transparent
    h(axes_ind(n)).XColor       = textcolor; % edit x axis color
    h(axes_ind(n)).YColor       = textcolor; % edit y axis color
    h(axes_ind(n)).ZColor       = textcolor; % edit z axis color
    
    h(axes_ind(n)).XLabel.Color = textcolor; % edit x label color
    h(axes_ind(n)).YLabel.Color = textcolor; % edit y label color
    h(axes_ind(n)).ZLabel.Color = textcolor; % edit z label color
    
    h(axes_ind(n)).Title.Color  = textcolor; % edit title text color
    
    % take care of other axes children:
    h2 = get(h(axes_ind(n)),'Children');
    g2 = get(h(axes_ind(n)).Children,'type');
    text_ind  = find(strcmp(g2,'text'));
    patch_ind = find(strcmp(g2,'patch'));
    line_ind  = find(strcmp(g2,'line'));
    
    % edit texts color
    for m=1:numel(text_ind)
        h2(text_ind(m)).Color=textcolor;
    end
    
    % brighten patch colors if dim (use for the case of arrows etc)
    % this might not work well for all patch types so consider to comment
    for m=1:numel(patch_ind)
        if brightness(h2(patch_ind(m)).FaceColor)<brightness_threshold &&...
                brightness(h2(patch_ind(m)).FaceColor)>0
            
            
            h2(patch_ind(m)).FaceColor=h2(patch_ind(m)).FaceColor.^GammaFactor;
            
        elseif brightness(h2(patch_ind(m)).FaceColor)<eps
            
            h2(patch_ind(m)).FaceColor = textcolor./2 ;
        end
        
        h2(patch_ind(m)).EdgeColor=textcolor;
        
    end
    
    % brighten line plot colors if dim
    for m=1:numel(line_ind)
        if brightness(h2(line_ind(m)).Color)<brightness_threshold &&...
                brightness(h2(line_ind(m)).Color)>0
            
            h2(line_ind(m)).Color=h2(line_ind(m)).Color.^GammaFactor;
            
            % special case if the line is black
        elseif brightness(h2(line_ind(m)).Color)<eps
            
            h2(line_ind(m)).Color= textcolor./2 ;
            
        end
    end
end

%% modify Colorbars:

for n=1:numel(colorbar_ind)
    h(colorbar_ind(n)).Color        =  textcolor;
    h(colorbar_ind(n)).Label.Color  =  textcolor;
end

%% modify Legends:

for n=1:numel(legend_ind)
    h(legend_ind(n)).Color     = 'none';     % make white area transparent
    h(legend_ind(n)).TextColor = textcolor;  % edit text color
    h(legend_ind(n)).Box       = 'off';      % delete box
end

%% modify annotations:

ha=findall(gcf,'Tag','scribeOverlay');
% get its children handles
if ~isempty(ha)
    for n=1:numel(ha)
        hAnnotChildren = get(ha(n),'Children');
        ga=get(get(ha(n),'Children'),'type');
        
        % edit textbox text colors
        textbox_ind=find(strcmp(ga,'textboxshape'));
        
        for m=1:numel(textbox_ind)
            hAnnotChildren(textbox_ind(m)).Color      =  textcolor;
            hAnnotChildren(textbox_ind(m)).EdgeColor  =  textcolor;
        end
        
        
        % if there are more types of annotations use the textbox section
        % as a template
        
    end
    
    
end
