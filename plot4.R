## Getting full dataset
hh_power_data <- 
  read.table("household_power_consumption.txt", 
            col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                          "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
            sep = ";", na.strings = "?", header = TRUE)

## Converting dates
hh_power_data$Date <- as.Date(hh_power_data$Date, format = "%d/%m/%Y")

## Subsetting the data
hh_power_data_feb <- subset(hh_power_data, (Date >= "2007-02-01") & (Date <= "2007-02-02"))
rm(hh_power_data)

## merging date and time
hh_power_data_feb$date_time <- paste(hh_power_data_feb$Date, hh_power_data_feb$Time)
hh_power_data_feb$date_time <- as.POSIXct(hh_power_data_feb$date_time)

## Generating plot 4

par(mfrow = c(2,2), mar = c(4,4,1,1))

Plot_4a <- plot(hh_power_data_feb$date_time,hh_power_data_feb$Global_active_power,type = "l",xlab ="", ylab = "Global Active Power")

Plot_4b <- plot(hh_power_data_feb$date_time,hh_power_data_feb$Voltage,type = "l",xlab ="datetime", ylab = "Voltage")

plot_4ca <- plot(hh_power_data_feb$date_time,hh_power_data_feb$Sub_metering_1,type = "l",xlab ="", ylab = "Energy Sub metering")
plot_4cb <- plot_4ca + lines(hh_power_data_feb$date_time, hh_power_data_feb$Sub_metering_2, col = "Red") 
plot_4cc <- plot_4cb + lines(hh_power_data_feb$date_time, hh_power_data_feb$Sub_metering_3, col = "Blue")
plot_4c <- plot_4cc + legend("topright", col = c("black", "red", "blue"),lty=1, lwd=2, bty="n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot_4d <- plot(hh_power_data_feb$date_time,hh_power_data_feb$Global_reactive_power,type = "l",xlab ="datetime", ylab = "Global_reactive_power")
