# Proyecto Final de Máster: Pronóstico de la Demanda

## Objetivos

Los **objetivos generales** del presente trabajo están orientados a resolver las necesidades de la demanda que actualmente se hace de manera manual con herramientas no eficientes y que son muy suceptibles de errores.

* Reducir la desviacion entre la demanda y la venta por artículo
* Aumentar la productividad del área de demanda ajustando los artículos en el momento que se detecta la desviación.
* Desarrollar soluciones de Machine Learning que sean capaces de clasificar los artículos nuevos de acuerdo a sus características físicas para ubicarlos en la segmentación de venta correcta.
* Desarrollar solución que sea capaz de hacer el pronóstico de la demanda para artículos nuevos y de resurtido.

Los **objetivos específicos** están orientados a tener predicciones más precisas y que consideren las variables que impactan directamente al comportamiento de ventas de los artículos, conocer la magnitud del impacto de cada variable y que se apliquen los ajustes necesarios para tener una precisión que no se degrade con el aumento de las tiendas o artículos.

* Proponer modelos de Machine Learning para determinar las variables más importantes que influyen en la venta de los artículos.
* Proponer modelos que mediante un entrenamiento puedan determinar los pesos específicos que tiene cada variable en el pronóstico particular de cada artículo.
* Proponer modelos que determinen la clasificación de un modelo como Bueno, Regular o Riesgo analizando las características de la imagen del artículos
* Proponer modelos de Machine Learning para ajustar las demandas de los artículos de acuerdo al comportamiento de ventas.

## Actividades

Los objetivos generales se deben cumplir en consecuencia de los objetivos específicos. Para lograr los objetivos específicos se deben ejecutar las siguientes actividades:

1. Generar DataSets con información necesaria para cumplir los objetivos específicos.
  * Venta, existencia y precio por tienda-dia-modelo-talla.
  * Segmentación, catálogo y página de cada modelo.
  * Imágen de artículos.
2. Limpieza de datos
  * Actualizar valores negativos de existencia, venta o precio a cero.
  * Estimar la venta de días donde no hubo existencia con algún modelo de ML.
3. Proponer y probar las variables que influyen o determinan el comportamiento de la venta.
  * Construir la matriz de correlación con las variables que se tienen para identificar numéricamente su participación en la venta.
  * Probar la incorporación de cada variable y determinar la mejora de la precisión.
4. Construir modelo de clasificación de artículos buenos regulares y riesgo.
  * Aplicar un modelo de clasificación para determinar cuántos grupos se pueden identificar en una misma familia con respecto a sus ventas.
  * Una vez encontrados los grupos, asociar las imágenes de los artículos a su grupo correspondiente.
  * Entrenar un modelo de Machine Learning que clasifique un artículo como Bueno, Regular o Riesgo de acuerdo a sus características de imágen, precio, etc.
  * Estimar las ventas que se tendrá de un modelo de acuerdo a su clasificación y características.
5. Construir la estructura de la red neuronal para hacer el pronóstico de la demanda por modelo.
  * Entrenar un modelo de Series de Tiempo en algún servicio como Amazon, Microsoft Azure o Google para generar el pronóstico de la demanda por cada artículo en un horizonte de 6 a 8 meses.
6. Reportar resultados.
  * Reportar el grado de precisión de cada modelo con el dataset de test.
