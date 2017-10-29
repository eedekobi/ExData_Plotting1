# ---Plot3

# read dataset into R
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

# Subset data
SubsetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date/time
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot3
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(datetime, SubsetData$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(datetime, SubsetData$Sub_metering_2, col = 'red')
lines(datetime, SubsetData$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
# Save plot3 to file
dev.copy(png, file="plot3.png", height=480, width=480)
# close device
dev.off()