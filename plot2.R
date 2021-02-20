
## Unzip the dataset
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
consumptionset <- read.table(unz(temp, "household_power_consumption.txt"),sep=";", header = T)
unlink(temp)

## Transform date and time conlumn to date/time classes in new column called "timedate"
consumptionset$timedate <-as.POSIXct(paste(consumptionset$Date, consumptionset$Time), format= "%d/%m/%Y %H:%M:%S")

## Subset data corresponding to date "2/2/2007 and 1/2/2007"
consumptionset <- consumptionset[(consumptionset$timedate >= "2007-02-01"
                                   & consumptionset$timedate < "2007-02-03"),]





## Open device, create png and close device
png(file="Plot2.png", width= 480, height=480)
plot(as.numeric(as.character(consumptionset$Global_active_power))
       ~ as.POSIXct(consumptionset$timedate), type="l", ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()


