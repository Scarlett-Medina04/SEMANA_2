# =============================================================================
# Laboratorio Semana 2 — Micro-proyecto: el salario mínimo real
# Fundamentos de Programación para Análisis Económico · UdeC-EAN
#
# Autor: [TU NOMBRE]
# Fecha: [FECHA]
#
# Objetivo: construir un proyecto reproducible completo y responder una pregunta
#           económica real: ¿cuánto subió DE VERDAD el salario mínimo en Chile?
#
# ⚠️ ANTES DE EMPEZAR: abre este archivo desde el .Rproj (doble clic en el
#    .Rproj, no en RStudio a secas). Si no, las rutas no van a funcionar.
#
# Regla IA: ChatGPT es CONSULTOR, no escritor. Debes poder explicar cada línea.
# =============================================================================


# -----------------------------------------------------------------------------
# PASO 0 — Verifica que estás en el proyecto correcto
# -----------------------------------------------------------------------------
# Esta función te dice en qué carpeta está parado R ahora mismo.
# TODO: córrela y confirma que termina en el nombre de tu proyecto.

getwd()

# ¿Terminó en el nombre de tu repositorio? ____
# Si no: cierra RStudio y ábrelo con doble clic en el archivo .Rproj.


# -----------------------------------------------------------------------------
# PASO 1 — La pregunta
# -----------------------------------------------------------------------------
# Entre 2014 y 2025 el ingreso mínimo pasó de $225.000 a $529.000: un alza
# nominal de 135%.
#
# TODO: antes de calcular nada, ESCRIBE TU PREDICCIÓN.
#       ¿Cuánto crees que creció el poder de compra? ¿También 135%? ¿Menos?
#
# MI PREDICCIÓN: ____________________________________________
#
# (Al final del laboratorio vuelves a leer esto. La idea es que te sorprenda.)


# -----------------------------------------------------------------------------
# PASO 2 — Cargar los datos
# -----------------------------------------------------------------------------
# El archivo debe estar en data/raw/ (lo descargaste de Canvas en la Sesión 1).
# TODO: completa la ruta.

datos <- read.csv("data/raw/____")

# ⚠️ ¿Error "cannot open file"? Dos causas posibles:
#    1. No abriste el .Rproj  →  vuelve al Paso 0.
#    2. El CSV no está en data/raw/  →  revisa dónde lo guardaste.


# -----------------------------------------------------------------------------
# PASO 3 — Mirar antes de calcular
# -----------------------------------------------------------------------------
# TODO: corre las tres y anota lo que ves.

str(datos)
head(datos)
nrow(datos)

# COLUMNAS que tiene: ____
# FILAS (años): ____
#
# 💡 Este es el hábito profesional: NUNCA calcules sobre datos que no miraste.


# -----------------------------------------------------------------------------
# PASO 4 — Verificar los tipos
# -----------------------------------------------------------------------------
# Para dividir dos columnas, ambas tienen que ser NÚMEROS.
# TODO: verifica las dos.

class(datos$salario_minimo)
class(datos$____)

# ¿Las dos son numéricas ("integer" o "numeric")? ____
#
# 🔮 PREDICE: si el CSV hubiera traído el salario como "$225.000" (texto con
#    signo peso y puntos), ¿qué diría class()? ¿Y qué pasaría al dividir?
#    Tu respuesta: ____________________________________________


# -----------------------------------------------------------------------------
# PASO 5 — El cálculo: deflactar
# -----------------------------------------------------------------------------
# Dividir el salario nominal por el índice de precios lo convierte a pesos de
# poder adquisitivo constante.
# TODO: completa la fórmula.

datos$salario_real <- datos$salario_minimo / datos$____ * 100

# TODO: mira el resultado
head(datos)


# -----------------------------------------------------------------------------
# PASO 6 — La respuesta
# -----------------------------------------------------------------------------
# TODO: completa para obtener los cuatro números que necesitas.

