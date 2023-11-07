import numpy as np
from sklearn.mixture import GaussianMixture

def remove_specular_highlights_gmm(hsi_cube):
    # Step 1: Flatten the HSI cube
    height, width, bands = hsi_cube.shape
    flattened_cube = hsi_cube.reshape((-1, bands))

    # Step 2: Fit a GMM with two components
    gmm = GaussianMixture(n_components=2, random_state=0)
    gmm.fit(flattened_cube)
    
    # Step 3: Predict cluster for each pixel
    cluster_labels = gmm.predict(flattened_cube)
    
    # Identify specular cluster (the cluster with the higher mean intensity)
    cluster_means = gmm.means_.mean(axis=1)
    specular_cluster_label = np.argmax(cluster_means)
    
    # Step 4: Replace specular pixels with the mean of the non-specular cluster
    non_specular_mean = gmm.means_[1-specular_cluster_label]
    specular_pixels = cluster_labels == specular_cluster_label
    flattened_cube[specular_pixels] = non_specular_mean
    
    # Step 5: Reshape back to HSI cube
    denoised_hsi_cube = flattened_cube.reshape((height, width, bands))
    
    return denoised_hsi_cube

# Usage example (assuming 'hsi_cube' is your input HSI data with the shape (height, width, 61))
# denoised_hsi_cube = remove_specular_highlights_gmm(hsi_cube)
