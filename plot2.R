setwd("C:\\Coursera\\R\\EDA\\Data")

# Reading the subset of datasource based on the date criteria

data <- read.table(".\\household_power_consumption.txt", header = F, sep = ";",
                 skip = grep("31/1/2007.23:59:00", 
                 readLines(".\\household_power_consumption.txt")), nrow = 2880)

# Assigning the columnnames for the dataframe

names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power",
                 "Voltage", "Global_intensity", "Sub_metering_1",
                 "Sub_metering_2", "Sub_metering_3")

# Translating the character fromat of the date column to Date
data$Date <- as.Date(as.character(data$Date),"%d/%m/%Y")

# concatenating the date & time and simualtaneously translating into proper date and time format
data$Time <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# Plot2

plot(data$Time, data$Global_active_power, pch = "." , xlab = "",
     ylab = "Global Active Power (Kilowatts)")
lines(data$Time, data$Global_active_power)


dev.copy(png, ".\\plot2.png", width = 480, height = 480)
dev.off()
