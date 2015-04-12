# This script reads the UCI Electric power consumption dataset and draw 
# the "Global Active Power" over the two days 2007-02-01 and 2007-02-02
# named "plot2.png" 
#
plot2  <- function() {
    
    # Read raw dataset 
    data <- read.table("./household_power_consumption.txt", 
                       header=TRUE, sep = ";",
                       na.string = "?")

    # Create a Date class columns variable based on the Date strings
    data$Dates <- as.Date(data$Date, format="%d/%m/%Y")
    # subset data based on dates we want to create the exploratory graph
    data <- data[data$Dates == "2007-02-01" | data$Dates == "2007-02-02",]
    
    # Create a Date and time columns variable based on the Date and Times strings
    data$Date.and.time <- as.POSIXct(paste(data$Date,data$Time), format="%d/%m/%Y%H:%M:%S")
    
    # Draw the "Global Active Power" over the two days 2007-02-01 and 2007-02-02
    # named "plot2.png" 
    png(file = "plot2.png")
    plot(data$Date.and.time, data$Global_active_power, 
         type="l", xlab="", ylab="Global Active Power (kilowatts) ")
    dev.off()         
}



