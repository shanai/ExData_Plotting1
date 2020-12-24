# Download and unzip source file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

file <- "household_power_consumption.txt"
dataset <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasubset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

head(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(datasubset$Global_active_power)

# Plot to screen first so that we can verify the settings
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
