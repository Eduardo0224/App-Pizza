//
//  TipoQueso.swift
//  AppPizza
//
//  Created by Eduardo on 13/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import WatchKit
import Foundation


class TipoQueso: WKInterfaceController {
    
    // MARK: IBOutlet
    @IBOutlet var pickerTipoQueso: WKInterfacePicker!
    
    // MARK: Properties
    var tiposQueso = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    var pizza = PizzaWK()
    
    
    // MARK: Functions
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let c = context as! PizzaWK
        self.pizza = c
        
        print("Resultado \(self.pizza.tipoMasa)")
        
        // Configure interface objects here.
        let indiceInicial = 0
        var pickerItems: [WKPickerItem] = []
        for i in indiceInicial...(tiposQueso.count - 1) {
            let item = WKPickerItem()
            item.title = "\(tiposQueso[i])"
            pickerItems.append(item)
        }
        self.pickerTipoQueso.setItems(pickerItems)
        
        pizza.tipoQueso = tiposQueso.first
    }
    
    // MARK: IBAction
    @IBAction func pickerChanged(value: Int) {
        pizza.tipoQueso = tiposQueso[value]
        print("Tipo Queso Pizza: \(pizza.tipoQueso)")
    }
    
    @IBAction func confirmarSeleccion() {
        pushControllerWithName("idIngredientes", context: self.pizza)

    }
}
