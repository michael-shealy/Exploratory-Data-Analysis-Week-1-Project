library(readr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$DateTime <- strptime(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
values <- data[data$DateTime >= "2007-02-01",]
values <- values[values$DateTime <= "2007-02-03",]
values <- values[!is.na(values$Date),]
png("plot2.png")
plot(values$DateTime,values$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()