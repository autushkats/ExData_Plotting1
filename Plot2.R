## Plot2.R
## Global Active Power
## Read and filter the data
## -------------------------
data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?",colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# convert date info in format 'mm/dd/yyyy'
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# select data from 2007-02-01 to 2007-02-02
dataSelect <- data[(data$Date >= "2007-02-01" & data$Date <="2007-02-02"),]
## Make Plot
## ----------
par(col = "black", mfcol = c(1, 1))

plot( dataSelect$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "", xaxt="n")
## axis x
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))
## Copy my plot to a PNG file
dev.copy(png, file = "figure/plot2.png", width=480, height=480)
dev.off()       ## Close teh PNG device