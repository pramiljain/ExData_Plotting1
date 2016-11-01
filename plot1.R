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

## Generating plot 1
plot_1 <- hist(hh_power_data_feb$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
