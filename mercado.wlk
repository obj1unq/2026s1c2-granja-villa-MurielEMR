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
            cantidadMonedas = cantidadMonedas - personaje.valorDeCosecha()
    }
    method agregarMercaderia(mercaderiaNueva){
        mercaderia.addAll(mercaderiaNueva)
    }
    
    method puedeComprarMercaderia(mercaderiaNueva) {
        const valorDeEstaVenta = mercaderiaNueva.sum({ planta => planta.valor() })
        return self.cantidadMonedas() >= valorDeEstaVenta
    }

    method esMercado(){
        return true
    }
    method esCultivo(){
        return false
    }
}