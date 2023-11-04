import cv2
import numpy as np
from sklearn.mixture import GaussianMixture
from scipy.stats import multivariate_normal
from scipy.spatial import cKDTree
def convert_to_YCbCr(image):
    return cv2.cvtColor(image, cv2.COLOR_BGR2YCrCb)

def initial_shadow_detection(Y_channel, threshold_T):
    # Initial shadow detection based on brightness threshold
    shadow_mask = Y_channel < threshold_T
    return shadow_mask

def update_gaussian_model(gmm, pixel, is_shadow):
    # Placeholder function to update the Gaussian model parameters
    # In actual implementation, you should update the GMM with new data points
    pass

def gaussian_probability(pixel, mean, covariance):
    # Compute the Gaussian probability density function
    return multivariate_normal.pdf(pixel, mean=mean, cov=covariance)

def mask_shadows(image_rgb):
    # Resize to 128x128
    image_rgb_resized = cv2.resize(image_rgb, (128, 128))

    # Convert to YCbCr color space
    image_YCbCr = convert_to_YCbCr(image_rgb_resized)
    Y_channel, _, _ = cv2.split(image_YCbCr)

    # Set differential component threshold T
    T = np.mean(Y_channel) * 0.7  # Example threshold

    # Initial shadow detection
    shadow_mask_initial = initial_shadow_detection(Y_channel, T)

    # Convert boolean mask to 0s and 1s, then to 0s and 255s
    shadow_mask_initial = shadow_mask_initial.astype(np.uint8)  # Convert to 0s and 1s
    shadow_mask_initial *= 255  # Convert to 0s and 255s

    # Repeat mask for all color channels
    mask_rgb = np.repeat(shadow_mask_initial[:, :, np.newaxis], 3, axis=2)

    # Ensure both image and mask are of type np.uint8
    image_rgb_uint8 = image_rgb_resized.astype(np.uint8)
    mask_rgb_uint8 = mask_rgb.astype(np.uint8)

    # Apply mask
    masked_image_rgb = cv2.bitwise_and(image_rgb_uint8, mask_rgb_uint8)
    # Where mask is 255, set image to black
    masked_image_rgb = np.where(mask_rgb_uint8 == [255, 255, 255], [0, 0, 0], image_rgb_uint8)

    return masked_image_rgb, shadow_mask_initial


def brighten_shadows(image_rgb, shadow_mask, brighten_factor=1.34, blur_radius=3):
    """
    Brightens the shadows in the image by a specified brighten factor and
    applies a Gaussian blur to the shadow regions for smoother transitions.

    Parameters:
    image_rgb: The original RGB image.
    shadow_mask: A mask indicating shadow regions (0s for non-shadow, 255 for shadows).
    brighten_factor: Factor by which to brighten the shadow regions.
    blur_radius: The radius of the Gaussian blur to apply to the brightened shadow regions.

    Returns:
    An image with the shadows brightened and blurred.
    """
    image_rgb = image_rgb.astype(np.uint8)
    shadow_mask = shadow_mask.astype(np.uint8)
    # Ensure the shadow mask is boolean for indexing
    shadow_mask_bool = shadow_mask.astype(bool)

    # Convert the image to YCbCr color space
    image_YCbCr = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2YCrCb)
    Y_channel, Cb_channel, Cr_channel = cv2.split(image_YCbCr)

    # Brighten the Y channel by the brighten_factor only in the shadow regions
    Y_channel[shadow_mask_bool] = np.clip(Y_channel[shadow_mask_bool] * brighten_factor, 0, 255)

    # Merge the channels back together and convert to RGB
    brightened_YCbCr = cv2.merge([Y_channel, Cb_channel, Cr_channel])
    brightened_rgb = cv2.cvtColor(brightened_YCbCr, cv2.COLOR_YCrCb2RGB)

    # Apply Gaussian blur to the brightened image
    blurred_brightened_rgb = cv2.GaussianBlur(brightened_rgb, (blur_radius, blur_radius), 0)

    # Blend the blurred brightened shadows back into the original image
    final_image = np.where(shadow_mask_bool[:, :, np.newaxis], blurred_brightened_rgb, image_rgb)

    return final_image

