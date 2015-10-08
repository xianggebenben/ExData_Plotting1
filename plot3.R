rm(list=ls());
## load dataset Electric power consumption into R
epc <-read.table("household_power_consumption.txt",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                                                                 "Sub_metering_1","Sub_metering_2","Sub_metering_3"),na.strings = "?",sep =";",header = TRUE)
##convert column Date into Date type
epc$Date<-as.Date(as.character(epc$Date),"%d/%m/%Y");
##convert column Time into Character type
epc$Time<-as.character(epc$Time);
## extract the subset from the dates 2007-02-01 and 2007-02-02
con <-epc$Date>=as.Date("2007-02-01","%Y-%m-%d")&
  epc$Date<as.Date("2007-02-03","%Y-%m-%d")
y_1<-epc$Sub_metering_1[con]
y_2<-epc$Sub_metering_2[con]
y_3<-epc$Sub_metering_3[con]
date<-epc$Date[con]
time <-epc$Time[con]
x<-strptime(paste(date,time),"%Y-%m-%d %H:%M:%S")
## create a PNG file
png(file="plot3.png")
## plot the graphics and save the PNG file
par(mfrow=c(1,1))
plot(x,y_1,type = "l",ylab ="Energy sub metering",xlab ="")
points(x,y_2,col="red",type="l")
points(x,y_3,col="blue",type ="l")
legend("topright",lty = 1,legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("black","red","blue"))
## close the graphics device
dev.off()

