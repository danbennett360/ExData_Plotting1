# read in the data.
rawData <- read.csv("data/household_power_consumption.txt", 
                   sep=";", head=TRUE, na.strings="?")

# cut down to the data we want
cutData <- rawData[rawData$Date == "2/2/2007" | rawData$Date == "1/2/2007",]

# create a date-time field
cutData$dateTime = strptime(paste(cutData$Date ,cutData$Time),
                    "%d/%m/%Y %H:%M:%S")

# open the output file
png(file="plot3.png", height=480, width=480)

par(mfrow=c(1,1), bg="white")

# plot an empty screen
plot(cutData$dateTime, cutData$Sub_metering_1,type="n",
         ylab="Energy sub metering", xlab="")

# add each of the lines
points(cutData$dateTime, cutData$Sub_metering_1,type="l", col="black")
points(cutData$dateTime, cutData$Sub_metering_3, type="l", col="blue")
points(cutData$dateTime, cutData$Sub_metering_2, type="l", col="red")

# and a ledgend
legend("topright", col=c("black", "red", "blue"), 
     legend = c("Sub_metering_1 ","Sub_metering_2 ","Sub_metering_3 "), lty=1)

dev.off()
