import cultivos.*
import wollok.game.*
import personaje.*

class Aspersor{
    const property position
    const property image = "aspersor.png"
    method plantasVecinas() {
        const miX = self.position().x()
        const miY = self.position().y()
        const plantasVecinas = []
    
    (-1 .. 1).forEach({ dx =>
        (-1 .. 1).forEach({ dy =>
            const vecinoX = miX + dx
            const vecinoY = miY + dy

            if (vecinoX.between(0, game.width() - 1) && vecinoY.between(0, game.height() - 1)) {
                const soloCultivo = game.getObjectsIn(game.at(vecinoX, vecinoY)).filter({ obj => obj.esCultivo() })
                plantasVecinas.addAll(soloCultivo)
            }
        })
    })

    return plantasVecinas
    }

    method esCultivo(){
		return false
	}
    method regarPlantasVecinas(){
        self.plantasVecinas().forEach({planta => planta.regada()})
    }
    method esMercado(){
        return false
    }
}