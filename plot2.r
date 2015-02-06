df <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
df$dateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

feb <- df[df$dateTime>= strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S") & df$dateTime < strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S"),]
png('plot2.png')
plot(feb$dateTime, feb$Global_active_power, type='l',  xlab= '', ylab='Global Active Power (killowats)')
dev.off()