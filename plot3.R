#Import txt file
#columns names are the first line, seperated by ";", decimal points are "."
electricData<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", dec=".")

#only looking at 2007 data
electricData<-electricData[electricData$Date=="1/2/2007"|electricData$Date=="2/2/2007",]

#Turn Date and Time variable into proper time and date format in R
Datetime<-strptime(paste(electricData$Date, electricData$Time, paste=" "), "%d/%m/%Y %H:%M:%S")

#Turn Sub metering into numerical
electricData$Sub_metering_1<-as.numeric(levels(electricData$Sub_metering_1))[electricData$Sub_metering_1]
electricData$Sub_metering_2<-as.numeric(levels(electricData$Sub_metering_2))[electricData$Sub_metering_2]

#Line graph of sub metering 1,2, and 3
plot(Datetime, electricData$Sub_metering_1, type="l", ylab = "Energry Sub metering", xlab = "")
lines(Datetime, electricData$Sub_metering_2, type="l", col="red")
lines(Datetime, electricData$Sub_metering_3, type="l", col="blue")

#legend
legend("topright", legend=c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"), lty = 1, lwd=4, col=c("black", "red", "blue"))
