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
    var booleans : [Bool] = []
    
    var ingredientesSeleccionados = [String]()


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
        
        for _ in ingredientes {
            booleans.append(false)
        }
    }
    
    @IBAction func confirmarSeleccion() {
        if ingredientesSeleccionados.count == 0 {
            alerta("Sin ingredientes", descripccion: "debes agregar al menos un ingrediente")
        }
        else {
            self.pizza.ingredientes = ingredientesSeleccionados
            pushControllerWithName("iDConfirmar", context: self.pizza)

        }
        
    }
    
    func alerta (titulo : String, descripccion: String) {
        let alerta = WKAlertAction(title: "Ok", style: .Default) { () -> Void in
        }
        
        self.presentAlertControllerWithTitle(titulo, message: descripccion, preferredStyle: .Alert, actions: [alerta])
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        print("Indice: \(rowIndex)")
        
        
    
        booleans[rowIndex] = !booleans[rowIndex]
        
        let row = listaWK.rowControllerAtIndex(rowIndex) as! CeldaWK
        

        if booleans[rowIndex] {
            
            if ingredientesSeleccionados.count < 5 {
                row.checkedImage.setImageNamed("check_on_icon.png")
                
                if !ingredientesSeleccionados.contains(ingredientes[rowIndex]) {
                    ingredientesSeleccionados.append(ingredientes[rowIndex])
                    
                }
                else {
                    print("\(ingredientes[rowIndex]) ya esta agregado")
                }
            }
            else {
                alerta("Demasiados ingredientes", descripccion: "máximo 5")
            }
            
            

        }
        else {
            // remover
            if ingredientesSeleccionados.count > 0 {
                
                for ingredienteAEliminar in ingredientesSeleccionados {
                    if ingredienteAEliminar == ingredientes[rowIndex] {
                        
                        // TODO: Remover el elemento por el valor
                        if let indiceIngredienteAEliminar = ingredientesSeleccionados.indexOf(ingredientes[rowIndex]) {
                            ingredientesSeleccionados.removeAtIndex(indiceIngredienteAEliminar)
                        }
                    }
                }
            }
            row.checkedImage.setImageNamed("check_off_icon.png")
        }
        
        print("Booleans \(booleans[rowIndex])")
        print(ingredientesSeleccionados)
        
    }
}
