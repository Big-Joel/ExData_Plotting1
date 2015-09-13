#Change this to your working directory:
setwd("~/Documents/exploratory_data1")
household_power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=TRUE)
#Fix the dates:
household_power_consumption<-transform(household_power_consumption,Date=as.Date(household_power_consumption$Date,format="%d/%m/%Y"))
consumption<-subset(household_power_consumption,household_power_consumption$Date=="2007-02-01" | household_power_consumption$Date=="2007-02-02")
hist(consumption$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()
