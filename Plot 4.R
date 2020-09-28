# Conjunto de datos

Data <-  read.table(file.path(pathdata, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]
head(Data)

# Sub conjuntos de datos

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetData$Global_active_power)
globalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)
subMetering1 <- as.numeric(SubSetData$Sub_metering_1)
subMetering2 <- as.numeric(SubSetData$Sub_metering_2)
subMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Creación de las gráficas

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) #Se define el número de filas y columnas en que estará dividida la gráfica

plot(DateTime, globalActivePower, #Se crea el primer gráfico
     type="l", 
     xlab="", 
     ylab="Global Active Power", 
     cex=0.2)

plot(DateTime, Voltage, #Segundo Gráfico
     type="l", 
     xlab="datetime", 
     ylab="Voltage")
plot(DateTime, subMetering1, #Tercer Gráfico
     type="l", 
     ylab="Energy Submetering", 
     xlab="")
lines(DateTime, subMetering2, 
      type="l", 
      col="red")
lines(DateTime, subMetering3, 
      type="l", 
      col="blue")
legend("topright", #Leyenda del tercer gráfico
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, 
       col=c("black", "red", "blue"), 
       bty="o")
plot(DateTime, globalReactivePower, # Cuarto gráfico
     type="l", 
     xlab="datetime", 
     ylab="Global_reactive_power")
dev.off() #Se cierra la instrucción






