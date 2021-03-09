library(ggplot2)
library(dplyr)
library(tidyr)

## read the data and separate data accordingly
fulldata <- read.table("household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";")

## subset data as requested

plot1data <- subset(fulldata, fulldata$Date == "1/2/2007"| fulldata$Date == "2/2/2007")

## change data to corrected format

plot1data$Global_active_power <- as.numeric(plot1data$Global_active_power)

## plot histogram of requested data
 png("plot1.png", width = 480, height = 480)
 hist(plot1data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
 dev.off()
 