# plot_darkmode
convert a regular matlab plot to fit a dark mode theme background


The function generates from a Matlab plot figure a version that can be copied to a dark mode theme presentation or website.
The function replaces the default texts and boxes color to % a user input color (default is white), make the plot area transparent
and brighten plot line colors if there are too dim (set by the user). The function doesn't support tiledlayout at the moment.

Example:

After creating a Matlab figure of some kind using plot, subplot, imagesc and so forth, apply the function plot_darkmode.

Next copy the figure from the clipboard using *Edit>Copy Figure* and paste it on top of the dark background theme, for example in PowerPoint.
Make sure that in the Copy Option, the  *Transparent Background* is enabled.
