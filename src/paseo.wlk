class Prenda {

	var property talle
	var  comodidad
	var property abrigo
	var desgaste

	method intercambiarPrendas(prendaDerecha1, prendaDerecha2, prendaIzquierda1, prendaIzquierda2) {
		if (prendaDerecha1.desgaste() == prendaIzquierda2.desgaste() and prendaDerecha2.desgaste() == prendaIzquierda1.desgaste()) {
			prendaDerecha2.esPrendaDe(prendaIzquierda1)
			prendaDerecha1.esPrendaDe(prendaIzquierda2)
		}
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
		 comodidad += 8
	}
	
	method nivelDeComodidad() {
		return comodidad
	}
	
	
	method comodidadFinal() {
		if (desgaste <= 4)  {
			return comodidad - desgaste
		} else return comodidad - 3
	}
	
	
}

class PrendaLiviana inherits Prenda {

	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	method comodidadAumentada() {
		comodidad += 2
	}

}

class PrendaPesada inherits Prenda {

	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

}

class PrendaIzquierda inherits Prenda {


	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	method esPrendaDe(prendaDerecha) {
		return prendaDerecha
	}
	
	override method aumentarDesgaste() {
		super() desgaste += 0.8
	}

}

class PrendaDerecha inherits Prenda {


	method abrigo(nivelDeAbrigo) {
		abrigo = nivelDeAbrigo
	}

	method esPrendaDe(prendaIzquierda) {
		return prendaIzquierda
	}
	
	override method aumentarDesgaste() {
		super() desgaste += 1.2
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
			unaPrenda.aumentarComodidad() 
		}
	}



	method desgasteDePrendaDeAPares(prendaIzquierda, prendaDerecha) {
		return (prendaIzquierda.desgaste() + prendaDerecha.desgaste()) / 2
	}

	method tienePrendasSuficientes(unNinio) {
		return prendas.size() >= 5
	}

	method tienePrendaAbrigada(unNinio) {
		return prendas.filter({ prenda => prenda.abrigo() >= 3 }).size() > 0
	}

	method calculoDeCalidad(unNinio) {
		return prendas.sum({ prenda => prenda.calidad() }) / prendas.size()
	}

	method tieneRopaDeCalidad(unNinio) {
		return self.calculoDeCalidad(unNinio) > 8
	}

	
	method prendaDeCalidad(unNinio) {
		return prendas.max({prenda => prenda.calidadDePrenda()})
	}

}

class NinioPequenio inherits Ninio {

	override method desgasteDePrendaDeAPares(prendaIzquierda, prendaDerecha) {
		return super(prendaIzquierda, prendaDerecha) / 2
	}

}

class NinioProblematico inherits Ninio {

	override method tienePrendasSuficientes() {
		return prendas.size() >= 4
	}

	method puedeLlevarJuguete(unJuguete) {
		return unJuguete.edadMinima() <= edad <= unJuguete.edadMaxima()
	}

}

class Juguete {

	const edadMinima
	const edadMaxima

}

class Familia {

	var property ninios = #{}
    

	method conjuntosInfaltables() {
	    return ninios.forEach({hijo => hijo.prendaDeCalidad()}).asSet()
	}
	
	method niniosPequenios() {
		return ninios.filter({hijo => hijo.edad() <= 4})
	}

	method familiaSaleDePaseo(unaPrenda) {
		unaPrenda.aumentarDesgaste()
	}
	
	method puedeSalirDePaseo() {
		return ninios.forEach({ninio => ninio.tienePrendaAbrigada() and ninio.tieneRopaDeCalidad() and ninio.tienePrendasSuficientes()})
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

