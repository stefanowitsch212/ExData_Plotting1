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


# Plot 4
png(file = "plot4.png", bg = "white", width = 480, height = 480)
par(mfrow = c(2,2))
plot(EnergySub$TimeAll, EnergySub$Voltage , type="l", col="black", xlab = "Day & Time", ylab = "Voltage")
plot(EnergySub$TimeAll, EnergySub$Global_reactive_power , type="l", col="black", xlab = "Day & Time", ylab = "Global Reactive Power")
plot(EnergySub$TimeAll, EnergySub$Global_active_power , type="l", col="black", xlab = "Day & Time", ylab = "Global Active Power")

ylimits = range(c(EnergySub$Sub_metering_1, EnergySub$Sub_metering_2, EnergySub$Sub_metering_3))
plot(EnergySub$TimeAll, EnergySub$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l", ylim = ylimits, col = "black")
par(new = TRUE)
plot(df$TimeALL, EnergySub$Sub_metering_2, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "red")
par(new = TRUE)
plot(EnergySub$TimeAll, EnergySub$Sub_metering_3, xlab = "", axes = FALSE, ylab = "", type = "l", ylim = ylimits, col = "blue")
legend("topright",
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       #bg = "transparent",
       #bty = "n",
       lty = c(1,1,1),
       col = c("black", "red", "blue")
)
par(mfrow = c(1,1))
dev.off()

