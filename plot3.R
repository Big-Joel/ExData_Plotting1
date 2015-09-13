#Change this to your working directory:
setwd("~/Documents/exploratory_data1")
household_power_consumption<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=TRUE)
#Fix the dates:
household_power_consumption<-transform(household_power_consumption,Date=as.Date(household_power_consumption$Date,format="%d/%m/%Y"))
consumption<-subset(household_power_consumption,household_power_consumption$Date=="2007-02-01" | household_power_consumption$Date=="2007-02-02")
consumption<-transform(consumption, Date=strptime(paste(consumption$Date,consumption$Time),format="%Y-%m-%d %H:%M:%S"))
plot.new()
with(consumption, plot(Date,Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(consumption, lines(Date,Sub_metering_2,col="red"))
with(consumption, lines(Date,Sub_metering_3,col="blue"))
legend("topright", lty=1, cex=0.7, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png,file="plot3.png",width = 480, height = 480)
dev.off()
