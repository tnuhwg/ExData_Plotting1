## Exploratory Data Analysis - Project Assignment #1

## Create a plot that matches the assigned plot.

plot1 <- function() {
    ## Read the data and restrict to Feb. 1-2, 2007.
    full_data <- data <- read.csv("household_power_consumption.txt", sep=";", 
                                  colClasses = "character")
    data <- full_data[full_data$Date == '1/2/2007' | full_data$Date == '2/2/2007', ]
    data[, 3] <- as.numeric(data[, 3])    
    
    ## Create the plot.
    filename = "plot1.png"
    png(file = filename, width = 480, height = 480, units = "px")
    hist(data$Global_active_power, col="red", 
         main="Global Active Power", 
         xlab="Global Active Power (kilowatts)"
    )
    dev.off()
    print(paste('Created ', filename))
}

