import cultivos.*
import personaje.*

object fabricaDeSemillas{
    method crearSemilla(tipoSemilla,posicionSemilla){
        return if(tipoSemilla == "maiz" ) new Maiz(position = posicionSemilla)
                else if (tipoSemilla == "trigo") new Trigo( position = posicionSemilla)
                else if (tipoSemilla == "tomaco") new Tomaco(position = posicionSemilla)
                else self.error ("No hay semilla de ese tipo")
    }
}