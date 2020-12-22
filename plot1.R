#Import txt file
#columns names are the first line, seperated by ";", decimal points are "."
electricData<-read.table(file="household_power_consumption.txt", header=TRUE, sep=";", dec=".")

#only looking at 2007 data
electricData<-electricData[electricData$Date=="1/2/2007"|electricData$Date=="2/2/2007",]

#Histogram of Global Active Power
#First turn factors into numeric
electricData$Global_active_power<-as.numeric(levels(electricData$Global_active_power))[electricData$Global_active_power]
hist(electricData$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
