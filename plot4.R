library(readr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
values <- data[data$DateTime >= "2007-02-01",]
values <- values[values$DateTime <= "2007-02-03",]
values <- values[!is.na(values$Date),]
png("plot4.png")
par(mfrow=c(2,2))
plot(values$DateTime,values$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(values$DateTime,values$Voltage,type="l",xlab="datetime",ylab="Voltage")
holdVals <- data.frame(values$DateTime,values$Sub_metering_1,values$Sub_metering_2,values$Sub_metering_3);
matplot(holdVals,type="l",col = c("blue","black","red"),lty=1);
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("blue","black","red"),lty=1,cex=0.75)
plot(values$DateTime,values$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.off()