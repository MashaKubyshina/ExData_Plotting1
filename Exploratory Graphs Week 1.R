##Exploratory Graphs Week 1 - Exam

##clone the repository
##https://github.com/MashaKubyshina/ExData_Plotting1.git

##download data and create a subset for the 2 days with correct date and time labels
PowerData <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
PowerDataSubset <- subset(PowerData, Date %in% c("1/2/2007","2/2/2007"))
PowerDataSubset$Date <- as.Date(PowerDataSubset$Date, format="%d/%m/%Y")
TimeSubset <- paste(as.Date(PowerDataSubset$Date), PowerDataSubset$Time)
PowerDataSubset$Datetime <- as.POSIXct(TimeSubset)

###############

##Plot 1 Frequency x Global Active Power
library(datasets)
hist(PowerDataSubset$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

##save plot as png and turn device off
dev.copy(png, file="Plot1.png", width=480, height=480)
dev.off()

################

##Plot 2 Global Active Power in kilowatts x Thr, Fri, Sat
library(datasets)
with(PowerDataSubset, {
    plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    })

##save it as png
dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()

##another way to construct the same plot (plot 2)
plot(PowerDataSubset$Global_active_power ~ PowerDataSubset$Datetime, 
     type="l", xlab="", ylab="Global Active Power (kilowatts)" )

##save it as png
dev.copy(png, file="Plot2.png", width=480, height=480)
dev.off()

################

##Plot 3 Energy submetering x Thr, Fri, Sat
##sub-metering 1 = black
##sub-metering 2 = red
##sub-metering 3 = blue

##check on the column names
head(PowerDataSubset)
with(PowerDataSubset, {
     plot(Sub_metering_1~Datetime, type="l", ylab = "Energy Sub Metering", xlab=" ")
    lines(Sub_metering_2~Datetime, col="red")
    lines(Sub_metering_3~Datetime, col="blue")
    })
legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), 
       legend = c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"))
   
##Save as png
dev.copy(png, file="Plot3.png", width=480, height=480)
dev.off()

##################

##Plot 4 - a group of 4 plots

##plot 1 = Plot 2 from this homework
##plot 2 = Voltage x Datetime
##plot 3 = plot 3 from this homework
##plot 4 = Global reactive power x Datetime

##to start look at the head of PowerDataSubset
head(PowerDataSubset)

par(mfrow = c(2,2), mar = c(4,4,2,1))
with(PowerDataSubset, {
    plot(Global_active_power~Datetime, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    plot(Voltage~Datetime, type="l")
    plot(Sub_metering_1~Datetime, type="l", ylab = "Energy Sub Metering", xlab=" ")
    lines(Sub_metering_2~Datetime, col="red")
    lines(Sub_metering_3~Datetime, col="blue")
    legend("topright", lty=1, lwd=2, col=c("black", "red", "blue"), 
           legend = c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"))
    plot(Global_reactive_power~Datetime, type="l")
})

##Save as png
dev.copy(png, file="Plot4.png", width=480, height=480)
dev.off()