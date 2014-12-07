########################
### COURSE PROJECT 1 ###
### PLOT 4           ###
########################

## Reading and preparing data
system.time(data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"))
head(data)

system.time(data$Date <- as.Date(data$Date, format = "%d/%m/%Y"))
head(data$Date)
class(data$Date)
system.time(data <- data[(data$Date == "2007-02-01") | (data$Date == "2007-02-02"), ])

system.time(x <- paste(data$Date, data$Time))
head(x)

system.time(data$Time <- strptime(x, format = "%Y-%m-%d %H:%M:%S"))
head(data$Time)
class(data$Time)

data$Global_active_power <- as.numeric(data$Global_active_power)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

## Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
    plot(x = Time, y = Global_active_power, type = "l", 
         xlab = "", ylab = "Global Active Power (kilowatts)")
    
    plot(x = Time, y = Voltage, type = "l", xlab = "datatime",
         ylab = "Voltage")
    
    plot(x = Time, y = Sub_metering_1, type = "l",
         xlab = "", ylab = "Energy sub metering")
    lines(x = Time, y = Sub_metering_2, col = "red")
    lines(x = Time, y = Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           border = "")
    
    plot(x = Time, y = Global_reactive_power, type = "l", xlab = "datatime",
         ylab = "Global _reactive_power")
})
dev.off()
