# Download and unzip source file from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

file <- "household_power_consumption.txt"
dataset <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")
datasubset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(datasubset$Global_active_power)
subMetering1 <- as.numeric(datasubset$Sub_metering_1)
subMetering2 <- as.numeric(datasubset$Sub_metering_2)
subMetering3 <- as.numeric(datasubset$Sub_metering_3)

# Plot to screen first so that we can verify the settings
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
