#' This Script is to adjust atmospheric parameters for an Orthomosaic.
#' It follows this workflow:
#' https://christophemetsu.github.io/theRmalUAV/articles/Orthomosaic-based_Workflow.html
#' This scipt also requires the 'terra' Rpackage.


# load library
library(theRmalUAV)
# install.packages('terra')
library(terra)


#### load images ####

# path to the Thermal Orthomosaic processed in e.g. Agisoft Metashape
Orthomosaic_Path = "C:/Users/ptandler/Documents/BurrelCreekProject/Year2_2025/02.Data/01.Selkirk/03.Processed_Data/02.H20T/2025-11-28/Channel_All_001-002/Orthomosaic_Thermal_v3_notCorrected.tif"

# convert to raster
thermal_rast <- rast(Orthomosaic_Path)

#### correct raster ####

#' flight height is set when planning the drone mission
#' T_air ambient temperature (°C) rel_hum relative humidity (%), and sky clear TRUE or FALSE
#' Those parameters should come from measurements on site, Airdata, flight logs, spotwx
#' Estimate emissivity for target surface
thermal_corrected <- ortho_correct(thermal_ortho = thermal_rast,
                                   temp = "C",               # Thermal map is in °C
                                   flight_height = 120 ,     # in meter
                                   T_air = 0,                # in °C
                                   rel_hum = 66,             # in %
                                   SKC = TRUE,
                                   emiss = 0.985,
                                   method = NA)

#### Export raster ####

#' set output path. Sometimes it throws an error if the path is too long, 
#' consider creating a temporary output folder with shorter path
output_path = "C:/Users/ptandler/Documents/BurrelCreekProject/Year2_2025/02.Data/01.Selkirk/03.Processed_Data/02.H20T/2025-11-28/Channel_All_001-002/Orthomosaic_Thermal_v3_Corrected.tif"

writeRaster(thermal_corrected, output_path, overwrite = TRUE)
# the resulting orthomosaic have tif format with values in centi kelvin (27315 cK = 0°C)
