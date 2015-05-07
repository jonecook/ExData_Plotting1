#setwd("../ExploratoyDataAnalysis//Project1")
mydata = read.table("household_power_consumption.txt", header = TRUE, sep=";")
mydata$Date<-as.character(mydata$Date)
mydata$Time<-as.character(mydata$Time)
myclippeddata<-subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

myclippeddata$DateTime<-strptime(paste(myclippeddata$Date, myclippeddata$Time), "%d/%m/%Y %H:%M:%S")

#plot3
counts1 <- as.numeric(as.character(myclippeddata$Sub_metering_1))
counts2 <- as.numeric(as.character(myclippeddata$Sub_metering_2))
counts3 <- as.numeric(as.character(myclippeddata$Sub_metering_3))

png(filename="plot3.png", width=480, height =480)
plot(myclippeddata$DateTime, counts1, type="l",  xlab ="", ylab = "Energy sub metering")
lines(myclippeddata$DateTime, counts2, col="red")
lines(myclippeddata$DateTime, counts3, col="blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , 
       lty=1, col=c('black', 'red', 'blue'))
dev.off()

