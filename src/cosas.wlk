import camion.*
object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultoQueOcupa(){
		return 1
	}
	method cuandoLoCarganAlCamion(){
		return null
	}
}

object bumblebee {
	var property transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	method bultoQueOcupa(){
		return 2
	}
	method cuandoLoCarganAlCamion(){
		self.transformadoEnAuto(false)
	}
}
object paqueteDeLadrillos{
	var property cantidadLadrillos=2
	var peso=2*cantidadLadrillos
	method peso(){
		return peso
	}
	method nivelPeligrosidad(){
		return 2
	}
	method bultoQueOcupa(){
		return (cantidadLadrillos/100).roundUp()
	}
	method cuandoLoCarganAlCamion(){
		cantidadLadrillos+=12
	}
}
object arenaAGranel{
	var property peso=5
	method nivelPeligrosidad(){
		return 1
	}
	method bultoQueOcupa(){
		return 1
	}
	method cuandoLoCarganAlCamion(){
		peso+=20
	}
}
object bateriaAntiaerea{
	var property tieneMisiles=true
	
	method peso(){
		if (self.tieneMisiles()){return 300}
		else{return 200}
	}
	method nivelPeligrosidad(){
		if(self.tieneMisiles()){return 100}
		else{return 0}
	}
	method bultoQueOcupa(){
		if(tieneMisiles){return 2}
		else{return 1}
	}
	method cuandoLoCarganAlCamion(){
		self.tieneMisiles(true)
	}
}
object contenedorPortuario{
	var property cosasDentro=[ ]
	method peso(){
		return 100+ cosasDentro.sum({cosa=>cosa.peso()})
	}
	method nivelPeligrosidad(){
		if(cosasDentro==[ ]){return 0}//cosasDentro.isEmpty()
		else{return cosasDentro.max({cosa=>cosa.nivelPeligrosidad()}).nivelPeligrosidad()}  
	}
	method bultoQueOcupa(){
		return 1+cosasDentro.sum({cosa=>cosa.bultoQueOcupa()})
	}
	method cuandoLoCarganAlCamion(){
		cosasDentro.forEach({cosa=>cosa.cuandoLoCarganAlCamion()})
	}
}
object residuosRadioactivos{
	var property peso=5
	method nivelPeligrosidad(){
		return 200
	}
	method bultoQueOcupa(){
		return 1
	}
	method cuandoLoCarganAlCamion(){
		peso+=15
	}
}
object embalajeDeSeguridad{
	var property cosaAEmbalar= contenedorPortuario
	
	method peso(){
		return cosaAEmbalar.peso()
	} 
	method nivelPeligrosidad(){
		return cosaAEmbalar.nivelPeligrosidad()/2
	}
	method bultoQueOcupa(){
		return 2
	}
	method cuandoLoCarganAlCamion(){
		return null
	}
}
///////////////////////////////////////CLASES//////////////////////////////////////////////
class PaqueteDeLadrillos{
	var property cantidadLadrillos=2
	var peso=2*cantidadLadrillos
	method peso(){
		return peso
	}
	method nivelPeligrosidad(){
		return 2
	}
	method bultoQueOcupa(){
		return (cantidadLadrillos/100).roundUp()
	}
	method cuandoLoCarganAlCamion(){
		cantidadLadrillos+=12
	}
}
 object otroPaquetote{
 	
camion.cargar(var otroPaquetote=new PaqueteDeLadrillos(cantLadrillos=40))
}

}