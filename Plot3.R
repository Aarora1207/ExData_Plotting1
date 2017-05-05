# Read and load subset of data for two days
Data <-read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")
Condition1 <- which(Data[,"Date"] == "1/2/2007")
Condition2 <- which(Data[,"Date"] == "2/2/2007")
Dataset1 <- Data[Condition1,]
Dataset2 <- Data[Condition2,]
Data_sub<- rbind(Dataset1,Dataset2)
Data_sub$DateTime <- with(Data_sub, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))
#Plotting the graph 3
plot(Data_sub$Sub_metering_1 ~ Data_sub$DateTime, type="l", xlab= "", ylab="Energy Sub Metering")
lines(Data_sub$Sub_metering_2 ~ Data_sub$DateTime, col = 'Red')
lines(Data_sub$Sub_metering_3 ~ Data_sub$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file = "Plot3.png")
dev.off()
