# This script reads the UCI Electric power consumption dataset and draw 
# the "Sub_meeting_1 2 and 3" over the two days 2007-02-01 and 2007-02-02
# named "plot3.png" 
#
plot3  <- function() {
    
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
    

    # Draw the "Sub_meeting_1 2 and 3" over the two days 2007-02-01 and 2007-02-02
    # named "plot3.png" 
    #
    png(file = "plot3.png")
    plot(data$Date.and.time, data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
    lines(data$Date.and.time, data$Sub_metering_2, col="red")
    lines(data$Date.and.time, data$Sub_metering_3, col="blue")
    legend("topright", pch = "__", col = c("black","red","blue"), 
           legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    dev.off()         
}



