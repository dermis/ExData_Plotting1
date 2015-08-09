# Read full data
data.raw <- read.csv("household_power_consumption.txt", header = T, 
                     sep = ";", na.strings = "?", nrows = 2075259)

# Convert as Date
data.raw$Date <- as.Date(data.raw$Date, format = "%d/%m/%Y")

# Subsetting the data
data <- subset(data.raw, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove object to clear memmory
rm(data.raw)

# Concatenate Date and Time
data$DateTime <- paste(data$Date, data$Time)

# Convert as Date Time class
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

# Plot 4 : 4 graphs
par(mfrow = c(2,2))
with(data, {
  plot(DateTime, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
  plot(DateTime, Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
  lines(DateTime, Sub_metering_2, col = "red")
  lines(DateTime, Sub_metering_3, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type = "l", 
       ylab = "Global_reactive_power", xlab = "datetime", ylim = c(0.0,0.5))
})

# Export as png
dev.copy(png, file = "plot4.png", height = 480, width = 480, units = "px")
dev.off()
