setwd("C:/VION/Emmanuel/R_WD_Coursera")

# Download dataset for project
if(!file.exists('Data')) dir.create('Data')
download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip', dest="./Data/household_power_consumption.zip", mode="wb")

# unzip dataset 
unzip('./Data/household_power_consumption.zip', exdir = './Data')

# read dataset into R
dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?", dec=".")

# Subset data
SubsetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot1
hist(SubsetData$Global_active_power, main="Global Active Power", 
xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save plot1 to file
dev.copy(png, file="plot1.png", height=480, width=480)
# close device
dev.off()