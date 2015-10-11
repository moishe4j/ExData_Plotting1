library(dplyr)

Data <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?","")))
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data$timetemp <- paste(Data$Date, Data$Time)
Data$Time <- strptime(Data$timetemp, format = "%Y-%m-%d %H:%M:%S")

Data1 <- subset(Data, Data$Date == "2007-02-01"|Data$Date == "2007-02-02")

png(filename = "plot3.png", width = 504, height = 504)

plot(Data1$Time, Data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(Data1$Time, Data1$Sub_metering_2, col = "red")
lines(Data1$Time, Data1$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1  ","Sub_metering_2  ","Sub_metering_3  "),lty = c(1, 1), lwd = c(1,1))

dev.off()
