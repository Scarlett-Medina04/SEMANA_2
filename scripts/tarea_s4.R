# Tarea S4 
# Autor: [Scarlett Medina]
# Fecha: 03-09-2026
# Qué hace: Aplicar inspección, filtrado y estadísticas descriptivas a un dataset económico, documentando cada paso
#------------------------------------------------------------------------

casen <- read.csv("data/raw/casen_reducido.csv")
#ruta relativa para que el script pueda ejecutarse

#------------------------------------------------------------------------

#Se explora la estructura antes del análisis
str(casen) #vemos las variables que son de textos y las que son numéricas
head(casen)
dim(casen) #se comprueba la cantidad de filas y columnas
summary(casen) # nos muestra un resumen estadístico de nuestra base de datos

#------------------------------------------------------------------------

#Se crea un subset, en este caso analizaremos las personas con más de 30 años
#y más de 11 años de educación
grupo <- subset(casen, edad > 30 & educ > 11)
nrow(grupo) #nos muestra el número de observaciones del grupo a analizar
mean(grupo$edad) #nos muestra la edad promedio del grupo
mean(grupo$ingreso, na.rm = TRUE) #nos muestra el ingreso promedio del grupo, excluyendo los valores faltantes
mean(casen$ingreso, na.rm = TRUE) #ingreso promedio del 
# ¿el grupo gana más que el promedio general?
# Si, el grupo gana más que el promedio general, mostrando una diferencia 
# aproximada de $74.509, lo cual podría estar altamente relacionado con las
# características usadas para formar el grupo, ya que al ser personas de 30 años
# y con más de 11 años de educación, se asocia a una mayor experiencia laboral
# y a mayor nivel de formación, lo que contribuye a obtener un ingreso superior
# al del promedio general.