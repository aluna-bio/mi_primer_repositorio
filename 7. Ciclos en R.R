
## CAP. 7.CICLOS EN R
# i variable control, tiene un rango, el numero de veces que quieres que haga tal cosa, l hace 5 veces
# i varia en 1, cuando se abre la llave suma 1 y ahora son 2, lo mismo con el 3 y hasta el 5

# i : es la variable que toma los valores del 1 al 5.
# print(i) : imprime el valor de i en cada iteración.


for (i in 1:5) {
  print(i)
}


## Ejemplo. Sumar los elementos de un vector

vector <- c(3, 5, 7, 9) # definir vector
# suma <- 0
for (i in vector) { # esa variable dentro del vector, imprme i, ya cuando acaba de todo el vector se sale del ciclo
  # suma <- suma + i
}
print(suma)



## ejemplo con nombres

nombres <- c("gaby", "julio", "pao", "andy", "chris")

for (nombre in nombres) { ## la variable ""nombre"" va contabilizando el numero de veces que va haciendo el ciclo, permite tener un control
  saludo <- paste ("hola", nombre, "que tal tu dia?")
  print (saludo)
}


## adaptar ejercicio a un dataframe

nombres2 <- data.frame (
  nombres = c("gaby", "césar", "pao", "chris", "marianita"),
  color = c("rosa", "verde", "amarillo", "negro", "cafe" ),
  mascota = c ("perlita", "nena", "montaña", "flupy", "orejas"))

for (i in 1:nrow (nombres2)) {
  print(paste ("Hola", nombres2$nombres[i], "tu color favorito es", nombres2$color[i], "y el nombre de tu mascota es:", nombres2$mascota[i] ))
} ## lo va haciendo por interacciones, primero con el primer nombre, primer color y primer mascota, despues con el segundo y asi



## Ejercicio, que del dataframe te diga el id, edad, peso y su nivel educativo

for (i in 1:nrow (dataset_categorical_NA)){
  print(paste ("El ID es:", dataset_categorical_NA$ID[i], "la edad es:", dataset_categorical_NA$Age[i], "el peso es:", dataset_categorical_NA$Weight[i], "y su nivel educativo es:", dataset_categorical_NA$EducationLevel [i] ))
}




## 22 / oct / 25

## while no permite hacer ciclos de forma repetida
## hasta que la condicion es falsa, se sale del ciclo
## depende de la condicion 
## la condicion lanza un valor lógico (verdadero o falso)


# ejemplo básico
x <- 2
while (x <= 5) { # mientras x es menor o igual a 5
  print(x) # si la condicion se cumple imprimelo, si no se cumple no imprime nada
  x <- x + 1 # si no lo pones seria un bucle infinito, entonces 
}




## EJERCICIOS

# cuantos resistentes hay
placas <- c("R", "S", "S", "R", "R", "S", "R") # R= resistentes y S= susceptibles
resistentes <- 0 
for (p in placas) { # p es el elemento que procesa en cada vuelta del bucle (recorre cada elemento del vector), el ciclo for va a estar iterando con p en cada valor de placas
  if (p == "R") { ## si p es exactamente igual a R
    resistentes <- resistentes + 1 ## si es R suma 1, si es falso no suma nada, si es R se regresa al ciclo para ver a la segunda R y asi, se pone para que no se haga un bucle infinito
  }
}

resistentes # para que imprima el resultado



## cuantos genes se estan expresando en cada muestra
expresion <- data.frame (
  muestra = c ("A", "B", "C"),
  gen1 = c(5,0,3),
  gen2 = c(2,1,0),
  gen3 = c(0,4,2)
)
conteo <- numeric (nrow (expresion)) # tomame los renglones de la expresión y mandalos a numérico
for (i in 1:nrow (expresion)) { # para cada valor de i, 
  datos <- expresion [i, 2:4] # en el renglón i, tomame las columnas de la 2 a la 4, omite la columna 1
  conteo [i] <- sum (datos >0) # vector de conteo, en cada posición de las columnas que le dijiste, suma los datos que son mayores a cero
}

expresion
conteo


## ejercicio 27/oct/25

microbiota <- data.frame(
  especie = c ("Lactobacillus", "Bacteroides", "Escherichia"),
  muestra1= c (100,50,25) ,
  muestra2 = c (80,40,20) ## abundancoa de cada bacteria en cada muestra
  )

relativas <- microbiota # le asignamos nuestra base de datos completa a este objeto de relativas
 
for (i in 2:ncol (microbiota)) { # en cada iteracion de nuestra variable i, en el rango de a partir de 2 hasta el número de columnas
  tot <- (sum:microbiota [ ,i]) # suma todos los renglones, con la columna específica que se vaya iterando, de la 2 en adelante
  relativas [ , i] <- microbiota [ ,i] / tot
}

print (relativas). ## no me salieron los valores, chécalos




## WHILE (condición) {
# bloque de codigo
# todo lo que está dentro
# mientras la condicion sea verdadera
# }


# ejercicio simple
x <- 1
while ( x <= 5){ ## mientras que x sea menor o igual a 5
  print (x) # imprime el valor de 5
  x<- x+1  # para que no se genere un bucle infinito, hasta que esa condicion sea verdadera se repite el ciclo, y ahora x tiene el valor de 2, si es menor o igual a 5 lo imprime, y después sigue con el 3 y asi
}


##

suma <- 1
contador <- 0

while (suma <= 1000){
  
  suma <- suma + contador
  
  contador <- contador + 1 # para no hacer un ciclo infinito
}

cat ("Número de iteraciones:" , contador -1, "\n")
cat ("Suma total:" , suma, "\n")



## monitoriando crecimiento de colonia bacteriana, se multiplican cada hora, si inicias con 100 bacterias

bacterias <- 100
horas <- 0 # inicias en la hora cero

# cuantas horas van a pasar para que la colonia tenga + de 1000 bacterias

while ( bacterias <= 10000){
  bacterias <- bacterias * 2 # se duplican cada h
  
  print (paste("horas: ", horas)) # que me indique por cada operación el resultado de cada una
  print (paste("bacterias:  ", bacterias))
  
  horas <- horas +1 # se suma cada h
}

cat ("Numero de horas: ", horas) # te dice cuantas horas pasan para tener 10000 bacterias





### Ejercicio: Tienes 500 bacterias iniciales, una colonia reduce 20% cada hora, queremos saber cuantas horas van a pasar hasta que la poblacion baje hasta 50 bacterias finales

bacterias2 <- 500
horas2 = 0
tasa_reduccion = 0.20  # 20%

while (bacterias2 > 50 ){
  bacterias2 <- bacterias2 * (1 - tasa_reduccion) ## tasa de reducción
  
  print (paste("horas: ", horas2)) # que me indique por cada operación el resultado de cada una
  print (paste("bacterias:  ", bacterias2))
  
  horas <- horas2 +1

}

cat ("Numero de horas: ", horas3). ## CHECALO, ME DA QUE TODAS LAS HORAS SON CERO






