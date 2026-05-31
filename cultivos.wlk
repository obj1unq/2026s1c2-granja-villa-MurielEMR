import wollok.game.*
import personaje.*
import aspersor.*
class Maiz {
	const property position
	var estadoMaiz = maizBebe 
	method image() {
		return estadoMaiz.image()
	}
	method valor() {
        return estadoMaiz.valor()
	}
	method regada(){
		if (estadoMaiz == maizBebe){
			estadoMaiz = maizAdulto
		}

	}
	method esCultivo(){
		return true
	}
	method esFormaFinal(){
		return estadoMaiz.esFormaFinal()
	}
	method esMercado(){
        return false
    }
}
object maizBebe{
	method image(){
		return "corn_baby.png"
	}
	method esFormaFinal(){
		return false
	}
	method valor(){
		return 0   // No hace falta pero por si las dudas
	}
}
object maizAdulto{
	method image(){
		return "corn_adult.png"
	}
	method esFormaFinal(){
		return true
	}
	method valor(){
		return 150
	}
}
class Trigo{
	const property position
    var property etapa = 0
    method image() {
        return "wheat_" + etapa.toString() + ".png"
    }
    method regada() {
        if (etapa < 3) {
            etapa = etapa + 1
        } else {
            etapa = 0
        }
    }
    method esFormaFinal() {
        return etapa >= 2
    }
    method valor() {
        return if (etapa == 2) 100 
               else if (etapa == 3) 200 
               else 0
    }

    method esCultivo() = true
    method esMercado() = false
}

class Tomaco{
	var property position
	method image(){
		return "tomaco.png"
	}
	method regada(){
		self.moverArriba()
	}
	method moverArriba(){
		if (position.y() == game.height()-1 ){
			position = game.at(position.x(),0)
		}else{
			position = game.at(position.x(),position.y()+1)
		}
		
	}
	method esFormaFinal(){
		return true
	}
	method valor(){
		return 80
	}
	method esCultivo(){
		return true
	}
	method esMercado(){
        return false
    }

}