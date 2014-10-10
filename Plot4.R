# This code creates four graphs as an image named plot4.png taken from household_power_consumption data 
# from 2/1/2007 through 2/2/2007

##create pdf file to save graph
png("plot4.png", width=480, height=480)

##declare variables
title<- "Global Active Power"

##imports data table and extract appropriate date from as Global Active Power
data <- read.table("household_power_consumption.txt", sep=";",na.strings="?", header=TRUE)
globalPower <- data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
gap <- as.numeric(globalPower$Global_active_power)

##create a multi paneled plotting window and set margins
par(mfrow=c(2,2))
par(mar= c(4,4,2,2))

##creates graph topleft
plot(gap, type="l", ylab=paste(title,"(kilowatts)"),xlab="",xaxt="n",)
axis(1,at=c(0,length(gap)/2,length(gap)),labels=c("Thu","Fri","Sat"))
##creates graph topright
plot(globalPower$Voltage, type="l", ylab="Voltage",xlab="datetime",xaxt="n",ylim=c(234,246))
axis(1,at=c(0,length(globalPower$Voltage)/2,length(globalPower$Voltage)),labels=c("Thu","Fri","Sat"))

##creates graph bottomleft
plot(globalPower$Sub_metering_1,type="n", ylab="Energy sub metering", xaxt="n", xlab="")
axis(1,at=c(0,length(gap)/2,length(gap)),labels=c("Thu","Fri","Sat"))
points(globalPower$Sub_metering_1, col = "black",type="l")
points(globalPower$Sub_metering_2, col = "red",type="l")
points(globalPower$Sub_metering_3, col = "blue",type="l")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),pch="_", col=c("black","red","blue"),cex=0.5, seg.len=0.5, bty="n", lwd=2)

##creates graph bottomright
plot(globalPower$Global_reactive_power, type="l", xlab="datetime",xaxt="n", ylab="Global_reactive_power",ylim=c(0.0,0.5))
axis(1,at=c(0,length(globalPower$Global_reactive_power)/2,length(globalPower$Global_reactive_power)),labels=c("Thu","Fri","Sat"))

#closes the PNG device
dev.off()
##reset plotting window
par(mfrow=c(1,1))
