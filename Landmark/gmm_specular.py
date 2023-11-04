import cv2
import numpy as np
from scipy.spatial import cKDTree

def initial_specular_highlight_detection(Y_channel, threshold_H):
    # Initial specular highlight detection based on high brightness threshold
    highlight_mask = Y_channel > threshold_H
    return highlight_mask

def replace_specular_with_mean(image, mask, num_neighbors=50):
    # Convert the mask to indices
    specular_indices = np.argwhere(mask)
    non_specular_indices = np.argwhere(~mask)
    
    # Create KDTree for efficient spatial search for non-specular neighbors
    tree = cKDTree(non_specular_indices)

    # Create an output image and set it initially to the input image
    output_image = np.copy(image)

    # Iterate over each specular pixel
    for specular_y, specular_x in specular_indices:
        # Find the nearest non-specular neighbors
        distances, locations = tree.query([specular_y, specular_x], k=num_neighbors)
        
        # Calculate the mean color of the neighbors
        mean_color = np.mean(image[non_specular_indices[locations][:,0], non_specular_indices[locations][:,1]], axis=0)

        # Replace the specular pixel with the mean color
        output_image[specular_y, specular_x] = mean_color

    # Convert the mask to an 8-bit unsigned integer, if it's not already
    mask_8bit = mask.astype(np.uint8) * 255
    
    # Apply Gaussian blur to the entire output image to create a blurred version for blending
    blur_radius = 5
    blurred_image = cv2.GaussianBlur(output_image, (blur_radius, blur_radius), 0)
    
    # Create an edge mask using the Canny edge detector on the 8-bit mask
    edge_mask = cv2.Canny(mask_8bit, 100, 200)
    
    # Dilate the edge mask so the edges are slightly wider, allowing for smoother blending
    edge_mask = cv2.dilate(edge_mask, None, iterations=1)
    
    # Blend the blurred image with the original at the edges of the replaced regions
    output_image = np.where(edge_mask[:, :, np.newaxis] == 255, blurred_image, output_image)

    return output_image

def remove_specular_highlights(image_rgb):
    # Convert to YCbCr color space and split channels
    image_YCbCr = cv2.cvtColor(image_rgb, cv2.COLOR_RGB2YCrCb)
    Y_channel, _, _ = cv2.split(image_YCbCr)

    # Set high brightness component threshold to detect specular highlights
    threshold_H = np.percentile(Y_channel, 95)  # High brightness threshold

    # Initial specular highlight detection
    highlight_mask = initial_specular_highlight_detection(Y_channel, threshold_H)

    # Replace specular highlights with the mean of nearest non-specular pixels
    repaired_image = replace_specular_with_mean(image_rgb, highlight_mask, num_neighbors=50)

    return repaired_image