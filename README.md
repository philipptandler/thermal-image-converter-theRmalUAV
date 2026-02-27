# thermal-image-converter-UAV

This repository is used for processing radiometric `.JPG` files into `.tif`
files, while correcting for atmospheric and flight conditions. It simply provides
the scripts to apply the `therRmalUAV` package, and is intended for student of Selkirk Collage BC
to process UAV-based thermal images.

## Installation

Run `installer.R` to install the reqiured packages.

## Usage

Images can be converted either as individual files, or as a complete orthomosaic.
In R, load the library (`library(theRmalUAV)`), and use `tuav_cameras()` along with 
the online documentation of `theRmalUAV` to understand requirements of the used sensor.

### Converting individual files

In `image-based_correction.R`, adjust all parameters and paths, and run the script.
Consider keeping folders of <1000 files, else the script might crash. 

### Converting a complete orthomosaic

In `orthomosaic-based_correction.R`, adjust all parameters and paths, and run the script.
You might need to install the `terra` package.

### Output

The resulting `.tif` file(s) are in centi kelvin (cK, 27315 cK = 0°C).

## Credits

This script only facilitates the application. Credits go to the developers of the
`theRmalUAV` package [theRmalUAV](https://christophemetsu.github.io/theRmalUAV/index.html)


