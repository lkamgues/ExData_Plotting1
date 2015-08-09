data <- readLines("household_power_consumption.txt")
subset <- data[grep("^Date|^1/2/2007|^2/2/2007",data)]
mydata <- read.table(text=subset, sep=";", header=TRUE)
mydata$Date <- dmy(mydata$Date)
mydata$Date_Time <- ymd_hms(paste(as.character(mydata$Date),as.character(mydata$Time)))

png(file="plot2.png", width = 480, height = 480, units = "px")
plot2 <- plot(mydata$Date_Time, mydata$Global_active_power, type="l", 
              ylab="Global Active Power (Kilowatts)", xlab="")
dev.off()