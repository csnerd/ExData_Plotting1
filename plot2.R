housePowerDataTable <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

subDataSet <- subset(housePowerDataTable , housePowerDataTable$Date == "1/2/2007" | housePowerDataTable$Date == "2/2/2007" )


subDataSet$Date <-as.Date(subDataSet$Date, format = "%d/%m/%y")

subDataSet$Time <- strptime(subDataSet$Time, format = "%H:%M:%S")

subDataSet[1:1440,"Time"] <- format(subDataSet[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subDataSet[1441:2880,"Time"] <- format(subDataSet[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# calling the basic plot function
plot(subDataSet$Time,as.numeric(as.character(subDataSet$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 


# setting title for The Graph
title(main="Global Active Power Vs Time")