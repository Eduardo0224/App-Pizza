//
//  TipoMasaPizza.swift
//  AppPizza
//
//  Created by Eduardo on 8/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import UIKit

class TipoMasaPizza: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var tipoMasaPizza = ["Delgada", "Crujiente", "Gruesa"]
    @IBOutlet weak var tipoMasaPickerView: UIPickerView!
    var tipoMasa: String?
    
    var pizza: Pizza?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipoMasaPickerView.dataSource = self
        tipoMasaPickerView.delegate = self
        tipoMasa = tipoMasaPizza.first
        
        print("Esta es la pizza: \(pizza?.tamano)")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pizza!.tipoMasa = tipoMasa
        
        let vistaSiguiente = segue.destinationViewController as! TipoQuesoPizza
        vistaSiguiente.pizza = self.pizza

    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tipoMasa = tipoMasaPizza[row]
    }
    
    func numberOfComponentsInPickerView(pickerView:UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tipoMasaPizza.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tipoMasaPizza[row]
    }
}
