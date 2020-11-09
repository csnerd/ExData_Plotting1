housePowerDataTable <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

subDataSet <- subset(housePowerDataTable , housePowerDataTable$Date == "1/2/2007" | housePowerDataTable$Date == "2/2/2007" )


subDataSet$Date <-as.Date(subDataSet$Date, format = "%d/%m/%y")

subDataSet$Time <- strptime(subDataSet$Time, format = "%H:%M:%S")

subDataSet[1:1440,"Time"] <- format(subDataSet[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subDataSet[1441:2880,"Time"] <- format(subDataSet[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic histogram plot function
plot(subDataSet$Time,as.numeric(as.character(subDataSet$Sub_metering_1)),type="l",xlab="",ylab="Energy sub metering") 

with(subDataSet,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subDataSet,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subDataSet,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
# setting title for The Graph
title(main="Energy sub-metering")

png("plot3.png", width=480, height=480)
