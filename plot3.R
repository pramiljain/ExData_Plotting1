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

## Generating plot 3
plot_3 <- plot(hh_power_data_feb$date_time,hh_power_data_feb$Sub_metering_1,type = "l",xlab ="", ylab = "Global Active Power (kilowatts)")
plot_3a <- plot_3 + lines(hh_power_data_feb$date_time, hh_power_data_feb$Sub_metering_2, col = "Red") 
plot_3b <- plot_3a + lines(hh_power_data_feb$date_time, hh_power_data_feb$Sub_metering_3, col = "Blue")
plot_3c <- plot_3b + legend("topright", col = c("black", "red", "blue"),lty=1, lwd=2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
