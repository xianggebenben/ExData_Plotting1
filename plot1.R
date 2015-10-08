## load dataset Electric power consumption into R
epc <-read.table("household_power_consumption.txt",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
"Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?",sep =";",header = TRUE)
##convert column Date into Date type
epc$Date<-as.Date(as.character(epc$Date),"%d/%m/%Y");
##convert column Time into Character type
epc$Time<-as.character(epc$Time);
## extract the subset from the dates 2007-02-01 and 2007-02-02
plot1<-epc$Global_active_power[epc$Date>=as.Date("2007-02-01","%Y-%m-%d")&
epc$Date<as.Date("2007-02-03","%Y-%m-%d")]
## create a PNG file
png(file="plot1.png")
## plot the histgram and save the PNG file
hist(plot1,breaks=12,xlab ="Global Active Power(kilowatts)",main = "Global Active Power",col = "red")
## close the graphics device
dev.off()

