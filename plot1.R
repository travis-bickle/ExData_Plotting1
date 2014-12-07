########################
### COURSE PROJECT 1 ###
### PLOT 1           ###
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

## Plot1
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power/500, main = "Global Active Power",
xlab = "Global Active Power (kilowatts)", col = "orangered")
dev.off()