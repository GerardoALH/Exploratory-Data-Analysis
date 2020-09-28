
# Creación de conjunto de datos -------------------------------------------

# Fichero

unzip(zipfile="household_power_consumption.zip",exdir="./data")

List_Docs <- list.files("./data/")

pathdata <- file.path("./data/")

Docs <- list.files(pathdata, recursive = TRUE)

# Conjunto de datos
Data <-  read.table(file.path(pathdata, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

head(Data)


# Creación de gráfico -----------------------------------------------------

globalActivePower <- as.numeric(SubSetData$Global_active_power)

png("plot1.png", width=480, height=480) # se guarda como archivo png

hist(globalActivePower, 
     col="red", # Color de la gráfica
     main="Global Active Power", # Titulo de la gráfica
     xlab="Global Active Power (kilowatts)") #etiqueta del gráfico en el eje "x"

dev.off() # se cierra el proceso de guardado.



