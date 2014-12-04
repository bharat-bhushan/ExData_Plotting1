#download the data file
url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
destfile<-'file.zip'
download.file(url,destfile, wget, quiet = FALSE, mode = "w",cacheOK = TRUE)
unzip('file.zip', files = NULL, list = FALSE, overwrite = TRUE,junkpaths = FALSE, exdir = ".", unzip = "internal",setTimes = FALSE)

#load the data file
file<-'household_power_consumption.txt'
data<-read.table(file, header = TRUE, sep = ";", quote = "",na.strings = c("NA","?"))

#combine data and time column to a date time column
data$DateTime<-strptime(paste(data$Date,data$Time), format, tz = "")

#filter data based on date criteria
dataFiltered<-data[data$DateTime>="2007-02-01" & data$DateTime<"2007-02-03",]

#plot3
graphics.off()
plot(dataFiltered$DateTime,dataFiltered$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(dataFiltered$DateTime,dataFiltered$Sub_metering_2,type="l",lty=1,lwd=1,pch=19,col="red")
points(dataFiltered$DateTime,dataFiltered$Sub_metering_3,type="l",lty=1,lwd=1,pch=19,col="blue")
legend("topright",legend=names(dataFiltered[7:9]),col=c("black", "red", "blue"),lty=c(1,1,1),lwd=c(1,1,1))
#png
png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(dataFiltered$DateTime,dataFiltered$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="")
points(dataFiltered$DateTime,dataFiltered$Sub_metering_2,type="l",lty=1,lwd=1,pch=19,col="red")
points(dataFiltered$DateTime,dataFiltered$Sub_metering_3,type="l",lty=1,lwd=1,pch=19,col="blue")
legend("topright",legend=names(dataFiltered[7:9]),col=c("black", "red", "blue"),lty=c(1,1,1),lwd=c(1,1,1))
dev.off()
