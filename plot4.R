png("plot4.png")
data <- read.csv('household_power_consumption.txt',skip=66636, nrows=2880, header=FALSE, sep=";")
data$date <- mapply(function(a,b){as.POSIXct(strptime(paste(a,b),format="%d/%m/%Y %H:%M:%S"))},data$V1,data$V2)
par(mfrow = c(2, 2))

with(data, plot(date, V3,type="n",xaxt = "n",xlab="",ylab="Global Active Power"))
lines(data$date,data$V3)
axis(1,c(min(data$date),min(data$date)+86400,min(data$date)+2*86400),labels=c("Thu","Fri","Sat"))

with(data, plot(date, V5,type="n",xaxt = "n",xlab="datatime",ylab="Voltage"))
lines(data$date,data$V5)
axis(1,c(min(data$date),min(data$date)+86400,min(data$date)+2*86400),labels=c("Thu","Fri","Sat"))


with(data, plot(date, V7,type="n",xaxt = "n",xlab="",ylab="Energy sub metering"))
lines(data$date,data$V7)
lines(data$date,data$V8,col="red")
lines(data$date,data$V9,col="blue")
axis(1,c(min(data$date),min(data$date)+86400,min(data$date)+2*86400),labels=c("Thu","Fri","Sat"))
legend("topright", bty = "n", lty=c(1,1,1), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

with(data, plot(date, V4,type="n",xaxt = "n",xlab="",ylab="Global_reactive_power"))
lines(data$date,data$V4)
axis(1,c(min(data$date),min(data$date)+86400,min(data$date)+2*86400),labels=c("Thu","Fri","Sat"))

dev.off()