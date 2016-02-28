#######################Read a subset of data from a text file and plot##############################

#Read Table

a <- read.table("./household_power_consumption.txt",sep = ";",header = TRUE)

#Convert Date field from Factor to Date

a$Date <- as.Date(a$Date,"%d/%m/%Y")

#Subset data

b <- subset(a,a$Date >= "2007-02-01" & a$Date <= "2007-02-02")

#Convert Global_active_power field from factor to numeric

b$Global_active_power <- as.numeric(as.character(b$Global_active_power))

#plot Histogram

hist(b$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",main = "Global Active Power")

#Coy to png

dev.copy(png,"Plot1.png")

#Close the png file

dev.off()