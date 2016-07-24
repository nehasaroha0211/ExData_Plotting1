#Load in necessary libraries
library(data.table)

#Reads in data from file then subsets data for specified dates
a<- fread("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
b<- a[a$Date %in% c("1/2/2007", "2/2/2007"), ]

#Changing the format of date/time
c<- paste(b$Date, b$Time)
d<-strptime(c, "%d/%m/%Y %H:%M:%S")

plot2<- plot(d, b$Global_active_power, xlab= " ", ylim = c(0,6), ylab= "Global Active Power(Kilowatts)", type = "l")
