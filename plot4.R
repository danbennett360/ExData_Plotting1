# read in the data.
rawData <- read.csv("data/household_power_consumption.txt", 
                   sep=";", head=TRUE, na.strings="?")

# cut down to the data we want
cutData <- rawData[rawData$Date == "2/2/2007" | rawData$Date == "1/2/2007",]

# create a date-time field
cutData$dateTime = strptime(paste(cutData$Date ,cutData$Time),
                    "%d/%m/%Y %H:%M:%S")

# open the file
png(file="plot4.png", height=480, width=480)

# create a 2x2 canvas
par(mfrow=c(2,2), bg="white")
with (cutData, {
    # graph A 
    plot(dateTime , Global_active_power, 
              ylab = "Global Active Power" , type="l", xlab="")

    # graph B
    plot(dateTime , Voltage, ylab = "Voltage" , type="l", xlab="daytime")

    # graph C
    plot(cutData$dateTime, cutData$Sub_metering_1,
              type="n", ylab="Energy sub metering", xlab="")
    points(cutData$dateTime, cutData$Sub_metering_1,type="l", col="black")
    points(cutData$dateTime, cutData$Sub_metering_3, type="l", col="blue")
    points(cutData$dateTime, cutData$Sub_metering_2, type="l", col="red")
    legend("topright", col=c("black", "red", "blue"), 
         legend = c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "), 
         bty="n", lty=1)
 
    # graph D 
    plot(dateTime , Global_reactive_power, xlab = "datetime" , type="l")
})

dev.off()

