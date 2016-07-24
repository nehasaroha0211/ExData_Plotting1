#Load in necessary libraries
library(data.table)

#Reads in data from file then subsets data for specified dates
#fread is a faster way of reading data
a<- fread("household_power_consumption.txt", sep=";", na.strings = "?", header=TRUE, stringsAsFactors = FALSE)
b<- a[a$Date %in% c("1/2/2007", "2/2/2007"), ]

#Changing the format of date/time
c<- paste(b$Date, b$Time)
d<-strptime(c, "%d/%m/%Y %H:%M:%S")

plot1<- hist(b$Global_active_power, col = "red", xlim= c(0,6), ylim = c(0, 1200), xlab = "Global Active Power(Killowatts)", ylab= "Frequency", main = "Global Active Power")
