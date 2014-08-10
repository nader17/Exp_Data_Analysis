setwd("~/Exp_Data_Analysis")
getwd()

## make a path and file string
fn <- "~/Exp_Data_Analysis/household_power_consumption.txt"
ptm <- proc.time()
houshold <- read.table("household_power_consumption.txt", sep=";") 

proc.time() - ptm
library(sqldf)
library(tcltk2)
ptm <- proc.time()
## read file and select rows based on string "1/2/2007" and store in dataframe DF
data <- read.csv.sql(fn, sep=";",sql = 'select * from file where Date = "2/1/2007" OR Date = "2/2/2007"')
proc.time() - ptm
data$Date <- strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
## graphic plot1
png(filename="plot1.png", width = 480, height = 480, units = "px", pointsize = 12,
bg = "white", col = "red")
par(col.lab ="red")
hist(data$Global_active_power, col="blue")
##
dev.off()

