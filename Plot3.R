# This code creates a line graph named plot3.png taken from household_power_consumption data 
# from 2/1/2007 through 2/2/2007

##create pdf file to save graph
png("plot3.png", width=480, height=480)

##set the working directory and declare variables
title<- "Global Active Power"

##imports data table and extract appropriate date from as Global Active Power
data <- read.table("household_power_consumption.txt", sep=";",na.strings="?", header=TRUE)
globalPower <- data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
gap <- as.numeric(globalPower$Global_active_power)

##creates a line graph with custom axis
plot(globalPower$Sub_metering_1,type="n", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1,at=c(0,length(gap)/2,length(gap)),labels=c("Thu","Fri","Sat"))
points(globalPower$Sub_metering_1, col = "black",type="l")
points(globalPower$Sub_metering_2, col = "red",type="l")
points(globalPower$Sub_metering_3, col = "blue",type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pch="_", col=c("black","red","blue"),cex=0.5, seg.len=0.5, bty="n", lwd=2)

#closes the PNG device
dev.off()