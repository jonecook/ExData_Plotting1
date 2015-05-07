#setwd("../ExploratoyDataAnalysis//Project1")
mydata = read.table("household_power_consumption.txt", header = TRUE, sep=";")
mydata$Date<-as.character(mydata$Date)
myclippeddata<-subset(mydata, mydata$Date %in% c("1/2/2007", "2/2/2007"))

#plot1
counts <- as.numeric(as.character(myclippeddata$Global_active_power))

png(filename="plot1.png", width=480, height =480)
hist(counts, freq = TRUE, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
