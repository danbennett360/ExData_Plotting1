# Read the data.   
rawData <- read.csv("data/household_power_consumption.txt", 
                   sep=";", head=TRUE, na.strings="?")
cutData <- rawData[rawData$Date == "2/2/2007" | rawData$Date == "1/2/2007",]
cutData$dateTime = strptime(paste(cutData$Date ,cutData$Time),
         "%d/%m/%Y %H:%M:%S")

# draw the graph
# note: 
#  bg set to white as linux tools don't like the default transparent background
png(file="plot1.png", height=480, width=480)

par(mfrow=c(1,1), bg="white")

hist(cutData$Global_active_power, 
        xlab = "Global Active Power (killowatts)", 
	col="red", main="Global Acitve Power")

# save the output to a png file.
dev.off()
