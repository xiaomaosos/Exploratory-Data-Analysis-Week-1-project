library(ggplot2)
## read the data and separate data accordingly
fulldata <- read.table("household_power_consumption.txt", stringsAsFactors = F, header = T, sep = ";")

plot4data <- subset(fulldata, fulldata$Date == "1/2/2007"|fulldata$Date == "2/2/2007")

## transforming the date and time, and the data into corrected format

plot4data$Global_active_power <- as.numeric(plot4data$Global_active_power)
plot4data$Date <- as.Date(plot4data$Date, format = "%d/%m/%Y")
plot4data$Time <- format(plot4data$Time, format = "%H:%M:%S")
plot4data$Sub_metering_1 <- as.numeric((plot4data$Sub_metering_1))
plot4data$Sub_metering_2 <- as.numeric((plot4data$Sub_metering_2))
plot4data$Sub_metering_3 <- as.numeric((plot4data$Sub_metering_3))
plot4data$Global_reactive_power <- as.numeric(plot4data$Global_reactive_power)
plot4data$Voltage <- as.numeric(plot4data$Voltage)

## create column where Date and time combined

plot4data$fulltimedate <- paste(plot4data$Date, plot4data$Time)

## convert the new column into correct format

plot4data$fulltimedate <- as.POSIXct(plot4data$fulltimedate)

## create plot
png("Plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

with(plot4data, plot(plot4data$fulltimedate, plot4data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(plot4data, plot(plot4data$fulltimedate, plot4data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(plot4data, {plot(plot4data$fulltimedate, plot4data$Sub_metering_1, type = "l", ylab ="Global Active Power (kilowatts)",  xlab = "")
  lines(plot4data$fulltimedate, plot4data$Sub_metering_2,col="red") 
  lines(plot4data$fulltimedate, plot4data$Sub_metering_3, col= "Blue")})

legend("topright", col= c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
with(plot4data, plot(plot4data$fulltimedate, plot4data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.off()
