## Exploratory Data Analysis - Project Assignment #1

## Create a plot that matches the assigned plot #3.

plot3 <- function() {
    ## Read the data and restrict to Feb. 1-2, 2007.
    full_data <- read.csv("household_power_consumption.txt", sep=";", 
                          colClasses = "character")
    data <- full_data[full_data$Date == '1/2/2007' | full_data$Date == '2/2/2007', ]
    data[, 7] <- as.numeric(data[, 7])
    data[, 8] <- as.numeric(data[, 8])
    data[, 9] <- as.numeric(data[, 9])
    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Create the plot.
    filename = "plot3.png"
    png(file = filename, width = 480, height = 480, units = "px")
    
    plot(Sub_metering_1~datetime, data=data, type="l", 
         xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~datetime, data=data, col="red")
    lines(Sub_metering_3~datetime, data=data, col="blue")
    legend("topright", 
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lty=c(1, 1, 1))
    dev.off()
    print(paste('Created ', filename))
}

