#setwd("../ExploratoyDataAnalysis//Project1")
mydata = read.table("household_power_consumption.txt", header = TRUE, sep=";")
mydata$Date<-as.character(mydata$Date)
mydata$Time<-as.character(mydata$Time)
myclippeddata<-subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

myclippeddata$DateTime<-strptime(paste(myclippeddata$Date, myclippeddata$Time), "%d/%m/%Y %H:%M:%S")

#plot2
counts <- as.numeric(as.character(myclippeddata$Global_active_power))

png(filename="plot2.png", width=480, height =480)
plot(myclippeddata$DateTime, counts, type="l",  xlab ="", ylab = "Global Active Power (kilowatts)")
dev.off()
