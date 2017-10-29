# ---Plot4

# read dataset into R
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

# Subset data
SubsetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date/time
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot4
Sys.setlocale(category = "LC_ALL", locale = "english")
#---plot(datetime, SubsetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')

par(mfrow = c(2, 2))
plot(datetime, SubsetData$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(datetime, SubsetData$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(datetime, SubsetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(datetime, SubsetData$Sub_metering_2, col = 'red')
lines(datetime, SubsetData$Sub_metering_3, col = 'blue')
#legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)

legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),bty = "n")
plot(datetime, SubsetData$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')
# Save plot4 to file
dev.copy(png, file="plot4.png", height=480, width=480)
# close device
dev.off()
