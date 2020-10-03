library(readr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
values <- data[data$DateTime >= "2007-02-01",]
values <- values[values$DateTime <= "2007-02-03",]
values <- values[!is.na(values$Date),]

holdVals <- data.frame(values$DateTime,values$Sub_metering_1,values$Sub_metering_2,values$Sub_metering_3)
png("plot3.png")
matplot(holdVals,type="l",col = c("blue","black","red"),lty=1)
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("blue","black","red"),lty=1)
dev.off()