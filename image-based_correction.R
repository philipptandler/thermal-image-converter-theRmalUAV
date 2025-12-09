#' This Script is to adjust atmospheric parameters for Ortho imagery.
#' It follows this workflow:
#' https://christophemetsu.github.io/theRmalUAV/articles/Image-based_Workflow.html

# load library
library(theRmalUAV)

# inspect available cameras
tuav_cameras()

#### load images ####

# path to folder containing the RJPG images
image_path = "C:/Users/ptandler/Documents/24-040_RDKB_BurrelCreek/Year2_2025/02.Data/01.Selkirk/02.Raw_Data/03.Sensor_Data/02.H20T/2025-09-04/ChannelHigh_005-006/Thermal_RJPG"

# creates an internal object for processing
# flight height is set when planning the drone mission
thermal_uav <- tuav_create(path = image_path,
                           camera = "DJI_ZH20T",
                           meta_csv = NA,
                           flight_height = 120)


#### correct images ####

#' set flight height again
#' T_air ambient temperature (°C) rel_hum relative humidity (%), and sky clear TRUE or FALSE
#' Those parameters should come from measurements on site, Airdata, flight logs, spotwx
#' Estimate emissivity for target surface
thermal_uav_correct <- tuav_correct(thermal_uav,          
                                    flight_height = 120,   # in meters
                                    T_air = 24,         # in °C
                                    rel_hum = 42,       # in %
                                    SKC = TRUE,
                                    emiss = 0.985)

#### Export images ####

#' set output path. Sometimes it throws an error if the path is too long, 
#' consider creating a temporary output folder with shorter path
output_path = "C:/Users/ptandler/Documents/24-040_RDKB_BurrelCreek/Year2_2025/02.Data/01.Selkirk/02.Raw_Data/03.Sensor_Data/02.H20T/2025-09-04/corrected_channelHigh_movefolder"
tuav_export(thermal_uav_correct,
            export_path = output_path) 
# the resulting images have tif format with values in centi kelvin (27315 cK = 0°C)


