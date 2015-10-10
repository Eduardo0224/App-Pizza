//
//  IngredientesPizza.swift
//  AppPizza
//
//  Created by Eduardo on 9/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import UIKit

class IngredientesPizza: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ingredientes = ["Jamón", "Pepperoni", "Pavo", "Salchicha", "Aceituna", "Cebolla", "Pimiento", "Piña", "Anchoa", "Jalapeño", "Maíz Tierno"]
    var ingredientesSeleccionados = [String]()
    
    var pizza : Pizza?
    @IBOutlet weak var lista: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Esta es la pizza: \(pizza?.tamano), \(pizza?.tipoMasa), \(pizza?.tipoQueso)")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)
        
        // Configurar la celda
        celda.textLabel?.text = self.ingredientes[indexPath.row]
        celda.accessoryType = UITableViewCellAccessoryType.None
        
        return celda
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if ingredientesSeleccionados.count >= 1 {
            pizza!.ingredientes = ingredientesSeleccionados
        
            let vistaSiguiente = segue.destinationViewController as! ConfirmacionPizza
            vistaSiguiente.pizza = self.pizza
        }
        else {
            // Lanzar una alerta
            let alerta = UIAlertController(title: "No tienes ingredientes", message: "Debes seleccinar al menos un ingrediente, si nó tu Pizza no sabrá bien", preferredStyle: UIAlertControllerStyle.Alert)
            let cancelAction = UIAlertAction(title: "Ok", style: .Cancel) { (action) in }
            alerta.addAction(cancelAction)
            presentViewController(alerta, animated: true, completion: nil)
            

        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .Checkmark
            {
                cell.accessoryType = .None
                
                if ingredientesSeleccionados.count > 0 {
                    
                    for ingredienteAEliminar in ingredientesSeleccionados {
                        if ingredienteAEliminar == ingredientes[indexPath.row] {
                            
                            // TODO: Remover el elemento por el valor
                            if let indiceIngredienteAEliminar = ingredientesSeleccionados.indexOf(ingredientes[indexPath.row]) {
                                ingredientesSeleccionados.removeAtIndex(indiceIngredienteAEliminar)
                            }
                        }
                    }
                }
                
                
            }
            else
            {
                if ingredientesSeleccionados.count < 5 {
                    cell.accessoryType = .Checkmark
                
                    if !ingredientesSeleccionados.contains(ingredientes[indexPath.row]) {
                        ingredientesSeleccionados.append(ingredientes[indexPath.row])
                    
                    }
                    else {
                        print("\(ingredientes[indexPath.row]) ya esta agregado")
                    }
                }
            }
        }
        
        
        print(ingredientesSeleccionados)

    }
    
    
}
