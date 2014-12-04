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

#plot1
graphics.off()
hist(dataFiltered$Global_active_power,col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#png
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(dataFiltered$Global_active_power,col = "red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()