---
title: "Untitled"
author: "GerardoALH"
date: "28/9/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = FALSE)
```

## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, we will be using the "Individual household
electric power consumption Data Set" which I have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>Date</b>: Date in format dd/mm/yyyy </li>
<li><b>Time</b>: time in format hh:mm:ss </li>
<li><b>Global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>Global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>Voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>Global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>Sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>Sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>Sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data





When loading the dataset into R, please consider the following:

* The dataset has 2,075,259 rows and 9 columns. First
calculate a rough estimate of how much memory the dataset will require
in memory before reading into R. Make sure your computer has enough
memory (most modern computers should be fine).

* We will only be using data from the dates 2007-02-01 and
2007-02-02. One alternative is to read the data from just those dates
rather than reading in the entire dataset and subsetting to those
dates.

* You may find it useful to convert the Date and Time variables to
Date/Time classes in R using the `strptime()` and `as.Date()`
functions.

* Note that in this dataset missing values are coded as `?`.


## Making Plots

Our overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. Your task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First you will need to fork and clone the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)


For each plot you should

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. Your code file **should include code for reading
the data** so that the plot can be fully reproduced. You should also
include the code that creates the PNG file.

* Add the PNG file and R code file to your git repository

When you are finished with the assignment, push your git repository to
GitHub so that the GitHub version of your repository is up to
date. There should be four PNG files and four R code files.


The four plots that you will need to construct are shown below. 


```{r}
unzip(zipfile="household_power_consumption.zip",exdir="./data")

List_Docs <- list.files("./data/")

pathdata <- file.path("./data/")

Docs <- list.files(pathdata, recursive = TRUE)

# Conjunto de datos
Data <-  read.table(file.path(pathdata, "household_power_consumption.txt"), header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

SubSetData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]


globalActivePower <- as.numeric(SubSetData$Global_active_power)

hist(globalActivePower, 
     col="red", # Color de la gráfica
     main="Global Active Power", # Titulo de la gráfica
     xlab="Global Active Power (kilowatts)") #etiqueta del gráfico en el eje "x"

```




```{r}
# Formato de hora y fecha
Date_Time <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

# Creación del gráfico

plot(Date_Time, GlobalActivePower, 
     type= 'l', # Se selecciona el tipo de lineas, en ?plot aparecen varios tipos
     xlab="", # Se deja sin espacio
     ylab="Global Active Power (kilowatts)") #Se traza la etiqueta del eje "y"


```





```{r echo= FALSE}

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetData$Global_active_power)
subMetering1 <- as.numeric(SubSetData$Sub_metering_1)
subMetering2 <- as.numeric(SubSetData$Sub_metering_2)
subMetering3 <- as.numeric(SubSetData$Sub_metering_3)



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



```





```{r}


DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(SubSetData$Global_active_power)
globalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
Voltage <- as.numeric(SubSetData$Voltage)
subMetering1 <- as.numeric(SubSetData$Sub_metering_1)
subMetering2 <- as.numeric(SubSetData$Sub_metering_2)
subMetering3 <- as.numeric(SubSetData$Sub_metering_3)

# Creación de las gráficas

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

```

