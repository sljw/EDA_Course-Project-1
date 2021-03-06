## Reads Data
CompleteData <- read.csv(file = "household_power_consumption.txt", header=T, sep =';', na.strings="?")
CompleteData$Date <- as.Date(CompleteData$Date, format="%d/%m/%Y")

## Subsets Data
Data <- subset(CompleteData, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
## Datetime conversion
datetime <- paste(as.Date(Data$Date), Data$Time)
Data$Datetime <- as.POSIXct(datetime)

## Plot 3
with(Data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()