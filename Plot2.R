data <- read.csv("household_power_consumption.txt", na.strings="?", sep=";")
data$Stamp <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data$Time <- strptime(data$Time, "%H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
days <- seq.Date(as.Date("2007-02-01"),as.Date("2007-02-02"),by="day")
dt <- data[data$Date %in% days,]

png("Plot2.png",  width = 480, height = 480, units = "px", bg = "transparent")
plot(x=dt$Stamp, y=dt$Global_active_power, ylab="Global Active Power (kilowatts)", type="l", xlab="")
dev.off()