## Exploratory Data Analysis - Project Assignment #1

## Create a plot that matches the assigned plot #4.

plot4 <- function() {
    ## Read the data and restrict to Feb. 1-2, 2007.
    full_data <- read.csv("household_power_consumption.txt", sep=";", 
                          colClasses = "character")
    data <- full_data[full_data$Date == '1/2/2007' | full_data$Date == '2/2/2007', ]
    data[, 3] <- as.numeric(data[, 3])
    data[, 4] <- as.numeric(data[, 4])
    data[, 5] <- as.numeric(data[, 5])
    data[, 7] <- as.numeric(data[, 7])
    data[, 8] <- as.numeric(data[, 8])
    data[, 9] <- as.numeric(data[, 9])
    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Create the plot.
    filename = "plot4.png"
    png(file = filename, width = 480, height = 480, units = "px")
    
    #Divide the screen in 2 columns and 2 lines
    par(mfrow=c(2,2))

    # Top left chart    
    plot(Global_active_power~datetime, data=data, type="l", 
         xlab="", ylab="Global active power")
    
    # Top right chart
    plot(Voltage~datetime, data=data, type="l", 
         xlab="datetime", ylab="Voltage")
    
    # Bottom left chart
    plot(Sub_metering_1~datetime, data=data, type="l", 
         xlab="", ylab="Energy sub metering")
    lines(Sub_metering_2~datetime, data=data, col="red")
    lines(Sub_metering_3~datetime, data=data, col="blue")
    legend("topright", bty="n",
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           col=c("black", "red", "blue"),
           lty=c(1, 1, 1))

    # Bottom right chart
    plot(Global_reactive_power~datetime, data=data, type="l")
    
    dev.off()
    print(paste('Created ', filename))
}

