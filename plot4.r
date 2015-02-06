df <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
df$dateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

feb <- df[df$dateTime>= strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S") & df$dateTime < strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S"),]
png('plot4.png')
par(mfrow=c(2,2))
plot(feb$dateTime, feb$Global_active_power, type='l',  xlab= '', ylab='Global Active Power')
plot(feb$dateTime, feb$Voltage, type='l',  xlab= 'datetime', ylab='Voltage')
plot(feb$dateTime, feb$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(feb$dateTime, feb$Sub_metering_2, type = "l",  col = "red")
lines(feb$dateTime, feb$Sub_metering_3, type = "l",  col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c('black', 'red', 'blue'), bty='n')
plot(feb$dateTime, feb$Global_reactive_power, type='l', xlab= 'datetime', ylab='Global_reactive_power')
dev.off()