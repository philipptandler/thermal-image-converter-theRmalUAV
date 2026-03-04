import os

# Replace this with your folder path
folder_path = r"C:/Users/.../corrected"

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
