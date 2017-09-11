## Code for the Plot 2 
## By NPP 9/10/2017
dataFile <- "./Assignment/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

par(mfrow = c(2,2)) ##, mar = c(4,4,2,1), oma = c(0,0,2,0))
# Plot Global Active Power
globalActivePower <- as.numeric(subSetData$Global_active_power)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

# Plot Voltage
voltage <- as.numeric(subSetData$Voltage)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")


#Plot Energy Sub Metering
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)
plot(datetime, subMetering1, type="l",  xlab="", ylab="Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, bty="o", col=c("black", "red", "blue"))

# Plot Global Reactive Power
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "./Assignment/Plot4.png", width=480, height=480) ## Copy from screen into .png file
dev.off()