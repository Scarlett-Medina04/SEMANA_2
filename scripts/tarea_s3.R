#Tarea S3: Vectores y estadísticas descriptivas 
# Nombre: [Scarlett Medina] 
# Fecha: 27-08-2026 
# ¿Que se hará?: Se pide crea al menos 3 vectores con datos económicos coherentes entre sí
# ------------------------------------------------------------
# 1. CREAR Y VERIFICAR VECTORES 
# ------------------------------------------------------------


salario <- c(600000, 550000, 780000, 890000, 1200000) #cuanto gana cada trabajdor
educ <- c(10,14,12,15,17) #años de educación de cada trabajador
experiencia <-c(3,1,6,5,7) #años de experiencia laboral de cada trabajador
# ------------------------------------------------------------
#Para comprobar que tipo de dato es el vector
class(salario)
class(educ)
class(experiencia)
#Para ver cuantas observaciones tiene el vector
length(salario)
length(educ)
length(experiencia)

#------------------------------------------------------------ 
# 2. SELECCIONAR POR POSICIÓN
# ------------------------------------------------------------

salario[1] #para ver el primero salario
salario[c(1,2,5)] #me muestra el primer, segundo y último salario
salario[-5] #muestra todos los salarios menos el quinto

# ------------------------------------------------------------ 
# 3. SELECCIONAR POR CONDICIÓN 
# ------------------------------------------------------------

salario_alto <- (salario > 1000000) #me indicaria cual salario esta sobre un millón de pesos
educ[educ > 15] #error? deberia mostrarme los que tienen mas de 15 años de experiencia
sum(salario > 1000000) #deberia indicarme cuantos son los trabajadores que superan el millon?
mean(salario_alto) #para ver que proporcion cumple el criterio de salario más alto

#------------------------------------------------------------ 
# 4. OPERACIÓN VECTORIZADA
# ------------------------------------------------------------
IPC<- 1.10
salario_real <- salario / IPC

#------------------------------------------------------------ 
# 5. ESTADISTICAS
# ------------------------------------------------------------
 
mean(salario) #deberia indicarme el salario promedio para ver nivel de ingresos del grupo e trabajadores
median(salario) #mostraria el centro de los datos de salarios, donde el salario más alto no influye
sd(salario) #muestra el grado de disperción de los ingresos en promedio respecto del salario medio 
quantile(salario) #para ver la distribución de los salarios entre bajo, medio y alto
