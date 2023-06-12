# Script for generating instructions for automated library pooling after quantificatio
# by Qubit

#0. Read file
data <- read.csv("allsamples.csv", header = TRUE)

#1. Remove calibration line and concentrations less than 0.07 ng/µL 
data <- data[1:88,]
tff_file <- data[data$converted_conc>0.07,c(1,4)]
leftover1 <- data[!data$converted_conc>0.07, c(1,4)]

#2. Calculate average conc and vol for pooling
tff_file$average_conc <- mean(tff_file$converted_conc)
# CHANGE SCALER IN THIS LINE
tff_file$vol_for_pool <- tff_file$average_conc*1.5/tff_file$converted_conc
tff_file$check <- tff_file$vol_for_pool*tff_file$converted_conc
tff_file$vol_for_pool <- round(tff_file$vol_for_pool,1)
tff_file$dest <- "B3"

#3. Remove pipetting volumes lower than 0.5 and higher than 8
tff_file_pipette <- tff_file[tff_file$vol_for_pool>0.5 & tff_file$vol_for_pool<8,]
leftover <- tff_file[!(tff_file$vol_for_pool>0.5 & tff_file$vol_for_pool<8),]
leftover1$v3 <- NA
leftover1$v4 <- NA
leftover1$v5 <- NA
leftover1$v6 <- NA
colnames(leftover1) <- colnames(leftover)
leftover <- rbind(leftover,leftover1)

#4. write files
write.csv(tff_file_pipette, "tff_library_pool.csv", row.names = FALSE																)
write.csv(leftover, "manual_library_pool.csv")


