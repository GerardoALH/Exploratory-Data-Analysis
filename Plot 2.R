# Conjunto de datos
Data <-  read.table(file.path(pathdata, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

head(Data)

# Creación de gráfico No. 2 -----------------------------------------------

# Formato de hora y fecha
Date_Time <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Creación del gráfico

png("plot2.png", width=480, height=480)
plot(Date_Time, GlobalActivePower, 
     type= 'l', # Se selecciona el tipo de lineas, en ?plot aparecen varios tipos
     xlab="", # Se deja sin espacio
     ylab="Global Active Power (kilowatts)") #Se traza la etiqueta del eje "y"
dev.off() # Se concluye la instrucción



