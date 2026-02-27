#' This Script is to adjust atmospheric parameters for Ortho imagery.
#' It follows this workflow:
#' https://christophemetsu.github.io/theRmalUAV/articles/Image-based_Workflow.html

# load library
library(theRmalUAV)

# inspect available cameras
tuav_cameras()


#### parameter settings ####

image_path = "C:/example/path" # * see recommendations
output_path = "C:/example/path" # * see recommendations

flight_height = 120 # height of the flight in meters
# flight height is set when planning the drone mission. 

T_air = 11          # T_air ambient temperature (°C) 
rel_hum = 33        # rel_hum relative humidity (%)
SKC = TRUE          # clear sky: TRUE or FALSE
emiss = 0.985       # set emissivity of target material


# * recommendation:
#' a) I recommend not more than 1000 images per folder, because the return would
#' exceed the allocated RAM space. E.g. I run it with 1883 files and got the error:
#' " result would exceed 2^31-1 bytes"
#' b) Sometimes it throws an error if the path is too long, 
#' consider creating a temporary output folder with shorter path

#### load images ####

# creates an internal object for processing
thermal_uav <- tuav_create(path = image_path,
                           camera = "DJI_ZH20T",
                           meta_csv = NA,
                           flight_height = flight_height)
#' Comment: My first impression is that it does not matter what flight height
#' is specified here, same outputs with 5m and 120m. In the next step its important though


#### correct images ####

thermal_uav_correct <- tuav_correct(thermal_uav,          
                                    flight_height = flight_height,
                                    T_air = T_air,
                                    rel_hum = rel_hum,
                                    SKC = SKC,
                                    emiss = emiss)

#### Export images ####

tuav_export(thermal_uav_correct,
            export_path = output_path) 

# the resulting images have tif format with values in centi kelvin (27315 cK = 0°C)


