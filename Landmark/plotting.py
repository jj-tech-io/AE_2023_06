# import  load modules
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.gridspec import GridSpec
import cv2
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.gridspec import GridSpec

import matplotlib.pyplot as plt
import numpy as np
from matplotlib.gridspec import GridSpec

def PLOT_TEX_MAPS(target, parameter_maps, title=None, save = False, text_below = None,NUM_CHANNELS = 5):

    plt.rcParams.update({'font.size': 10})
    #dark background
    plt.style.use('dark_background')
    #no grid
    plt.rcParams['axes.grid'] = False
    WIDTH, HEIGHT = target.shape[:2]
    if parameter_maps.ndim == 2 and parameter_maps.shape[1] == NUM_CHANNELS:
        WIDTH = int(np.sqrt(parameter_maps.shape[0]))
        HEIGHT = WIDTH
        parameter_maps = parameter_maps.reshape(WIDTH, HEIGHT, NUM_CHANNELS)

    elif parameter_maps.ndim == 3 and parameter_maps.shape[2] == NUM_CHANNELS:
        WIDTH, HEIGHT = parameter_maps.shape[:2]
        parameter_maps = parameter_maps.reshape(WIDTH, HEIGHT, NUM_CHANNELS)
    else:
        raise ValueError("Parameter maps must be of shape (N, 5) or (W, H, 5).")

    labels = ["Original", "Cm", "Ch", "Bm", "Bh", "T"]
    name = f"tex_maps_{title}.png" if title else "tex_maps.png"
    
    plt.close('all')
    num_plots = 6
    figsize = (24, NUM_CHANNELS)
    fig = plt.figure(figsize=figsize)
    width_ratios = [1]
    for i in range(NUM_CHANNELS):
        width_ratios.append(1)
        width_ratios.append(0.01)
    gs = GridSpec(1, len(width_ratios), width_ratios=width_ratios, wspace=0.3)
    # Display the original/target image
    ax0 = fig.add_subplot(gs[0, 0])
    target.reshape(WIDTH, HEIGHT, 3)
    ax0.imshow(target)
    ax0.axis('off')
    ax0.set_title(labels[0])

    for i in range(NUM_CHANNELS):
        ax = fig.add_subplot(gs[0, 2*i+1])  # Plotting maps
        im = ax.imshow(parameter_maps[:, :, i], cmap='viridis')
        ax.axis('off')
        ax.set_title(labels[i+1])

        # Determine the position for the color bar axis
        map_pos = ax.get_position()
        # Adjust the color bar width here (the third value in the list)
        cbar_width = 0.01  # Set this to your desired width
        cbar_pos = [map_pos.x1, map_pos.y0, cbar_width, map_pos.height]

        # Add colorbar for each parameter map, manually setting the position to match map
        cbar_ax = fig.add_axes(cbar_pos)
        cbar = fig.colorbar(im, cax=cbar_ax, orientation='vertical',pad=0.15)
        #remove outline from colorbar
        cbar.outline.set_visible(False)
    plt.subplots_adjust(wspace=0.4,hspace=0.0)
    plt.suptitle(title, fontsize=16)
    #add text below  plots
    if text_below is not None:
        # plt.figtext(0.5, 0.01, text_below, wrap=True, horizontalalignment='center', fontsize=12)
        #lower!!
        plt.figtext(0.5, 0.01, text_below, wrap=True, horizontalalignment='center',  verticalalignment='bottom', fontsize=10)
        # plt.figtext( arg names )
    plt.savefig(name, dpi=600, transparent=True, bbox_inches='tight')
    plt.show()
