data <- readLines("household_power_consumption.txt")
subset <- data[grep("^Date|^1/2/2007|^2/2/2007",data)]
mydata <- read.table(text=subset, sep=";", header=TRUE)
mydata$Date <- dmy(mydata$Date)
mydata$Date_Time <- ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time)))
png(file="plot3.png", width = 480, height = 480, units = "px")
plot3 <-plot(mydata$Date_Time, mydata$Sub_metering_1, type="l", 
             xlab="", ylab="Energy sub metering")
lines(mydata$Date_Time, mydata$Sub_metering_2, type="l",col="red")
lines(mydata$Date_Time, mydata$Sub_metering_3, type="l",col="blue")
legend("topright", lty=1,col=c("black","red","blue"), bty="n",legend = names(mydata)[7:9])

dev.off()