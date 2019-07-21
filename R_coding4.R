## Retrive from Data.txt
paste(getwd(), "/Data.txt", sep = "") -> reading
read.table(reading, header = TRUE, sep = ";", dec = ".") -> Huge
library(dplyr)
arrange(Huge, Date) -> Huge
slice(Huge, c(21601:23040, 770797:772236), .preserve = TRUE) -> Q1

##Plot 4
Q1 -> Plot4
png("plot4.png", width = 480, height = 480)
par(mfcol = c(2,2))
#First
strptime(paste(Plot4$Date, Plot4$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot4$Global_active_power)/500 -> GAP
plot(TP, GAP,, xlab = "", 
  ylab = "Global Active Power (kilowatt)", type = "l")
#Second
strptime(paste(Plot4$Date, Plot4$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot4$Sub_metering_1) -> M1
as.numeric(Plot4$Sub_metering_2) -> M2
as.numeric(Plot4$Sub_metering_3) -> M3
plot(TP, M1, type = "l", xlab = "", ylab 
  = "Energy sub metering")
lines(TP, M2, type = "l", col = "red")
lines(TP, M3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", 
  "Sub_metering_2", 
  "Sub_metering_3"), lty=1, lwd=2.5, 
  col = c("black", "red", "blue"))
#Third
strptime(paste(Plot4$Date, Plot4$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot4$Voltage) -> VG
plot(TP, VG, type = "l", xlab = "datetime", ylab 
  = "Voltage")
#Fourth
strptime(paste(Plot4$Date, Plot4$Time, sep=" "), 
  "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot4$Global_reactive_power) -> GRP
plot(TP, GRP, type = "l", xlab = "datetime", ylab 
  = "Global Reactive Power")
dev.off()