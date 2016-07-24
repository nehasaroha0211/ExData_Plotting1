#Load in necessary libraries
library(data.table)

#Reads in data from file then subsets data for specified dates
a<- fread("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
b<- a[a$Date %in% c("1/2/2007", "2/2/2007"), ]

#Changing the format of date/time
c<- paste(b$Date, b$Time)
d<-strptime(c, "%d/%m/%Y %H:%M:%S")

plot3<- plot(d, b$Sub_metering_1, xlab= " ", ylab= "Energy sub metering", type = "l")
lines(d, b$Sub_metering_2, xlab= " ", ylab= "Energy sub metering", type = "l", col= "red")
lines(d, b$Sub_metering_3, xlab= " ", ylab= "Energy sub metering", type = "l", col= "blue")
legend("topright", "(x,y)", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("Black", "red", "blue"), lty=1)
