import tensorflow as tf
from tensorflow.python.keras import layers
from tensorflow.python.keras.layers import Dense, Flatten, Input
from tensorflow.python.keras.models import Model, Sequential, load_model, save_model
from tensorflow.python.keras.callbacks import ModelCheckpoint, EarlyStopping, ReduceLROnPlateau, LambdaCallback
import matplotlib.pyplot as plt
from matplotlib import gridspec
import numpy as np
import cv2
import csv
import pandas as pd
from sklearn.model_selection import train_test_split
import PIL.Image as Image
import matplotlib as mpl
import matplotlib.pyplot as plt
import matplotlib.cm as cm
from mpl_toolkits.axes_grid1 import make_axes_locatable
import time
from tensorflow.python.keras.optimizers import adam_v2 as Adam
from tensorflow.python.keras.layers import Input, Dense
from tensorflow.python.keras.models import Model
import tensorflow.python.keras.backend as K
#clear_session()
from tensorflow.python.client import device_lib
import os 
import datetime
# from tensorflow.keras.layers import Lambda, BatchNormalization
# from tensorflow.python.client import device_lib
import colorspacious
from datetime import datetime
from time import time
CMAP_SPECULAR = 'viridis'
