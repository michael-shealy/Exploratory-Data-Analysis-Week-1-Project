library(readr)
data <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
values <- data[data$Date >= "2007-02-01",]
values <- values[values$Date <= "2007-02-02",]
values$Global_active_power <- as.numeric(values$Global_active_power)
png("plot1.png")
hist(values$Global_active_power,col="red",main="Global Active Power",xlab = "Global Active Power (kilowatts)")
dev.off()