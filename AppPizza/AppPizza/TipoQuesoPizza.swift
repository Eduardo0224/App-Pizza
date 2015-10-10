//
//  TipoQuesoPizza.swift
//  AppPizza
//
//  Created by Eduardo on 8/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import UIKit

class TipoQuesoPizza: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var tipoQuesoPizza = ["Mozarela", "Cheddar", "Parmesano", "Sin queso"]
    @IBOutlet weak var tipoQuesoPickerView: UIPickerView!
    var tipoQueso: String?
    
    var pizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipoQuesoPickerView.dataSource = self
        tipoQuesoPickerView.delegate = self
        
        tipoQueso = tipoQuesoPizza.first
        
        print("Esta es la pizza: \(pizza?.tamano), \(pizza?.tipoMasa)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pizza!.tipoQueso = tipoQueso
        
        let vistaSiguiente = segue.destinationViewController as! IngredientesPizza
        vistaSiguiente.pizza = self.pizza

    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoQueso = tipoQuesoPizza[row]
    }
    
    
    func numberOfComponentsInPickerView(pickerView:UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoQuesoPizza.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoQuesoPizza[row]
    }

}
