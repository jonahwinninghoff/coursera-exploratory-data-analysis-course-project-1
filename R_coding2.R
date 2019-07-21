## Retrive from Data.txt
paste(getwd(), "/Data.txt", sep = "") -> reading
read.table(reading, header = TRUE, sep = ";", dec = ".") -> Huge
library(dplyr)
arrange(Huge, Date) -> Huge
slice(Huge, c(21601:23040, 770797:772236), .preserve = TRUE) -> Q1

## Plot 2
Q1 -> Plot2
strptime(paste(Plot2$Date, Plot2$Time, sep=" "), 
         "%d/%m/%Y %H:%M:%S") -> TP
as.numeric(Plot2$Global_active_power)/500 -> GAP
png("plot2.png", width = 480, height = 480)
plot(TP, GAP,, xlab = "", 
     ylab = "Global Active Power (kilowatt)", type = "l")
dev.off()