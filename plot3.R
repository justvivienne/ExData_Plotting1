## Unzip the downloaded zip folder and read the txt file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)
library(dplyr)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
Date <- as.vector(data2$Date)
Time <- as.vector(data2$Time)
x <- paste(Date, Time)
mergedTime <- strptime(x, "%d/%m/%Y %H:%M:%S")
data3 <- cbind(data2, mergedTime)
png(filename = "plot3.png", bg = "transparent")
with(data3, plot(mergedTime, Sub_metering_1, type = "n", xlab = NA, ylab = "Energy sub metering"), plot(mergedTime, Sub_metering_2, type = "n"), plot(mergedTime, sub_metering_3, type = "n"))
lines(data3$mergedTime, data3$Sub_metering_1)
lines(data3$mergedTime, data3$Sub_metering_2, col = "red")
lines(data3$mergedTime, data3$Sub_metering_3, col = "blue")
legend("topright", lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
