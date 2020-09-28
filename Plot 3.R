
# Conjunto de datos -------------------------------------------------------

Data <-  read.table(file.path(pathdata, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

head(Data)

# Subconjutnos de datos para las gráficas 

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetData$Global_active_power)
subMetering1 <- as.numeric(SubSetData$Sub_metering_1)
subMetering2 <- as.numeric(SubSetData$Sub_metering_2)
subMetering3 <- as.numeric(SubSetData$Sub_metering_3)


# Creación de gráfico -----------------------------------------------------



png("plot3.png", width=480, height=480)
plot(DateTime, subMetering1, #Datos a graficar
     type="l", 
     ylab="Energy Submetering", 
     xlab="")
lines(DateTime, subMetering2, # Se traza la segunda linea
      type="l", 
      col="red")
lines(DateTime, subMetering3, # Se traza la tercera linea
      type="l", 
      col="blue")
legend("topright", #Se dibujan las etiquetas (topright = arriba a la derecha)
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), #Se da nombre a las etiquetas a traves de un vector
       lty=1, 
       lwd=2.5, 
       col=c("black", "red", "blue")) #Se colorean las etiquetas con un vector. Se colorea según el orden de los atributos dibujados

dev.off()


