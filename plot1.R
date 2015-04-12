# This script reads the UCI Electric power consumption dataset and draw 
# the "Global Active Power" historam and write it to a file
# named "plot1.png" 
#
plot1  <- function() {
    
    # Read raw dataset 
    data <- read.table("./household_power_consumption.txt", 
                       header=TRUE, sep = ";",
                       na.strings = "?")
    
    # Create a Date class columns variable based on the Date strings
    data$Dates <- as.Date(data$Date, format="%d/%m/%Y")
    # subset data based on dates we want to create the exploratory graph
    data <- data[data$Dates == "2007-02-01" | data$Dates == "2007-02-02",]

    # Draw the "Global Active Power" historam and write it to a file
    # named "plot1.png" 
    #
    png(file = "plot1.png")
    hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", 
         col = "red", main = "Global Active Power")
    dev.off()         
}