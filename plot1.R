## Data comes from the UC Irvine Machine Learning Repository:
## http://archive.ics.uci.edu/ml/
##
## Data Set:  Electric Power Consumption
##
## Description:  Measurements of electric power consumption in one household
##    with a one-minute sampling rate over a period of almost 4 years. 
##    Different electrical quantities and some sub-metering values are available.
##
## Missing Values coded as '?'

# Read Data
colClasses <- c('character', 'character', 'numeric', 
                'numeric', 'numeric', 'numeric', 
                'numeric', 'numeric', 'numeric')
dat <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   colClasses=colClasses, na.strings="?")

# Convert Date to Date object
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")

# Subset 2007-02-01 and 2007-02-02
dat.obs <- subset(dat, Date >= "2007-02-01" & Date <= "2007-02-02")

# Open PNG Device
png(filename="plot1.png")
# Construct Plot (Histogram of Global Active Power)
with(dat.obs, hist(Global_active_power, 
                   col='red', 
                   main="Global Active Power", 
                   xlab = "Global Active Power (kilowatts)"))

# Close PNG Device
dev.off()
