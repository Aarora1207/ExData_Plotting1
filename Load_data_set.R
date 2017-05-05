Data <-read.table("household_power_consumption.txt", header=T, sep=";", na.strings = "?")
Condition1 <- which(Data[,"Date"] == "1/2/2007")
Condition2 <- which(Data[,"Date"] == "2/2/2007")
Dataset1 <- Data[Condition1,]
Dataset2 <- Data[Condition2,]
Data_sub<- rbind(Dataset1,Dataset2)
Data_sub$DateTime <- with(Data_sub, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M"))
