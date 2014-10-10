# This code creates a line graph named plot2.png taken from household_power_consumption data 
# from 2/1/2007 through 2/2/2007

##create pdf file to save graph
png("plot2.png", width=480, height=480)

##declare variables
title<- "Global Active Power"

##imports data table and extract Global Active Power data as 'gap'
data <- read.table("household_power_consumption.txt", sep=";",na.strings="?", header=TRUE)
globalPower <- data[data$Date=="2/2/2007" | data$Date=="1/2/2007",]
gap <- as.numeric(globalPower$Global_active_power)


##creates a line graph with custom axis
plot(gap, type="l", ylab=paste(title,"(kilowatts)"),xlab="",xaxt="n",)
axis(1,at=c(0,length(gap)/2,length(gap)),labels=c("Thu","Fri","Sat"))

##closes the PNG device
dev.off()