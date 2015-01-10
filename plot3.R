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

#Making Plot
png("./plot3.png ", width=480, height=480, units="px")

plot(data$DateTime,data$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c('black', 'red', 'blue'))

dev.off() 