def brighten_shadows_adaptive(image_rgb, shadow_mask, blur_radius=5):
    """
    Brightens the shadows in the image based on comparison with average non-shadow brightness
    and applies a Gaussian blur to the shadow regions for smoother transitions.

    Parameters:
    image_rgb: The original RGB image.
    shadow_mask: A mask indicating shadow regions (0s for non-shadow, 255 for shadows).
    blur_radius: The radius of the Gaussian blur to apply to the brightened shadow regions.

    Returns:
    An image with the shadows brightened and blurred adaptively.
    """
    # Convert the image to YCbCr color space for luminance channel manipulation
    image_YCbCr = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2YCrCb)
    Y_channel, Cb_channel, Cr_channel = cv2.split(image_YCbCr)

    # Calculate the average brightness of non-shadow areas
    non_shadow_mask = ~shadow_mask.astype(bool)
    average_non_shadow_brightness = Y_channel[non_shadow_mask].mean()

    # Adjust shadow brightness based on the average non-shadow brightness
    shadow_areas = shadow_mask.astype(bool)
    adjustment_factor = average_non_shadow_brightness / Y_channel[shadow_areas]
    Y_channel[shadow_areas] = np.clip(Y_channel[shadow_areas] * adjustment_factor, 0, 255)

    # Merge the channels back together and convert to RGB
    adjusted_YCbCr = cv2.merge([Y_channel, Cb_channel, Cr_channel])
    adjusted_rgb = cv2.cvtColor(adjusted_YCbCr, cv2.COLOR_YCrCb2RGB)

    # Blur only the shadow regions
    blurred_adjusted_rgb = cv2.GaussianBlur(adjusted_rgb, (blur_radius, blur_radius), 0)
    final_image = np.where(shadow_mask[:,:,np.newaxis], blurred_adjusted_rgb, image_rgb)

    return final_image
def average_brightness_adjustment(image_rgb, shadow_mask, num_neighbors=500, blur_radius=3):
    """
    Adjusts the brightness of shadow regions based on the average brightness of the nearest
    non-shadow pixels, then applies a Gaussian blur for smoothness.

    Parameters:
    image_rgb: The original RGB image.
    shadow_mask: A mask indicating shadow regions (0s for non-shadow, 255 for shadows).
    num_neighbors: The number of nearest non-shadow neighbors to consider for averaging.
    blur_radius: The radius of the Gaussian blur to apply to the adjusted shadow regions.

    Returns:
    An image with the shadows' brightness adjusted and blurred for smooth transitions.
    """
    # Ensure the shadow mask is a boolean array for indexing
    shadow_mask_bool = shadow_mask.astype(bool)

    # Convert the image to YCbCr color space
    image_YCbCr = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2YCrCb)
    Y_channel, Cb_channel, Cr_channel = cv2.split(image_YCbCr)

    # Find indices of shadow and non-shadow pixels
    shadow_indices = np.argwhere(shadow_mask_bool)
    non_shadow_indices = np.argwhere(~shadow_mask_bool)

    # Create a KDTree for efficient spatial search
    tree = cKDTree(non_shadow_indices)

    # Adjust the brightness of each shadow pixel based on the average of 50 nearest non-shadow pixels
    for shadow_y, shadow_x in shadow_indices:
        distances, locations = tree.query([shadow_y, shadow_x], k=num_neighbors)
        Y_channel[shadow_y, shadow_x] = (
            (Y_channel[shadow_y, shadow_x].astype(np.float) + Y_channel[non_shadow_indices[locations][:, 0], non_shadow_indices[locations][:, 1]].mean()) / 2
        ).astype(np.uint8)

    # Merge the channels back and convert to RGB
    adjusted_YCbCr = cv2.merge([Y_channel, Cb_channel, Cr_channel])
    adjusted_rgb = cv2.cvtColor(adjusted_YCbCr, cv2.COLOR_YCrCb2RGB)

    # Apply Gaussian blur to the shadow regions in the adjusted image
    blurred_adjusted_rgb = cv2.GaussianBlur(adjusted_rgb, (blur_radius, blur_radius), 0)

    # Blend the blurred adjusted shadows back into the original image
    final_image = np.where(shadow_mask_bool[:, :, np.newaxis], blurred_adjusted_rgb, image_rgb)

    return final_image