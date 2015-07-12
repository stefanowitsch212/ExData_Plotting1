# Assignment 
library(plyr)

Energy <- read.table("./data/household_power_consumption.txt", sep = ";", header = T, na.strings='?') # Get Data 
str(Energy)
Energy$TimeAll  <- paste(Energy$Date,Energy$Time)
Energy$TimeAll <- strptime(Energy$TimeAll, "%d/%m/%Y %H:%M:%S")

EnergySub <- subset(Energy, TimeAll >= "2007-02-01" & TimeAll <= "2007-02-02")

EnergySub$Global_active_power <- as.numeric(EnergySub$Global_active_power)
EnergySub$Global_reactive_power <- as.numeric(EnergySub$Global_reactive_power)
EnergySub$Voltage  <- as.numeric(EnergySub$Voltage)
EnergySub$Global_intensity <- as.numeric(EnergySub$Global_intensity)
EnergySub$Sub_metering_1 <- as.numeric(EnergySub$Sub_metering_1)
EnergySub$Sub_metering_2 <- as.numeric(EnergySub$Sub_metering_2)
EnergySub$Sub_metering_3 <- as.numeric(EnergySub$Sub_metering_3)


# Plot 1

png(file = "plot1.png", bg = "white", width = 480, height = 480)

png("plot1.png", width = 480, height = 480)
hist(EnergySub$Global_active_power, main = "Global Active power", col = "red", xlab = "Global Active Power (kilowatts)", )
dev.off

dev.off()
