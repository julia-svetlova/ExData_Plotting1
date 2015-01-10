#Loading the data.  
#Assuming that the text file is saved in the working direcotory

data<-read.table("./household_power_consumption.txt"
                 ,header=TRUE
                 ,sep=";"
                 ,stringsAsFactors=FALSE
                 ,na.strings = "?"
)
# Converting dates and extracting data for 2007-02-01 and 2007-02-02
data<-data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Making Plots
png("./plot4.png ", width=480, height=480, units="px")

par(mfrow=c(2,2))

#Global Active Power
plot(data$DateTime, data$Global_active_power,type="l",xlab="",ylab= "Global Active Power (kilowatts)")

# Voltage
plot(data$DateTime, data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#Energy sub metering
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'), bty = 'n')

# Global_reactive_power
plot(data$DateTime, data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off() 