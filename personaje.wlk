import wollok.game.*
import cultivos.*
import factory.*
import aspersor.*
import mercado.*
object personaje {
	var property position = game.center()
	const property image = "fplayer.png"
	const cosecha = []
	var property oroActual = 0

	method sembrar(tipoDeSemilla){
		if(game.colliders(self).isEmpty() ){
			const nuevaSiembra = fabricaDeSemillas.crearSemilla(tipoDeSemilla,self.position())
			game.addVisual(nuevaSiembra)
		}
		else{
			self.error("Imposible, hay otra cosa en este lugar")
		}
	}
	method regar(){
		var planta = null 
		if(not game.colliders(self).isEmpty()){
			planta = game.uniqueCollider(self)
			planta.regada()
		}
		else("Estas regando piso xd")
	}
	method cosechar(){
		self.validarCosecha()
		var planta = game.uniqueCollider(self)
		if ( (not game.colliders(self).isEmpty()) && planta.esFormaFinal()) {
			planta = game.uniqueCollider(self)
			cosecha.add(planta)
			game.removeVisual(planta)
		}else{
			self.error("No se puede cosechar")
		}
	}
	method validarCosecha(){
		if(game.colliders(self).isEmpty()){
			self.error("No hay nada para cosechar xd")
		}

	}
	method venderCosecha(){
		const mercadoActual = game.colliders(self).findOrDefault({ obj => obj.esMercado() }, null)
		if(mercadoActual != null && mercadoActual.esMercado() && mercadoActual.puedeComprarMercaderia(cosecha)){
			mercadoActual.comprarMercaderia(cosecha)
			oroActual = oroActual + self.valorDeCosecha()
			cosecha.clear()
		}
	}
	method estoyEnAlgunMercado(){
		const visualesAbajo = game.colliders(self)
		return visualesAbajo.any({ visual => visual.esMercado() })
	}
	method valorDeCosecha(){
		return cosecha.map({p => p.valor()}).sum()
	}
	method plantasParaVenderYOroTotal(){
		game.say(self,"Oro actual " + self.oroActual().toString() + " y, ademas, tengo " + self.cantidadDePlantasParaVender().toString() + "plantas para vender :D")

	}
	method cantidadDePlantasParaVender(){
		return cosecha.size()
	}
	method colocarAspersor(nuevoAspersor){
		if(game.colliders(self).isEmpty()){
			game.addVisual(nuevoAspersor)
			game.onTick(1000, nuevoAspersor,{nuevoAspersor.regarPlantasVecinas()})
		}
		
	}
	method esCultivo(){
		return false
	}
	method esMercado(){
        return false
    }
}