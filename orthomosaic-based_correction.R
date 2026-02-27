#' This Script is to adjust atmospheric parameters for an Orthomosaic.
#' It follows this workflow:
#' https://christophemetsu.github.io/theRmalUAV/articles/Orthomosaic-based_Workflow.html
#' This scipt also requires the 'terra' Rpackage.


# load library
library(theRmalUAV)
# install.packages('terra')
library(terra)

#### parameter settings ####

orthomosaic_path = "C:/example/path" # * see recommendations
output_path = "C:/example/path" # * see recommendations

flight_height = 120 # height of the flight in meters
# flight height is set when planning the drone mission. 

temp = "C"          # ambient temperature in °C (C) or Kelvin (K)
T_air = 11          # T_air ambient temperature (°C) 
rel_hum = 33        # rel_hum relative humidity (%)
SKC = TRUE          # clear sky: TRUE or FALSE
emiss = 0.985       # set emissivity of target material


#### load images ####

# path to the Thermal Orthomosaic processed in e.g. Agisoft Metashape
Orthomosaic_Path = "C:/Users/ptandler/Documents/BurrelCreekProject/Year2_2025/02.Data/01.Selkirk/03.Processed_Data/02.H20T/2025-11-28/Channel_All_001-002/Orthomosaic_Thermal_v3_notCorrected.tif"

# convert to raster
thermal_rast <- rast(orthomosaic_path)

#### correct raster ####

thermal_corrected <- ortho_correct(thermal_ortho = thermal_rast,
                                   temp = temp,
                                   flight_height = flight_height,
                                   T_air = T_air,
                                   rel_hum = rel_hum,
                                   SKC = SKC,
                                   emiss = emiss,
                                   method = NA)

#### Export raster ####

writeRaster(thermal_corrected, output_path, overwrite = TRUE)
# the resulting orthomosaic have tif format with values in centi kelvin (27315 cK = 0°C)
