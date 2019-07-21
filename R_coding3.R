## Retrive from Data.txt
paste(getwd(), "/Data.txt", sep = "") -> reading
read.table(reading, header = TRUE, sep = ";", dec = ".") -> Huge
library(dplyr)
arrange(Huge, Date) -> Huge
slice(Huge, c(21601:23040, 770797:772236), .preserve = TRUE) -> Q1

##Plot 3
Q1 -> Plot3
strptime(paste(Plot3$Date, Plot3$Time, sep=" "), 
         "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot3$Sub_metering_1) -> M1
as.numeric(Plot3$Sub_metering_2) -> M2
as.numeric(Plot3$Sub_metering_3) -> M3
png("plot3.png", width = 480, height = 480)
plot(TP, M1, type = "l", xlab = "", ylab 
     = "Energy sub metering")
lines(TP, M2, type = "l", col = "red")
lines(TP, M3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", 
                     "Sub_metering_2", "Sub_metering_3"), lty=1, 
       lwd=2.5, col=c("black", "red", "blue"))
dev.off()
