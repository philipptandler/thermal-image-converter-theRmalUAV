import os

# Replace this with your folder path
folder_path = r"C:/Users/ptandler/Documents/24-040_RDKB_BurrelCreek/Year1_2024/01.Data/01.Selkirk/02.Raw_Data/04.H20T/CompleteAOI_001-003/corrected"

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