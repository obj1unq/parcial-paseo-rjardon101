// Nota 2 (dos): El programa presenta inconsistencias frecuentes.

// 1) Mal. En lugar de calcular la comodidad intenta almacenarla en una variable e ir actualizándola, mezclando órdenes con preguntas de forma inconsistente.
// 2) Mal. Modela mal las prendas pares y no respeta el enunciado.
// 3) Mal. No lo calcula, aparece como una variable y métodos para asignarla repetidos en toda la jerarquía.
// 4) Regular. Manejo de colecciones relativamente bien, pero los métodos en nínio tiene parámetros innecesarios y confusos.
// 5) Regular-. Sobreescribe el método sin respetar la cantidad de parámetros. Condiciones sobre el juguete no implementadas.
// 6) Regular. Inconsistencias entre los mensajes enviados y los métodos programados.
// 7) B (delegar mejor el conocimiento de cuando un niño es pequeño)
// 8) Mal: No chequea precondiciones, no implementa la lógica correctamente.
// Algunos tests están comentados y otros no andan.

class Prenda {

	var property talle
	var comodidad
	var property abrigo
	var desgaste

	method intercambiarPrendas(prendaDerecha1, prendaDerecha2, prendaIzquierda1, prendaIzquierda2) {
		// ¿Por qué compara desgaste? Debería ser talle.
		if (prendaDerecha1.desgaste() == prendaIzquierda2.desgaste() and prendaDerecha2.desgaste() == prendaIzquierda1.desgaste()) {
			prendaDerecha2.esPrendaDe(prendaIzquierda1)
			prendaDerecha1.esPrendaDe(prendaIzquierda2)
		}
		// Debería tirar excepción si el cambio no se puede hacer. 
	}

	method abrigoDePrendaDoble(prendaDerecha, prendaIzquierda) {
		return prendaDerecha.abrigo() + prendaIzquierda.abrigo()
	}

	method calidadDePrenda() {
		return self.comodidad() + self.abrigo()
	}

	method aumentarDesgaste() {
		desgaste += 1
	}

	method aumentarComodidadEnOcho() {
		// No modificar las prendas.
		comodidad += 8
	}

	method nivelDeComodidad() {
		return comodidad
	}

	method comodidadFinal() {
		if (desgaste <= 4) {
			return comodidad - desgaste
		} else return comodidad - 3
	}

}

class PrendaLiviana inherits Prenda {

	// ¿Por qué este método está acá y no en una superclase?
	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	// Debería llamarse igual que el resto de los métodos de comodidad para poder ser usado polimórficamente.
	method comodidadAumentada() {
		comodidad += 2
	}

}

class PrendaPesada inherits Prenda {

	// ¿Por qué este método está acá y no en una superclase?
	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

}

class PrendaIzquierda inherits Prenda {

	// ¿Por qué este método está acá y no en una superclase?
	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	method esPrendaDe(prendaDerecha) {
		return prendaDerecha
	}

	override method aumentarDesgaste() {
		super() // ¿Por qué super?
		desgaste += 0.8
	}

}

class PrendaDerecha inherits Prenda {

	// ¿Por qué este método está acá y no en una superclase?
	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	// No entiendo este método.
	method esPrendaDe(prendaIzquierda) {
		return prendaIzquierda
	}

	override method aumentarDesgaste() {
		super() // ¿Por qué super?
		desgaste += 1.2
	}

}

class Ninio {

	var property talle
	var prendas = #{}
	var edad
	var juguete

	method esPrendaComoda(unaPrenda) {
		return self.talle() == unaPrenda.talle()
	}

	method comodidadDePrenda(unaPrenda) {
		if (unaPrenda.esPrendaComoda(self)) {
			// No debe modificar la prenda, es una pregunta
			unaPrenda.aumentarComodidad()
		}
	}

	// ¿Por qué en ninio?
	method desgasteDePrendaDeAPares(prendaIzquierda, prendaDerecha) {
		return (prendaIzquierda.desgaste() + prendaDerecha.desgaste()) / 2
	}

	// Por qué este método (y siguientes) reciben ninio por parámetro?
	method tienePrendasSuficientes(unNinio) {
		return prendas.size() >= 5
	}

	method tienePrendaAbrigada(unNinio) {
		// Mejor con any en lugar de filter
		return prendas.filter({ prenda => prenda.abrigo() >= 3 }).size() > 0
	}

	// Nombre poco descriptivo
	method calculoDeCalidad(unNinio) {
		return prendas.sum({ prenda => prenda.calidad() }) / prendas.size()
	}

	method tieneRopaDeCalidad(unNinio) {
		return self.calculoDeCalidad(unNinio) > 8
	}

	// Nombre poco descriptivo
	method prendaDeCalidad(unNinio) {
		return prendas.max({ prenda => prenda.calidadDePrenda() })
	}

}

class NinioPequenio inherits Ninio {
	// No corresponde al enunciado
	override method desgasteDePrendaDeAPares(prendaIzquierda, prendaDerecha) {
		return super(prendaIzquierda, prendaDerecha) / 2
	}

}

class NinioProblematico inherits Ninio {

	override method tienePrendasSuficientes() { // El IDE está marcando el error, ¿por qué no lo corregís?
		return prendas.size() >= 4
	}

	method puedeLlevarJuguete(unJuguete) {
		return unJuguete.edadMinima() <= edad <= unJuguete.edadMaxima()
	}

}

class Juguete {
	// Deberían ser properties, de lo contrario son inaccesibles.
	const edadMinima
	const edadMaxima

}

class Familia {

	var property ninios = #{}

	method conjuntosInfaltables() {
		return ninios.forEach({ hijo => hijo.prendaDeCalidad() }).asSet()
	}

	method niniosPequenios() {
		return ninios.filter({ hijo => hijo.edad() <= 4 }) // Repite condición de ninio pequenio.
	}

	method familiaSaleDePaseo(unaPrenda) {
		unaPrenda.aumentarDesgaste() // Debería hacerlo para todas las prendas.
	}

	method puedeSalirDePaseo() {
		// Podría delegar más en el ninio.
		return ninios.forEach({ ninio => ninio.tienePrendaAbrigada() and ninio.tieneRopaDeCalidad() and ninio.tienePrendasSuficientes() })
	}

}

//Objetos usados para los talles
object xs {

}

object s {

}

object m {

}

object l {

}

object xl {

}

