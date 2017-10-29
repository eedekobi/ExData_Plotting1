# ---Plot2

# read dataset into R
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

# Subset data
SubsetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# Convert date/time
datetime <- strptime(paste(SubsetData$Date, SubsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Plot2
Sys.setlocale(category = "LC_ALL", locale = "english")
plot(datetime, SubsetData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# Save plot2 to file
dev.copy(png, file="plot2.png", height=480, width=480)
# close device
dev.off()