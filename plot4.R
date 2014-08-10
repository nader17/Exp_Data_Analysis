setwd("~/Exp_Data_Analysis")
getwd()

## make a path and file string
fn <- "~/Exp_Data_Analysis/household_power_consumption.txt"
## all_data <- read.table("household_power_consumption.txt", sep=";") 

library(sqldf)
library(tcltk2)

## read file and select rows based on string "1/2/2007" and store in dataframe DF
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "1/2/2007" OR Date = "2/2/2007"')

data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")

## plot4
png(filename="plot4.png", width = 480, height = 480, units = "px", pointsize = 12,
bg = "transparent")

## mfrow (2,2)
par(mfrow = c(2,2), mar = c(4,4,2,1))
## first one  
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")
## second one
plot(data$Date, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
## third one
plot(data$Date, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data$Date, data$Sub_metering_2, type="l", col="red")
lines(data$Date, data$Sub_metering_3, type="l", col="blue")
legend("topright", names(data)[7:9], col=c('black', 'red', 'blue'),lty=2)
## fourth one
plot(data$Date, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
#

