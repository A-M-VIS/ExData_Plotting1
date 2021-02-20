
## Unzip the dataset
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
consumptionset <- read.table(unz(temp, "household_power_consumption.txt"),sep=";", header = T)
unlink(temp)

## Transform date conlumn to date classes
consumptionset$Date <- as.Date(consumptionset$Date, format = "%d/%m/%Y")

## Subset data corresponding to date "2/2/2007 and 1/2/2007"
consumptionset <- consumptionset[(consumptionset$Date == as.Date("2007-02-01")
                                   | consumptionset$Date == as.Date("2007-02-02")),]

## Open device, create png and close device
png(file="Plot1.png", width= 480, height=480)
hist(as.numeric(as.character(consumptionset[!is.na(as.numeric(as.character(consumptionset[,3]))),3])), 
     main="Global Active Power", col = "red", xlab="Global Active Power (kilowatts)")
dev.off()