primer_anio  <- datos$salario_real[1]                 # 2014
ultimo_anio  <- datos$salario_real[nrow(datos)]       # 2025

nominal_2014 <- datos$salario_minimo[1]
nominal_2025 <- datos$salario_minimo[nrow(datos)]

# Variación porcentual nominal
(nominal_2025 / nominal_2014 - 1) * 100

# TODO: ahora la variación porcentual REAL (misma fórmula, otras variables)
(____ / ____ - 1) * 100

# ✅ Deberías ver: ~135% nominal y ~44% real.
#
# TODO: vuelve al PASO 1 y compara con tu predicción. ¿Le achuntaste?


# -----------------------------------------------------------------------------
# PASO 7 — Guardar el resultado
# -----------------------------------------------------------------------------
# TODO: guarda la tabla con la columna nueva en output/

write.csv(datos, "output/____.csv", row.names = FALSE)

# TODO: ahora anda a GitHub Desktop y responde:
# ¿Aparece el archivo de output/ entre los cambios? ____
# ¿Por qué? ____________________________________________


# -----------------------------------------------------------------------------
# PASO 8 — Interpretar (en comentarios, aquí mismo)
# -----------------------------------------------------------------------------
# TODO: escribe 3 a 5 líneas respondiendo la pregunta del Paso 1.
#
# Dos exigencias:
#   1. Usa CIFRAS concretas, no "subió harto".
#   2. DESCRIBE, no evalúes. Este análisis no dice si el reajuste fue justo
#      ni qué efecto tuvo en el empleo — solo cómo evolucionó el poder de compra.
#
# INTERPRETACIÓN:
# ____________________________________________________________________________
# ____________________________________________________________________________
# ____________________________________________________________________________


# -----------------------------------------------------------------------------
# PASO 9 — El README
# -----------------------------------------------------------------------------
# TODO (fuera de este script): abre README.md y documenta ESTE proyecto.
# Usa la plantilla en materiales/plantilla_README.md. Mínimo:
#
#   - Título y una línea sobre qué responde el proyecto
#   - Datos: fuente y fecha (salario mínimo: leyes de reajuste;
#            IPC: Banco Mundial / INE)
#   - Cómo correrlo: qué archivo abrir y qué script ejecutar
#   - Autor y fecha


# -----------------------------------------------------------------------------
# PASO 10 — Cerrar el ciclo
# -----------------------------------------------------------------------------
# TODO en GitHub Desktop:
#   1. Commit del script y del README, con un mensaje claro
#      (sugerencia: "Agrega analisis de salario minimo real")
#   2. Push
#   3. Entra a github.com y confirma que se ve tu trabajo


# -----------------------------------------------------------------------------
# AUTOEVALUACIÓN antes de entregar
# -----------------------------------------------------------------------------
# [ ] El script corre COMPLETO de una vez (reinicia R y córrelo entero).
# [ ] Abrí el proyecto desde el .Rproj, no con setwd().
# [ ] Verifiqué los tipos antes de calcular.
# [ ] El resultado quedó en output/ y NO se subió a GitHub.
# [ ] Interpreté con cifras y sin evaluar.
# [ ] El README explica qué hace el proyecto y de dónde salen los datos.
# [ ] Hice commit y push.


# -----------------------------------------------------------------------------
# ENTREGA: sube este script a tu repositorio de GitHub.
# Commit sugerido: "Lab S2: salario minimo real"
#
# Este laboratorio es el ensayo de la T1 (calificada, 6%): la tarea es lo mismo,
# con tu propia pregunta y tus propios datos.
# -----------------------------------------------------------------------------


# -----------------------------------------------------------------------------
# 🟢 DESAFÍO OPCIONAL (si terminaste antes)
# -----------------------------------------------------------------------------
# ¿En qué año el salario real CAYÓ respecto al anterior? Pista: mira la columna
# salario_real año por año. ¿Qué pasó en Chile ese año?
#
# datos[, c("anio", "salario_real")]
