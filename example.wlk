object paquete {
  var estaPago = false
  var destino = puenteBrooklyn

  method cambiarDestino(unDestino) {
    destino = unDestino
  } 

  method puedeLlegar(mensajero) = mensajero.puedeLlegar(destino) and estaPago
  method pagar() {
    estaPago = true
  }
}

object puenteBrooklyn {
  method puedePasar(mensajero) = mensajero.peso() <= 1000
}

object matrix {
  method puedePasar(mensajero) = mensajero.puedeLlamar() 
}

object roberto {
  var vehiculo = bicicleta
  
  method peso() = 90 + vehiculo.peso() 
  method cambiarDeVehiculo(unVehiculo) {
    vehiculo = unVehiculo
  } 
  method puedeLlamar() = false 
  method puedeLlegar(destino) = destino.puedePasar(self) 
}

object chuck {
  method peso() = 80
  method puedeLlamar() = true  
  method puedeLlegar(destino) = destino.puedePasar(self) 
}

object neo {
  var tieneCredito = false

  method puedeLlegar(destino) = destino.puedePasar(self) 
  method peso() = 0
  method cargarCredito() {
    tieneCredito = true
  }  
  method puedeLlamar() = tieneCredito 
}

 object bicicleta {
    method peso() = 5 
 }

 object camion {
    var cantAcoplados = 1
    
    method cantAcoplados(cantidad) {
      cantAcoplados = cantidad
    } 

    method peso() = 500 * cantAcoplados 
 }

 object mensajeria {
    const mensajeros = []

    method mensajerosContratados() = mensajeros 
    method contratarMensajero(unMensajero) {
      mensajeros.add(unMensajero)
    } 
    method despedir(unMensajero) {
      mensajeros.remove(unMensajero)
    }
    method despedirATodos() {
      mensajeros.clear()
    }

    method esGrande() = mensajeros.size() > 2

    method puedeSerEntregado() = if(mensajeros.size() > 0 ) paquete.puedeLlegar(mensajeros.first()) else false 

    method pesoDelUltimo() = mensajeros.last().peso()  
 }