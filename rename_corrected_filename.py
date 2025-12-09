import os

# Replace this with your folder path
folder_path = r"C:/Users/ptandler/Documents/24-040_RDKB_BurrelCreek/Year2_2025/02.Data/01.Selkirk/02.Raw_Data/03.Sensor_Data/02.H20T/2025-09-04/ChannelLow_007-011_013/corrected"

# Loop through all files in the folder
for filename in os.listdir(folder_path):
    # Only process files (ignore subfolders)
    full_path = os.path.join(folder_path, filename)
    if os.path.isfile(full_path):
        # Check if "_corrected" is in the filename
        if "_corrected" in filename:
            # Create new filename by removing "_corrected"
            new_filename = filename.replace("_corrected", "")
            new_full_path = os.path.join(folder_path, new_filename)
            
            # Rename the file
            os.rename(full_path, new_full_path)