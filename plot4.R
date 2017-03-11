## Alisha Adrian
## Course 4: Exploratory Data Analysis
## Project 1

## plot4.R

## read in all data
library(readr)
hpc <- read_delim("D:/Data_Science_Coursera/4._Exploratory_Data_Analysis/Project1/household_power_consumption.txt", 
                 ";", escape_double = FALSE, trim_ws = TRUE,
                 col_types = "ccddddddd")

## convert date and time variables
datetime = paste(hpc$Date,":",hpc$Time, sep="")
datetime = strptime(datetime,"%d/%m/%Y:%T")

## add my.time to hpc data frame
hpc = cbind(datetime,hpc)

## clean up
rm(datetime)

## select only data from 2007-02-01 and 2007-02-02
hpc.select = hpc[(hpc$datetime >= "2007-02-01 00:00:00") & (hpc$datetime <= "2007-02-02 23:59:59"),]

## clean up
rm(hpc)

## open png connection
png(filename="plot4.png", width=480, height=480, units="px")

## set to create a 2x2 layout of graphs
par(mfrow=c(2,2))

## create time series of Global Active Power
plot(hpc.select$datetime, hpc.select$Global_active_power,  col="black", type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## create time series of Voltage
plot(hpc.select$datetime, hpc.select$Voltage, col="black", type="l",
     ylab="Voltage", xlab="datetime")

## create time series of Energy Sub Metering w/ legend
plot(hpc.select$datetime, hpc.select$Sub_metering_1,  col="black", type="l",
     ylab="Energy sub metering", xlab="")
lines(hpc.select$datetime, hpc.select$Sub_metering_2,  col="red", type="l")
lines(hpc.select$datetime, hpc.select$Sub_metering_3,  col="blue", type="l")
legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black","red","blue"))

## create Global reactive power time series
plot(hpc.select$datetime, hpc.select$Global_reactive_power, col="black", type="l",
     ylab="Global_Reactive_Power", xlab="datetime")


## close  png connection
dev.off()

