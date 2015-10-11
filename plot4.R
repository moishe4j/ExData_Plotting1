library(dplyr)

Data <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?","")))
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data$timetemp <- paste(Data$Date, Data$Time)
Data$Time <- strptime(Data$timetemp, format = "%Y-%m-%d %H:%M:%S")

Data1 <- subset(Data, Data$Date == "2007-02-01"|Data$Date == "2007-02-02")

par(mfrow=c(2,2))
par(mar = c(4,4,0,0))

#plot 1
plot(Data1$Time, Data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

#plot 2
plot(Data1$Time, Data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

#plot 3
plot(Data1$Time, Data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Data1$Time, Data1$Sub_metering_2, col = "red")
lines(Data1$Time, Data1$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),lty = c(1, 1), bty = "n", cex = .5)

#plot 4
plot(Data1$Time, Data1$Global_reactive_power, type = "l", xlab = "datatime", ylab = "Global_reactive_power")

dev.copy(png, file = "plot4.png", width=504, height=504)
dev.off()
