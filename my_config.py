USE_GPU = True
LOCAL_SAVE = r"C:\Users\joeli\Dropbox\TopResultlsOut"
RUN_LOCAL = True
IMAGE_FOLDER = None
ENCODER_PATH = None
DECODER_PATH = None
if RUN_LOCAL:
    # IMAGE_FOLDER = r"models_4k"
    IMAGE_FOLDER = r"C:\Users\joeli\Dropbox\AE_MC\AE_InputModels\test"
    # C:\Users\joeli\Dropbox\Code\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\decoder.h5
    DECODER_PATH = r"C:\Users\joeli\Dropbox\Code\AE_2023_06\TrainedModels\316\decoder.h5"
    ENCODER_PATH = r"C:\Users\joeli\Dropbox\Code\AE_2023_06\TrainedModels\316\encoder.h5"
    #"C:\Users\joeli\Dropbox\AE_MC\saved_ml_models\SmallBatchSize\decoder_19_05.h5"
    DECODER_PATH = r"C:\Users\joeli\Dropbox\Code\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\decoder.h5"
    ENCODER_PATH = r"C:\Users\joeli\Dropbox\Code\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\encoder.h5"
    # ENCODER_PATH = r"C:\Users\joeli\OneDrive\Desktop\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\encoder.h5"
    # DECODER_PATH = r"C:\Users\joeli\OneDrive\Desktop\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\decoder.h5"
    # "C:\Users\joeli\OneDrive\Desktop\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\no_duplicates_75_2_maskdecoder.h5"


else:
    IMAGE_FOLDER = r"models_4k"
    # ENCODER_PATH = r"/AE_2023_06/TrainedModels/316/encoder.h5"  
    # DECODER_PATH = r"/AE_2023_06/TrainedModels/316/decoder.h5"
    #TrainedModels\no_duplicates_75_2_mask\encoder.h5
    #TrainedModels/no_duplicates_75_2_mask/encoder.h5
    ENCODER_PATH = r"/AE_2023_06/TrainedModels/no_duplicates_75_2_mask/encoder.h5"
    DECODER_PATH = r"/AE_2023_06/TrainedModels/no_duplicates_75_2_mask/decoder.h5"
    
CMAP_SPECULAR = 'viridis'

def PLOT_TEX_MAPS(target, parameter_maps, WIDTH, HEIGHT, vertical_colorbar=True, original=True):
    labels = ["Original", "Cm", "Ch", "Bm", "Bh", "T"]
    name = "original_and_parameters.png"
    if not original:
        labels = ["Recovered", "Cm", "Ch", "Bm", "Bh", "T"]
        name = "recovered_and_parameters.png"
    # Clear all plots
    plt.close('all')

    # Calculate figure size based on the number of plots
    num_plots = 6
    figsize = (6 * num_plots, 6)
    fig = plt.figure(figsize=figsize)
    
    # Create a grid with 6 plots and a space for the colorbar
    if not vertical_colorbar:
        gs = GridSpec(2, 7, width_ratios=[1, 1, 1, 1, 1, 1, 0.04], height_ratios=[1, 0.08])  # Adjust the height and width ratios
    else:
        gs = GridSpec(1, 7, width_ratios=[1, 1, 1, 1, 1, 1, 0.1], height_ratios=[1])

    # Ensure that the parameter maps are reshaped
    parameter_maps = parameter_maps.reshape(-1, 5)

    # Find the low and high values
    lows = []
    highs = []
    for i in range(5):
        lows.append(np.min(parameter_maps[:, i]))
        highs.append(np.max(parameter_maps[:, i]))

    low = np.min(lows)
    high = np.max(highs)

    # Display the target
    ax0 = fig.add_subplot(gs[0, 0])
    ax0.imshow(target)
    ax0.axis('off')

    # Display each parameter map
    for i in range(5):
        #if high - low < threshold: increase contrast
        dif = high - low
        if dif < 0.7:
            print(f"increasing contrast for parameter map {i}")
            parameter_maps[:, i] = enhance_contrast(parameter_maps[:, i], 1.1).reshape(-1,)
        ax = fig.add_subplot(gs[0, i + 1])
        im = ax.imshow(parameter_maps[:, i].reshape(WIDTH, HEIGHT), cmap='binary', vmin=low, vmax=high)
        ax.axis('off')

    # Add the colorbar
    if vertical_colorbar:
        cbar_ax = fig.add_subplot(gs[0, 6])
        fig.colorbar(im, cax=cbar_ax, orientation='vertical', fraction=1)
    else:
        cbar_ax = fig.add_subplot(gs[1, :])
        fig.colorbar(im, cax=cbar_ax, orientation='horizontal', fraction=0.01, pad=0)

    # Adjust the size of the last image to match the others
    ax.set_aspect('equal')

    plt.subplots_adjust(wspace=0.0, hspace=0.0)
    plt.savefig(name, dpi=400, transparent=True, bbox_inches='tight', pad_inches=0)
    plt.show()