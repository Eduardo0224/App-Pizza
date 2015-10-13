//
//  InterfaceController.swift
//  AppWPizza Extension
//
//  Created by Eduardo on 12/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var pickerTamañoPizza: WKInterfacePicker!
    var tamañosPizza = ["Chica", "Mediana", "Grande"]
    var pizza = PizzaWK()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let indiceInicial = 0
        var pickerItems: [WKPickerItem] = []
        for i in indiceInicial...(tamañosPizza.count - 1) {
            let item = WKPickerItem()
            item.title = "\(tamañosPizza[i])"
            pickerItems.append(item)
        }
        self.pickerTamañoPizza.setItems(pickerItems)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerChanges(value: Int) {
        pizza.tamano = tamañosPizza[value]
        print("Tamaño pizza: \(pizza.tamano)")
    }
    
    @IBAction func confirmarSeleccion() {
        // Quitar el segue manual del storyboard y hacer uso de la función
        // pushControllerWithName
        pushControllerWithName("idTipoMasa", context: self.pizza)
    }
}
