library(dplyr)

Data <- tbl_df(read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = c("?","")))
Data$Date <- as.Date(Data$Date, format = "%d/%m/%Y")
Data$timetemp <- paste(Data$Date, Data$Time)
Data$Time <- strptime(Data$timetemp, format = "%Y-%m-%d %H:%M:%S")

Data1 <- subset(Data, Data$Date == "2007-02-01"|Data$Date == "2007-02-02")

png(filename = "plot2.png", width = 504, height = 504)

plot(Data1$Time, Data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
