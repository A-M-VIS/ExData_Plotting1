
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
png(file="Plot3.png", width= 480, height=480)
plot(as.numeric(as.character(consumptionset$Sub_metering_1))
     ~ as.POSIXct(consumptionset$timedate), type="l", ylab = "Energy sub metering", xlab="")
lines(as.numeric(as.character(consumptionset$Sub_metering_2))
      ~ as.POSIXct(consumptionset$timedate),col= "red" )
lines(as.numeric(as.character(consumptionset$Sub_metering_3))
      ~ as.POSIXct(consumptionset$timedate),col= "blue" )
legend("topright" ,legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       col=c("black",  "red", "blue") ,lty=1 ,cex=0.9)
dev.off()


