# Read full data
data.raw <- read.csv("household_power_consumption.txt", header = T, 
                     sep = ";", na.strings = "?", nrows = 2075259)

# Convert as Data
data.raw$Date <- as.Date(data.raw$Date, format = "%d/%m/%Y")

# Subsetting the data
data <- subset(data.raw, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove object to clear memmory
rm(data.raw)

# Concatenate Date and Time
data$DateTime <- paste(data$Date, data$Time)

# Convert as Date Time class
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

# Plot 1 - histogram
hist(x = data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Export as png
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
