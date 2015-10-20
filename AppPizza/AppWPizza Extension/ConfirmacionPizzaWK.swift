//
//  ConfirmacionPizzaWK.swift
//  AppPizza
//
//  Created by Eduardo on 19/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import WatchKit
import Foundation


class ConfirmacionPizzaWK: WKInterfaceController {
    
    var pizza = PizzaWK()
     var textoPizzaCompletada : String?
    
    typealias WKAlertActionHandler = () -> Void

    @IBOutlet var lblPizzaLista: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        
        let c = context as! PizzaWK
        self.pizza = c
        
        print("\(pizza.tamano) --- \(pizza.tipoMasa) --- \(pizza.tipoQueso) --- \(pizza.ingredientes)")
        
        textoPizzaCompletada = "Tu Pizza es \(pizza.tamano!)\ntiene una masa \(pizza.tipoMasa!)\nsu tipo de queso es \(pizza.tipoQueso!)\ntiene los siguientes ingredientes\n"
        
        textoPizzaCompletada?.fastestEncoding
        
        for ingredienteActual in pizza.ingredientes! {
            textoPizzaCompletada! = textoPizzaCompletada! + "\(ingredienteActual)\n"
        }
        
        print(textoPizzaCompletada!)
        lblPizzaLista.setText(textoPizzaCompletada!)
        lblPizzaLista.sizeToFitHeight()
        
        

    }
    
    func enviar () {
        pushControllerWithName("iDPizzaLista", context: self.pizza)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func enviarAlHorno() {

        let handler = { self.enviar() }
        
        let cancelar = WKAlertAction(title: "Cancelar", style: WKAlertActionStyle.Cancel, handler: { })        
        let action = WKAlertAction(title: "Enviar", style: WKAlertActionStyle.Default, handler: handler)
        self.presentAlertControllerWithTitle("Al Horno", message: "Enviaremos tu pizza al horno", preferredStyle: WKAlertControllerStyle.SideBySideButtonsAlert, actions: [cancelar, action])
        
    }
}
