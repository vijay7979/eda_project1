
raw_power = read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep=";")
power = subset(raw_power, Date == "1/2/2007" | Date == "2/2/2007" )

#Converting Date and Time to date format
power$date_time = paste(power$Date, power$Time)
power$date_time = strptime(power$date_time, "%d/ %m/ %Y %H: %M: %S", tz="GMT")

#coverting character to numeric
power$Global_active_power = as.numeric(power$Global_active_power)
power$Global_reactive_power = as.numeric(power$Global_reactive_power)
power$Voltage = as.numeric(power$Voltage)
power$Sub_metering_1 = as.numeric(power$Sub_metering_1)
power$Sub_metering_2 = as.numeric(power$Sub_metering_2)
power$Sub_metering_3 = as.numeric(power$Sub_metering_3)

#Code for Plot 1
png(filename = "plot1.png", width = 480, height = 480)
hist(power$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (in kilowatts)")
dev.off()

