data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Stamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
days <- seq.Date(as.Date("2007-02-01"),as.Date("2007-02-02"),by="day")
dt <- data[data$Date %in% days,]

png("Plot3.png",  width = 480, height = 480, units = "px", bg = "transparent")
plot(y=dt$Sub_metering_1, x=dt$Stamp, ylab="Energy sub metering", type="l", xlab="")
lines(x=dt$Stamp, y=dt$Sub_metering_2, col="red")
lines(x=dt$Stamp, y=dt$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c('black','red','blue'), lty = c(1,1,1))
dev.off()