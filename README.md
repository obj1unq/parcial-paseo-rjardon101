# Objetos 1 - Parcial 12/6/2018
## Ropa de niños

Una familia  numerosa necesita ayuda de un sistema informático para sentirse
seguros de que sus niños están listos antes de salir de paseo, según las reglas 
que se realizan a continuación.

1. Saber el nivel de comodidad de una prenda para un niño. 

Todas las prendas tienen un talle (xs, s, m, l, xl) que debe coincidir con 
el talle del niño en cuestión para ganar 8 puntos de comodidad. 
Si el talle no coincide no gana ningún punto de comodidad.

Por otro lado, toda prenda tiene un nivel de desgaste.
Para calcular el nivel de comodidad hay 
que restar los puntos de desgaste, pero con un máximo de 3 puntos. 
Por ejempllo: Si la prenda tiene 1 punto de desgaste resta 1. Si tiene 3, resta 3. 
Pero si tiene 4 o más sigue restando 3. 

La manera de calcular el nivel de desgaste y otras particularidades, 
se detallan a continuación:

- Para las prendas de a pares (zapatillas, medias, guantes) hay que tener en cuenta
que está compuesta de dos elementos:el derecho y el izquierdo. Cada elemento puede tener 
un nivel de desgaste diferente. El nivel de degaste de la prenda es el promedio de desgaste
de ambas partes: (desgaste del izquierdo + desgaste del derecho) / 2.
El desgaste inicial de cada elemento es 0.

Además no es bien recibido por los niños chiquitos: si el niño que lo 
usa tiene menos  de 4  años resta 1 puntos de comodidad (si no nada).

- Tanto para la ropa liviana (remeras, pantalones cortos, vestidos, etc)
como para la ropa pesada (sweters, pantalones largos, camperas) El nivel de desgaste
es un número que inicialmente es 0 pero se irá modificando. 
Además, La ropa liviana suma 2 puntos de comodidad.

2. Intercambiar pares: Los padres muchas veces compran varios pares similares y luego, 
dado el nivel de desgaste que presenta cada parte, deciden intercambiar elementos. 
Por ejemplo, dados dos pares de medias llamadas "a" y "b", El proceso de intercambiar
consiste en que el elemento derecho de "a" pase a ser el elemento derecho de "b",
mientras que el elemento derecho de "b" pasa a ser el elemento derecho de "a". 
Los elementos izquierdos quedan en sus respectivos pares originales.
El intercambio es posible solamente cuando ambos pares tienen el mismo talle. 
Nota: Sería válido para el sistema intercambiar un par de zapatillas 
con un par de medias, sólo revisa el talle. 

3. Saber el nivel de abrigo de una prenda:  
- Para las prendas de pares, el nivel de abrigo es la suma de el nivel de abrigo 
de cada elemento, el cual se determina para cada elemento (un buen default es 1). 
- Para las prendas pesadas se determina el nivel de abrigo para cada prenda (un buen default es 3) 
- Todas las prendas livianas tienen el mismo nivel de abrigo. Al iniciar el sistema
este valor es 1, pero puede ser modificado en cualquier momento de la ejecución.


4. Saber si una familia puede salir de paseo. Para eso hay que verificar 
que cada niño de la familia esté listo para salir de paseo. 

Un niño está listo para salir de paseo si tiene al menos 5 prendas, 
de las cuales al menos tenga una con nivel de abrigo superior o igual a 3. Además
el promedio de calidad de sus prendas debe superar a 8.
Se entiende por nivel de calidad de una prenda a la suma de su nivel de abrigo 
y su nivel de comodidad.

5. Niños problemáticos: Un niño problemático tiene dos diferencias  
con el resto de los niños para saber si está listo para salir de paseo:
- La cantidad de prendas necesarias para salir es 4 (no 5 como los demás). 
- Un niño problemático tiene
siempre un juguete en su mano. De cada juguete se conoce la edad mínima y máxima
recomendada. Si el niño no tiene una edad acorde a la recomendada por su juguete, 
no puede salir de paseo.
El resto de las condiciones son iguales que los otros niños.

6. Saber las prendas infaltables de una familia. Es el conjunto que se forma con la prenda
de máxima calidad de cada niño.

7. Saber cuales son los niños chiquitos de una familia. Es el conjunto formado por los 
niños menores de 4 años. 
Nota: Recordar que en el punto 1 se tenía en cuenta esta condición para determinar la comodidad
de las prendas pares. 

8. Hacer que  una familia salga de paseo:
 Obviamente, solo las familias que cumplen con el punto 4 son las únicas capaces de salir de 
paseo. Cuando la familia sale de paseo, los niños usan sus prendas. 
Cuando una prenda liviana o pesada es usada, se suma 1 punto al nivel de desgaste.
En el caso de las prendas pares, se suma 1.20 a la prenda derecha y 0.8 a la prenda izquierda.

 

 
 

 
 




