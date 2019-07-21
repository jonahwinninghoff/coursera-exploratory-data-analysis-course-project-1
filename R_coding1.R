## Retrive from Data.txt
paste(getwd(), "/Data.txt", sep = "") -> reading
read.table(reading, header = TRUE, sep = ";", dec = ".") -> Huge
library(dplyr)
arrange(Huge, Date) -> Huge
slice(Huge, c(21601:23040, 770797:772236), .preserve = TRUE) -> Q1

## Plot 1
Q1 -> Plot1
as.numeric(Plot1$Global_active_power)/500 -> 
  Plot1$Global_active_power
png("plot1.png", width = 480, height = 480)
with(Plot1, hist(Global_active_power, col = "red", xlab = 
  "Global Active Power (kilowatts)", main = 
  "Global Active Power"))
dev.off()