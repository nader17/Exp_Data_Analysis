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

## plot2
png(filename="plot2.png", width = 480, height = 480, units = "px", pointsize = 12,
bg = "transparent")
plot(data$Date, data$Global_active_power, type="l", xlab="", ylab="Global Active Power")

dev.off()
#

