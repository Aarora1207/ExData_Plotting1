# Read and load subset of data for two days
Data <-read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")
Condition1 <- which(Data[,"Date"] == "1/2/2007")
Condition2 <- which(Data[,"Date"] == "2/2/2007")
Dataset1 <- Data[Condition1,]
Dataset2 <- Data[Condition2,]
Data_sub<- rbind(Dataset1,Dataset2)
Data_sub$DateTime <- with(Data_sub, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))
#Plotting the graph 1
hist(Data_sub$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
dev.copy(png,file = "Plot1.png")
dev.off()
