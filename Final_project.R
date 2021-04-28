library('readxl')
gom <- read_xlsx("C:/Users/hjp4906/Desktop/Final Project/GOMECC-3 Cruise Data.xlsx")
unique(gom$DEPTH_METER)
gom <- gom[-1,]
gom$DEPTH_METER <- as.numeric(gom$DEPTH_METER)
which(colnames(gom)=="DEPTH_METER")
col2keep <- c("Sample_ID", "EXPOCODE", "CRUISE_ID", "CAST_NO", "DATE_UTC", "TIME_UTC", 'LATITUDE_DEC', 'LONGITUDE_DEC', 
              'DEPTH_METER', 'BOTDEPTH', 'PCO2_MEA_UATM', 'CHLA_MG_M3')
surf_gom <- gom[gom$DEPTH_METER <= 20,]
surf_gom <- surf_gom[,col2keep]
surf_gom$LATITUDE_DEC <- as.numeric(surf_gom$LATITUDE_DEC)
surf_gom$LONGITUDE_DEC <- as.numeric(surf_gom$LONGITUDE_DEC)
surf_gom$BOTDEPTH <- as.numeric(surf_gom$BOTDEPTH)
surf_gom$PCO2_MEA_UATM <- as.numeric(surf_gom$PCO2_MEA_UATM)
surf_gom$CHLA_MG_M3 <- as.numeric(surf_gom$CHLA_MG_M3)
surf_gom <- surf_gom[surf_gom$PCO2_MEA_UATM != -999,]
