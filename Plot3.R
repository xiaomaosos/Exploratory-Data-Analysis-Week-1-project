library(ggplot2)
## read the data and separate data accordingly
fulldata <- read.table("household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";")

plot3data <- subset(fulldata, fulldata$Date == "1/2/2007"|fulldata$Date == "2/2/2007")

## transforming the date and time, and the data into corrected format

plot3data$Global_active_power <- as.numeric(plot3data$Global_active_power)
plot3data$Date <- as.Date(plot3data$Date, format = "%d/%m/%Y")
plot3data$Time <- format(plot3data$Time, format = "%H:%M:%S")
plot3data$Sub_metering_1 <- as.numeric((plot3data$Sub_metering_1))
plot3data$Sub_metering_2 <- as.numeric((plot3data$Sub_metering_2))
plot3data$Sub_metering_3 <- as.numeric((plot3data$Sub_metering_3))


## create column where Date and time combined

plot3data$fulltimedate <- paste(plot3data$Date, plot3data$Time)

## convert the new column into correct format

plot3data$fulltimedate <- as.POSIXct(plot3data$fulltimedate)

## create plot
png("Plot3.png", width = 480, height = 480)
with(plot3data, {plot(plot3data$fulltimedate, plot3data$Sub_metering_1, type = "l", ylab ="Global Active Power (kilowatts)",  xlab = "")
     lines(plot3data$fulltimedate, plot3data$Sub_metering_2,col="red") 
     lines(plot3data$fulltimedate, plot3data$Sub_metering_3, col= "Blue")})

legend("topright", col= c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


