import personaje.*
import cultivos.*
class Mercado{
    var property cantidadMonedas
    var property position 
    const property mercaderia =[]
    method image(){
        return "market.png"
    }
    method comprarMercaderia(mercaderiaNueva){
            self.agregarMercaderia(mercaderiaNueva)
    }
    method agregarMercaderia(mercaderiaNueva){
        mercaderia.addAll(mercaderiaNueva)
    }
    method puedeComprarMercaderia(mercaderiaNueva){
        return self.cantidadMonedas() >= personaje.valorDeCosecha()
    }

    method esMercado(){
        return true
    }
}