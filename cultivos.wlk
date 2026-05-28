import wollok.game.*
import personaje.*
import aspersor.*
class Maiz {
	const property position
	var estadoMaiz = maizBebe 
	method image() {
		return estadoMaiz.image()
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
	var property estadoTrigo = trigo0
	method image(){
		return estadoTrigo.image()
	}
	method regada(){
		estadoTrigo = estadoTrigo.siguiente()
	}
	method esFormaFinal(){
		return estadoTrigo.esFormaFinal()
	}
	method valor(){
		estadoTrigo.valor()
	}
	method esCultivo(){
		return true
	}
	method esMercado(){
        return false
    }
}
object trigo0{
	method image(){
		return "wheat_0.png"
	}
	method siguiente(){
		return trigo1
	}
	method esFormaFinal(){
		return false
	}
	method valor(){
		return 0
	}
}
object trigo1{
	method image(){
		return "wheat_1.png"
	}
	method siguiente(){
		return trigo2
	}
	method esFormaFinal(){
		return false
	}
	method valor(){
		return 0
	}
}
object trigo2{
	method image(){
		return "wheat_2.png"
	}
	method siguiente(){
		return trigo3
	}
	method esFormaFinal(){
		return true
	}
	method valor(){
		return 100
	}
}
object trigo3{
	method image(){
		return "wheat_3.png"
	}
	method siguiente(){
		return trigo0 
	}
	method esFormaFinal(){
		return true
	}
	method venta(){
		return 200
	}
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