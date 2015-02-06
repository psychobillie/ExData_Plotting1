df <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
df$dateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

feb <- df[df$dateTime>= strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S") & df$dateTime < strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S"),]
png('plot1.png')
hist(feb$Global_active_power, col='red', xlab='Global Active Power (killowats)', main="Global Active Power")
dev.off()