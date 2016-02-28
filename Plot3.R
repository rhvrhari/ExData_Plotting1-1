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

b$Sub_metering_1 <- as.numeric(as.character(b$Sub_metering_1))
b$Sub_metering_2 <- as.numeric(as.character(b$Sub_metering_2))
b$Sub_metering_3 <- as.numeric(as.character(b$Sub_metering_3))

#Create a new column DateTime

b$DateTime <- paste(b$Date,b$Time)

#Convert the format of DateTime

b$DateTime <- strptime(b$DateTime,"%Y-%m-%d %H:%M:%S")

#plot

plot(b$DateTime,b$Sub_metering_1,"n",xlab = "",ylab = "Energy sub metering")

points(b$DateTime,b$Sub_metering_1,"l",xlab = "",ylab = "")
points(b$DateTime,b$Sub_metering_2,"l",xlab = "",ylab = "", col = "red")
points(b$DateTime,b$Sub_metering_3,"l",xlab = "",ylab = "", col = "blue")

legend("topright",pch = "_______", col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


#Copy to png

dev.copy(png,"Plot3.png")

#Close
dev.off()