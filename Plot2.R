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

#Create a new column DateTime

b$DateTime <- paste(b$Date,b$Time)

#Convert the format of DateTime

b$DateTime <- strptime(b$DateTime,"%Y-%m-%d %H:%M:%S")

#plot

plot(b$DateTime,b$Global_active_power,"l",xlab = "",ylab = "Global Active Power (kilowatts)")

#Copy to png

dev.copy(png,"Plot2.png")

#Close
dev.off()