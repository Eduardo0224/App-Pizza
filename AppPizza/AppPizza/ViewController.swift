//
//  ViewController.swift
//  AppPizza
//
//  Created by Eduardo on 8/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var tamanosPizza = ["Chica", "Mediana", "Grande"]
    @IBOutlet weak var tamanoPickerView: UIPickerView!
    var tamanoPizza: String?
    var pizza = Pizza()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tamanoPickerView.dataSource = self
        tamanoPickerView.delegate = self
        
        tamanoPizza = tamanosPizza.first
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        tamanoPizza = tamanosPizza[row]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        pizza.tamano = tamanoPizza
        
        let vistaSiguiente = segue.destinationViewController as! TipoMasaPizza
        vistaSiguiente.pizza = self.pizza
    }
    
    func numberOfComponentsInPickerView(pickerView:UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tamanosPizza.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return tamanosPizza[row]
    }
}

