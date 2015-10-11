# set the working directory 
setwd('C:/datafile/path')

inputfile <- "household_power_consumption.txt"

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# 2880 rows out of 2,075,259 rows
rawdata <- read.table(inputfile, header = TRUE, sep = ";", na.strings = "?")
data<-rawdata[which((rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007")),]
# Date     Time Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1
# 5  1/2/2007 00:00:00               0.326                 0.128  243.15              1.4              0
# Sub_metering_2 Sub_metering_3
# 5               0              0

png(filename = "plot4.png", bg = "transparent", 
    width = 480, height = 480, units = "px"
)

# multiplot 2x2
par(mfrow = c(2,2))

### first subplot
plot(data$Global_active_power,
     type = "l",
     xlab = "", 
     ylab="Global Active Power",
     xaxt = "n"
)
# Make x axis using Thu-Sat labels
xmax <- nrow(data)
axis(1, at=c(0,xmax/2,xmax), lab=c("Thu","Fri","Sat"))

### second subplot
plot(data$Voltage,
     type = "l",
     xlab = "datetime", 
     ylab="Voltage",
     xaxt = "n"
)
# Make x axis using Thu-Sat labels
xmax <- nrow(data)
axis(1, at=c(0,xmax/2,xmax), lab=c("Thu","Fri","Sat"))

### third subplot
plot(data$Sub_metering_1,
     type = "l",
     xlab = "", 
     ylab="Energy sub metering",
     xaxt = "n"
     )
lines(data$Sub_metering_2, col = "red")
lines(data$Sub_metering_3, col = "blue")
legend('topright', names(data)[c(7,8,9)], 
       col=c('black', 'red', 'blue'),
       lty = 1, 
       bty='n'
       )
# Make x axis using Thu-Sat labels
xmax <- nrow(data)
axis(1, at=c(0,xmax/2,xmax), lab=c("Thu","Fri","Sat"))

### fourth subplot
plot(data$Global_reactive_power,
     type = "l",
     xlab = "datetime", 
     ylab="Global_reactive_power",
     xaxt = "n"
)
# Make x axis using Thu-Sat labels
xmax <- nrow(data)
axis(1, at=c(0,xmax/2,xmax), lab=c("Thu","Fri","Sat"))

dev.off()

