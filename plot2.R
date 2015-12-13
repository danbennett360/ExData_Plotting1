# read in the data
rawData <- read.csv("data/household_power_consumption.txt", 
                   sep=";", head=TRUE, na.strings="?")

# crop the dates we want
cutData <- rawData[rawData$Date == "2/2/2007" | rawData$Date == "1/2/2007",]

# create a date-time field 
cutData$dateTime = strptime(paste(cutData$Date ,cutData$Time),
       "%d/%m/%Y %H:%M:%S")

# open the output device
png(file="plot2.png", height=480, width=480)

# draw the graph
par(mfrow=c(1,1), bg="white")
plot(cutData$dateTime, cutData$Global_active_power, type="l", 
             ylab="Global Active Power (killowatts)",
	     xlab = "")
dev.off()
