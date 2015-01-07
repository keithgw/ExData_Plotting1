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

# Convert Date and Time
dat$datetime <- with(dat, paste(Date, Time))
dat$datetime <- strptime(dat$datetime, "%d/%m/%Y %H:%M:%S")

# Subset 2007-02-01 and 2007-02-02
start <- "2007-02-01 00:00:00"
end <- "2007-02-03 00:00:00"
dat.obs <- subset(dat, datetime >= start & datetime < end)

# Open PNG Device
png(filename="plot2.png")

# Construct Plot (Global Active Power vs Time)
with(dat.obs, plot(datetime, Global_active_power, type='l',
                   xlab=NA, ylab ="Global Active Power (kilowatts)"))

# Close PNG Device
dev.off()
