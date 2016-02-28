#######################Read a subset of data from a text file and plot##############################

#Read Table

a <- read.table("./household_power_consumption.txt",sep = ";",header = TRUE)

#Convert Date field from Factor to Date

a$Date <- as.Date(a$Date,"%d/%m/%Y")


#Subset data

b <- subset(a,a$Date >= "2007-02-01" & a$Date <= "2007-02-02")

#Convert Time to character

b$Time <- as.character(b$Time)


#Convert Global_active_power field from factor to numeric

b$Global_active_power <- as.numeric(as.character(b$Global_active_power))
b$Global_reactive_power <- as.numeric(as.character(b$Global_reactive_power))
b$Voltage <- as.numeric(as.character(b$Voltage))

b$Sub_metering_1 <- as.numeric(as.character(b$Sub_metering_1))
b$Sub_metering_2 <- as.numeric(as.character(b$Sub_metering_2))
b$Sub_metering_3 <- as.numeric(as.character(b$Sub_metering_3))

#Create a new column DateTime

b$DateTime <- paste(b$Date,b$Time)

#Convert the format of DateTime

b$DateTime <- strptime(b$DateTime,"%Y-%m-%d %H:%M:%S")

#plot

par(mfcol = c(2,2))
par(mar = c(4,4,1,1))

plot(b$DateTime,b$Global_active_power,"l",xlab = "",ylab = "Global Active Power")

plot(b$DateTime,b$Sub_metering_1,"n",xlab = "",ylab = "Energy sub metering")
points(b$DateTime,b$Sub_metering_1,"l",xlab = "",ylab = "")
points(b$DateTime,b$Sub_metering_2,"l",xlab = "",ylab = "", col = "red")
points(b$DateTime,b$Sub_metering_3,"l",xlab = "",ylab = "", col = "blue")

legend("topright",pch = "__", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(b$DateTime,b$Voltage,"l",xlab = "datetime",ylab = "Voltage")

plot(b$DateTime,b$Global_reactive_power,"l",xlab = "datetime",ylab = "Global_reactive_power")



#Copy to png

dev.copy(png,"Plot4.png")

#Close
dev.off()