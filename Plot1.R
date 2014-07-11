
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

# Plot1. Generate histogram.

png("plot1.png", width=480, height=480)

hist(data_01_02feb07$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()











