USE_GPU = True
LOCAL_SAVE = r"C:\Users\joeli\Dropbox\TopResultlsOut"
RUN_LOCAL = True
IMAGE_FOLDER = None
ENCODER_PATH = None
DECODER_PATH = None
if RUN_LOCAL:
    IMAGE_FOLDER = r"models_4k"
    ENCODER_PATH = r"C:\Users\joeli\OneDrive\Desktop\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\encoder.h5"
    DECODER_PATH = r"C:\Users\joeli\OneDrive\Desktop\AE_2023_06\TrainedModels\no_duplicates_75_2_mask\decoder.h5"
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

