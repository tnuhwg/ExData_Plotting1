## Exploratory Data Analysis - Project Assignment #1

## Create a plot that matches the assigned plot #2.

plot2 <- function() {
    ## Read the data and restrict to Feb. 1-2, 2007.
    full_data <- read.csv("household_power_consumption.txt", sep=";", 
                          colClasses = "character")
    data <- full_data[full_data$Date == '1/2/2007' | full_data$Date == '2/2/2007', ]
    data[, 3] <- as.numeric(data[, 3])
    data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
    
    ## Create the plot.
    filename = "plot2.png"
    png(file = filename, width = 480, height = 480, units = "px")
    
    plot(Global_active_power~datetime, data=data, type="l", 
         xlab="", ylab="Global active power (kilowatts)")
    dev.off()
    print(paste('Created ', filename))
}

