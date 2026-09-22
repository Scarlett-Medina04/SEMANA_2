#Nombre: Scarlett Medina Mundaca
#Fecha: 2026-09-10
#¿Qué hace?: Se responder una pregunta económica propia usando los cinco verbos de dplyr

# Pregunta económica:
# ¿Las personas con más nivel educativo presentan una mayor experiencia
# laboral y un mayor ingreso promedio?

#DATOS
library(dplyr)
casen    <- read.csv("data/raw/casen_reducido.csv")
ingresos <- read.csv("data/raw/casen_ingresos.csv")

#--------------------------------------------------------
#Se analizaran las bases
dim(casen)
dim(ingresos)

str(casen)
str(ingresos)

# Para ver como se reconoce cada variable, ya sea numerica o de tipo caracter
sapply(casen, class)
sapply(ingresos, class)

# ¿Cuántos NA hay en ingreso?
sum(is.na(casen$ingreso))

#-------------------------------------------------------
#2b. Se seleccionan columnas por patrón
names(select(ingresos, starts_with("ing"))) #Indicamos que nos muestre las columnas cuyo nombre empieze con ing
names(select(ingresos, where(is.numeric))) #Para que nos muestre todas aquellas columnas que son numéricas

#-------------------------------------------------------
#3. Crear variables nuevas para el análisis
#Creo variable experiencia que nos indicaria la experiencia laboral potencial
# donde resto la edad y años de educación y el 6 nos indica la edad desde donde 
# comienza la educación y creo tres niveles educativos.

casen <- casen |>
  mutate(
    experiencia = pmax(edad - educ - 6,0),
  
nivel_educ = case_when(
  educ < 12 ~ "Sin media completa",
  educ == 12 ~ "Media completa",
  TRUE ~ "Superior"))

#Se verifica que quedaron bien creadas y que NINGUNA quedó en NA.
summary(casen$experiencia)
table(casen$nivel_educ, useNA = "ifany") #nos da un total de 60 obs. que nos indica que no hay NA

#Ahora filtraremos al grupo de personas que tienen al menos media completa o 
#educación superior, y además un ingreso disponible
grupo_educ <- casen |>
  filter(
    (nivel_educ == "Media completa" | nivel_educ == "Superior") &
      !is.na(ingreso)
  )

nrow(grupo_educ) # nos indica que 34 personas de la muestra entran en este grupo


#-----------------------------------------------------------------------
#Se pide dos agregaciones para poder llegar a la respuesta de nuestra pregunta de análisis
resumen_educacion <- casen |>
  group_by(nivel_educ) |>
  summarise(
    n = n(),
    experiencia_promedio = mean(experiencia), #este es para la experiencia promedio
    ingreso_promedio = mean(ingreso, na.rm = TRUE) #para que calcule el ingreso promedio, descartando los NA
  ) |>
  arrange(desc(ingreso_promedio))

resumen_educacion

#los datos obtenidos en esta tabla nos muestra efectivamente que el grupo con educación superior
#tiene un mayor ingreso promedio versus los que no tienen la media completa y que la diferencia entre
#estos dos grupos es de $256.545 lo cual es bastante significativa, pero diferente es con la experiencia 
#potencial ya que el grupo sin media completa muestra tener más experiencia potencial promedio lo que nos 
#dice que para esta muestra el tener mayor educación no se asocia necesariamente con una mayor experiencia,
#pero también puede ocurrir porque la experiencia de Mincer depende tanto de edad como de educación.

#Segunda agregación de análisis

resumen_educ_genero <- casen |>
  group_by(nivel_educ, genero) |>
  summarise(
    n = n(),
    n_ingreso = sum(!is.na(ingreso)),
    experiencia_promedio = mean(experiencia),
    ingreso_promedio = mean(ingreso, na.rm = TRUE)
  ) |>
arrange(nivel_educ, desc(ingreso_promedio))

resumen_educ_genero

#--------------------------------------------------------------
#TRATAMIENTO EXPLICITO Y COMENTADO DE LOS NA
promedio_sin_na <- mean(casen$ingreso, na.rm = TRUE) #aqui se pide calcular promedio excluyendo valores faltantes
promedio_con_na <- mean(casen$ingreso) #aqui nos arroja como resultado NA, ya que al existir NA le faltarian valores para poder calcular el promedio

#Ahora para responder a nuestra pregunta ¿Las personas con más nivel educativo presentan una mayor experiencia
#laboral y un mayor ingreso promedio? la respuesta es Si con respecto al ingreso pero tal como se demostró, es un no
#con respecto a la experiencia potencial ya que los datos demostraron que las personas con educación superior presentan
#un mayor ingreso promedio, con aproximadamente $777.926 versus quienes no tienen una media completa que muestran un ingreso
#promedio cercano a $521.381, mostrando una diferencia entre estos grupos de $256.545. Por lo tanto un mayor nivel de educación
#se asocia con un mayor ingreso promedio.
#Por otro lado la educación superior no presenta la mayor experiencia potencial ya que el grupo sin media completa tiene
#30 años en promedio, frente a 23 años en el grupo con educación superior. Esto debido a que la experiencia depende de la edad
#que tienen las personas de la muestra.
#Para finalizar, entre las limitaciones que pueden observarse es el tamaño reducido de la muestra, los NA en ingresos y que hay 
#otros factores o variables que no se controlan.