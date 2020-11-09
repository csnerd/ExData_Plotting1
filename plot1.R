housePowerDataTable <- read.table("./household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";"  )

subDataSet <- subset(housePowerDataTable , housePowerDataTable$Date == "1/2/2007" | housePowerDataTable$Date == "2/2/2007" )


hist(as.numeric(as.character(subDataSet$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# setting title for The Graph
title(main="Global Active Power")