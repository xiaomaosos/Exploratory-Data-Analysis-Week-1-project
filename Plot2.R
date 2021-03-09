library(ggplot2)

 ## read the data and separate data accordingly
fulldata <- read.table("household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";")

plot2data <- subset(fulldata, fulldata$Date == "1/2/2007"|fulldata$Date == "2/2/2007")

## transforming the date and time, and the data into corrected format

plot2data$Global_active_power <- as.numeric(plot2data$Global_active_power)
plot2data$Date <- as.Date(plot2data$Date, format = "%d/%m/%Y")
plot2data$Time <- format(plot2data$Time, format = "%H:%M:%S")

## create column where Date and time combined

plot2data$fulltimedate <- paste(plot2data$Date, plot2data$Time)

## convert the new column into correct format

plot2data$fulltimedate <- as.POSIXct(plot2data$fulltimedate)

## create plot
png("plot2.png", width = 480, height = 480)
plot(plot2data$fulltimedate, plot2data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
