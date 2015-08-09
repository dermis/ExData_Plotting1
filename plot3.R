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

# Plot 3 : lines plotting
with(data, {
  plot(DateTime, Sub_metering_1, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(DateTime, Sub_metering_2, col = "Red")
  lines(DateTime, Sub_metering_3, col = "Blue")
})

# Add legend
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Export as png
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()
