data <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings=c("?"))
subdata <- subset(data,data$Date == "1/2/2007" | data$Date == "2/2/2007")
subdata$Datetime <- with(subdata, as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))
png("plot4.png")
par(mfrow=c(2,2))
with(subdata, plot( Datetime,Global_active_power, type="o", pch=".", xlab="", ylab="Global Active Power"))

with(subdata, plot( Datetime, Voltage, type="o", pch=".", xlab="datetime", ylab="Voltage"))

with(subdata, plot(Datetime, Sub_metering_1, type="o", xlab="", ylab="Energy sub metering", pch="."))
with(subdata, lines(Datetime, Sub_metering_2, col="red", type="o", pch="."))
with(subdata, lines(Datetime, Sub_metering_3, col="blue", type="o", pch="."))
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(2.5,2.5),col=c("black","red","blue"), box.lwd = 0)

with(subdata, plot( Datetime, Global_reactive_power, type="o", pch=".", xlab="datetime", ylab="Global_reactive_power"))
dev.off()
