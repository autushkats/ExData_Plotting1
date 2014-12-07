## Plot4.R
## Global Active Power
## Read and filter the data
## -------------------------
data <- read.csv("household_power_consumption.txt", sep=";", na.strings = "?"lClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
# convert date info in format 'mm/dd/yyyy'
data$Date <- as.Date(data$Date, "%d/%m/%Y")
# select data from 2007-02-01 to 2007-02-02
dataSelect <- data[(data$Date >= "2007-02-01" & data$Date <="2007-02-02"),]

## Make Plot
## ----------
par(col = "black", mfcol = c(2, 2))

## plot1
## -----
plot(dataSelect$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "", xaxt="n")
## axis x
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

## plot2
## -----
a1 = as.numeric(dataSelect$Sub_metering_1)
a2 = as.numeric(dataSelect$Sub_metering_2)
a3 = as.numeric(dataSelect$Sub_metering_3)
plot( a1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "", xaxt="n")
lines( a2, type = "l", col = "red")
lines( a3, type = "l", col = "blue")
## legend
leg.txt <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", bty = "n", legend = leg.txt, lwd=c(1,1,1), col=c("black","red","blue"), cex= 0.25)
## axis x
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

## plot3
## -----
plot(dataSelect$Voltage, type = "l", ylab = "Voltage", xlab = "datetime", xaxt="n")
## axis x
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

## plot4
## -----
plot( dataSelect$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime", xaxt="n")
## axis x
axis(1, at=c(1, 1440, 2880),labels = c("Thu", "Fri", "Sat"))

## Copy my plot to a PNG file
dev.copy(png, file = "figure/plot4.png", width=480, height=480)
dev.off()       ## Close teh PNG device