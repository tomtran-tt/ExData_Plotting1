# This script reads the UCI Electric power consumption dataset and draw 
# the four graphs over the two days 2007-02-01 and 2007-02-02
# named "plot4.png" 
#
plot4  <- function() {
    
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

    # Draw the four graphs over the two days 2007-02-01 and 2007-02-02
    # named "plot4.png"
    #
    png(file = "plot4.png")
    # Create a 2x2 canvas
    par(mfrow=c(2,2), mar=c(4,4,2,4), oma=c(2,0,0,0))
    
    # Draw the first graph: Global Active Power vs DateTime
    plot(data$Date.and.time, data$Global_active_power, 
         type="l", xlab="", ylab="Global Active Power (kilowatts) ")
    
    # Draw the second graph: Voltage vs DateTime
    plot(data$Date.and.time, data$Voltage, type="l", xlab="datetime", ylab="Voltage")
    
    # Draw the third graph: Energy sub metering vs DateTime
    plot(data$Date.and.time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
    lines(data$Date.and.time, data$Sub_metering_2, col="red")
    lines(data$Date.and.time, data$Sub_metering_3, col="blue")
    legend("topright", pch = "__", col = c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    # Draw the fourth graph: Global Reactive Power vs DateTime
    plot(data$Date.and.time, data$Global_reactive_power, type="l", 
         xlab="datetime", ylab="Global_reactive_power")
    
    dev.off()         
}



