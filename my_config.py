USE_GPU = True
LOCAL_SAVE = r"C:\Users\joeli\Dropbox\TopResultlsOut"
RUN_LOCAL = False
IMAGE_FOLDER = None
ENCODER_PATH = None
DECODER_PATH = None
if RUN_LOCAL:
    IMAGE_FOLDER = r"models_4k"
    ENCODER_PATH = "TrainedModels\316\encoder.h5"
    DECODER_PATH = "TrainedModels\316\decoder.h5"
else:
    IMAGE_FOLDER = r"models_4k"
    ENCODER_PATH = r"/AE_2023_06/TrainedModels/316/encoder.h5"  
    DECODER_PATH = r"/AE_2023_06/TrainedModels/316/decoder.h5"

CMAP_SPECULAR = 'viridis'

