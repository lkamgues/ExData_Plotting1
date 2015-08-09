data <- readLines("household_power_consumption.txt")
subset <- data[grep("^Date|^1/2/2007|^2/2/2007",data)]
mydata <- read.table(text=subset, sep=";", header=TRUE)
mydata$Date <- dmy(mydata$Date)
mydata$Date_Time <- ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time)))

png(file="plot1.png", width = 480, height = 480, units = "px")
plot1<-hist(mydata$Global_active_power, col="red", main="Global Active Power",
            xlab="Global Active Power (Kilowatts)" )
dev.off()