# set the working directory 
setwd('C:/datafile/path')
inputfile <- "household_power_consumption.txt"

# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
# 2880 rows out of 2,075,259 rows
rawdata <- read.table(inputfile, header = TRUE, sep = ";", na.strings = "?")
data<-rawdata[which((rawdata$Date == "1/2/2007") | (rawdata$Date == "2/2/2007")),]

png(filename = "plot1.png", bg = "transparent", 
    width = 480, height = 480, units = "px"
)

hist(data$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     ylim = c(0, 1200),
     col="red")

dev.off()

