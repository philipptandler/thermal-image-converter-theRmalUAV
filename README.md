# thermal-image-converter-theRmalUAV

This repository is used for processing radiometric `.JPG` files into `.tif`
files, while correcting for atmospheric and flight conditions. It simply provides
the scripts to apply the `therRmalUAV` package, and is intended for student of Selkirk Collage BC
to process UAV-based thermal images.

## Installation

Clone the repository:

```sh
git clone https://github.com/philipptandler/thermal-image-converter-theRmalUAV.git
cd thermal-image-converter-theRmalUAV
```

Run `installer.R` to install the required packages.

## Usage

Images can be converted either as individual files, or as a complete orthomosaic.
In R, load the library `library(theRmalUAV)`, and use `tuav_cameras()` along with 
the online documentation of `theRmalUAV` to understand requirements of the used sensor.

### Converting individual files

In `image-based_correction.R`, adjust all parameters and paths, and run the script.
Consider keeping folders of <1000 files, else the script might crash. 

### Converting a complete orthomosaic

In `orthomosaic-based_correction.R`, adjust all parameters and paths, and run the script.
You might need to install the `terra` package.

### Renaming output files

After converting loads of image files into TIF format and correcting for 
atmospheric conditions, the files are called `original_filename_corrected.tif`. 
It might be useful to rename and remove the `_corrected` from the resulting file names
for shorter file paths and consistent names. For this openthe Python scrit `rename_corrected_filenames.py`,
specify the path containing the folder with the files to be renamed and run the script.

### Output

The resulting `.tif` file(s) are in centi Kelvin (cK, 27315 cK = 0°C).

## Credits

This script only facilitates the application. Credits go to the developers of the
`theRmalUAV` package [theRmalUAV](https://christophemetsu.github.io/theRmalUAV/index.html)


