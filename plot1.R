png("plot1.png")
data <- read.csv('household_power_consumption.txt',skip=66636, nrows=2880, header=FALSE, sep=";")
hist(data$V3,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()