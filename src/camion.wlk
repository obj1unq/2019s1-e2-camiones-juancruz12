import cosas.*

object camion {
	var property cosas = []
	var property peso=1000
	
	method pesoMaximo(){
		return 2500
	}
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		unaCosa.cuandoLoCarganAlCamion()
	}
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	method pesoTotalDeCarga(){
		return cosas.sum({carga=>carga.peso()})
	}
	method pesoTotal(){
		return peso+ self.pesoTotalDeCarga()
	}
	method excedidoDePeso(){
		return self.pesoTotal()>self.pesoMaximo()
	}
	method objetosPeligrosos(nivel){
		return cosas.filter({cosa=>cosa.nivelPeligrosidad()>nivel})
	}
	method objetosMasPeligrososQue(cosa){
		return cosas.filter({carga=>carga.nivelPeligrosidad()>cosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.any({cosa=>cosa.nivelPeligrosidad()>=nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa=>cosa.peso().between(min,max)})
	}
	method cosaMasPesada(){
		return cosas.max({cosa=>cosa.peso()})
	}
	method totalBultos(){
		return cosas.sum({cosa=>cosa.bultoQueOcupa()})
	}
	method pesos(){
		return cosas.map({cosa=>cosa.peso()})
	}
}
