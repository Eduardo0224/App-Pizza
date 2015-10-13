//
//  Ingredientes.swift
//  AppPizza
//
//  Created by Eduardo on 13/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import WatchKit
import Foundation


class Ingredientes: WKInterfaceController {
    
    @IBOutlet var listaWK: WKInterfaceTable!
    var pizza = PizzaWK()
    
    var ingredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa", "Jalapeño", "Maíz Tierno"]


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let c = context as! PizzaWK
        self.pizza = c
        
        // Configure interface objects here.
        print("\(pizza.tamano), \(pizza.tipoMasa), \(pizza.tipoQueso)")
        
        listaWK.setNumberOfRows(ingredientes.count, withRowType: "CeldaWK")
        
        for (index, name) in ingredientes.enumerate() {
            let row = listaWK.rowControllerAtIndex(index) as! CeldaWK
            row.lblNombreIngrediente.setText(name)
        }
    }
}
