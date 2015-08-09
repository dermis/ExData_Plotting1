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

# Plot 2 : X-Y line plotting
plot(data$DateTime, data$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Export as png
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
