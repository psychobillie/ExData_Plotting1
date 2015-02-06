#Load date via local csv
df <- read.csv('household_power_consumption.txt', sep=';', na.strings='?')
#create datetime column with date time objects
df$dateTime <- strptime(paste(df$Date, df$Time), format='%d/%m/%Y %H:%M:%S')

#select specific date range using row slicing
feb <- df[df$dateTime>= strptime('2007-02-01 00:00:00', "%Y-%m-%d %H:%M:%S") & df$dateTime < strptime('2007-02-03 00:00:00', "%Y-%m-%d %H:%M:%S"),]
#open graphic device
png('plot2.png')
#draw plot
plot(feb$dateTime, feb$Global_active_power, type='l',  xlab= '', ylab='Global Active Power (killowats)')
#close the device
dev.off()