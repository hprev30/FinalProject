library('readxl')
gom <- read_xlsx("C:/Users/hjp4906/Desktop/Final Project/GOMECC-3 Cruise Data.xlsx")
unique(gom$DEPTH_METER)

#getting rid of first row
gom <- gom[-1,]

#turning columns into numeric so i can edit and getting rid of unnecessary columns
gom$DEPTH_METER <- as.numeric(gom$DEPTH_METER)
surf_gom$LATITUDE_DEC <- as.numeric(surf_gom$LATITUDE_DEC)
surf_gom$LONGITUDE_DEC <- as.numeric(surf_gom$LONGITUDE_DEC)
surf_gom$BOTDEPTH <- as.numeric(surf_gom$BOTDEPTH)
surf_gom$PCO2_MEA_UATM <- as.numeric(surf_gom$PCO2_MEA_UATM)
surf_gom$CHLA_MG_M3 <- as.numeric(surf_gom$CHLA_MG_M3)
which(colnames(gom)=="DEPTH_METER")
col2keep <- c("Sample_ID", "EXPOCODE", "CRUISE_ID", "CAST_NO", "DATE_UTC", "TIME_UTC", 'LATITUDE_DEC', 'LONGITUDE_DEC', 
              'DEPTH_METER', 'BOTDEPTH', 'PCO2_MEA_UATM', 'CHLA_MG_M3')
surf_gom <- surf_gom[,col2keep]

#getting rid of anything below 20 m
surf_gom <- gom[gom$DEPTH_METER <= 20,]

#getting rid of the -999 values
surf_gom <- surf_gom[surf_gom$PCO2_MEA_UATM != -999,]

#calculating total area of the chl_a 
la <- read.csv("C:/Users/hjp4906/Desktop/louisiana.csv")
sum(la$Shape_Area)
56106289218-17702794135
areas <- read.csv(file='~/Desktop/Export_Intersect.txt')
sum <- sum(areas$Shape_Area)
(sum/38403495083)*100

#getting oil rig numbers and exporting
library('dplyr')
gom <- read_xlsx(path = "~/Desktop/GOMECC-3 Cruise Data (1).xlsx")
write.csv(oilrig, file = 'oilrigs.csv')
write.table(gom, file='gom_full.txt', sep = '\t')
getwd()
gom2 <- read.csv(file = '~/Desktop/gom_full2.csv', header = T, stringsAsFactors = F)
gom2 <- gom2[,-1]
write.table(gom2, file = 'gom_odv.txt', sep ='\t')
contains <- read.csv(file = '~/Desktop/spatial_join.csv')
oilrig <- as.data.frame(table(contains$TARGET_FID))

