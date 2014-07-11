
LANGUAGE = "en"

# Reading data from file into table. Missing values are coded as "?".

filename <- "./data/household_power_consumption.txt"
data_all <- read.table(filename, sep = ";", header = TRUE, na.strings = "?")

# Convert Date and Time variables into Data/Time classes and add additional DateTime 
# column. Conversion of character presentation of Date column into Date presentation

data_all$DateTime <- strptime(paste(data_all$Date, data_all$Time), "%d/%m/%Y %H:%M:%S")
data_all$Date <- as.Date(data_all$Date, "%d/%m/%Y")

# Convert dates 2007-02-01 and 2007-02-02 into Data class which is then used for 
# subsetting of dataframe.

dates_01_02feb07 <- as.Date(c("2007-02-01", "2007-02-02"), "%Y-%m-%d")
data_01_02feb07 <- subset(data_all, Date %in% dates_01_02feb07)

# Plot4. Plot Global Active Power, Voltage, Energy sub meterings and
# Global Reactive Power versus Time in a plot with four subplots

png("plot4.png", width=480, height=480)
par(mfcol = c(2, 2))

# Generate subplots column wise

# Subplot 1 - upper left corner

plot(data_01_02feb07$DateTime, data_01_02feb07$Global_active_power, 
     type = "l", ylab = "Global Active Power", xlab = "")

# Subplot 2 - lower left corner

plot(data_01_02feb07$DateTime, data_01_02feb07$Sub_metering_1, 
     type = "l", ylab = "Energy sub metering", xlab = "", col = "black")

points(data_01_02feb07$DateTime, data_01_02feb07$Sub_metering_2, type = "l", 
       xlab = "", ylab = "Sub_metering_2", col = "red")

points(data_01_02feb07$DateTime, data_01_02feb07$Sub_metering_3, type = "l", 
       xlab = "", ylab = "Sub_metering_3", col = "blue")

legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = 'n')


# Subplot 3 - upper right corner

plot(data_01_02feb07$DateTime, data_01_02feb07$Voltage, 
     type = "l", ylab = "Voltage", xlab = "datetime")


# Subplot 4 -lower right corner

plot(data_01_02feb07$DateTime, data_01_02feb07$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power", ylim = c(0, 0.5))


dev.off()












