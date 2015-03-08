## Unzip the downloaded zip folder and read the txt file
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings ="?", stringsAsFactors = FALSE)
library(dplyr)
data2 <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
hist(data2$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global active power (kilowatts)", bg = "transparent")
dev.off()
