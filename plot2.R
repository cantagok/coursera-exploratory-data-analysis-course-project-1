#Import txt file
#columns names are the first line, seperated by ";", decimal points are "."
electricData<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", dec=".")

#only looking at 2007 data
electricData<-electricData[electricData$Date=="1/2/2007"|electricData$Date=="2/2/2007",]

#Turn factor into numeric
electricData$Global_active_power<-as.numeric(levels(electricData$Global_active_power))[electricData$Global_active_power]

#Turn Date and Time variable into proper time and date format in R
Datetime<-strptime(paste(electricData$Date, electricData$Time, paste=" "), "%d/%m/%Y %H:%M:%S")

#Line graph of Global active power throughout time
plot(Datetime, electricData$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()
