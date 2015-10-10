//
//  ConfirmacionPizza.swift
//  AppPizza
//
//  Created by Eduardo on 10/10/15.
//  Copyright © 2015 EduardoAndrade. All rights reserved.
//

import UIKit

class ConfirmacionPizza: UIViewController {
    
    var pizza : Pizza?
    
    var textoPizzaCompletada : String?
    
    @IBOutlet weak var labelPizza: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Esta es la pizza: \(pizza?.tamano), \(pizza?.tipoMasa), \(pizza?.tipoQueso), \(pizza?.ingredientes)")
    }
    
    @IBAction func irALaVistaDeConfirmacion(sender: UIButton) {
        
        let alertaConfirmacion = UIAlertController(title: "Enviaremos tu pizza al horno", message: "Vamos a enviar tu pizza a la cocina, deseas confirmar tus ingredientes", preferredStyle: UIAlertControllerStyle.Alert)
        let confirmar = UIAlertAction(title: "Confirmar", style: .Default) {
            (action) in let vistaPizzaLista = self.storyboard?.instantiateViewControllerWithIdentifier("vistaPizzaLista") as? PizzaLista
            self.navigationController?.pushViewController(vistaPizzaLista!, animated: true)
        }
        
        alertaConfirmacion.addAction(confirmar)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .Cancel, handler: nil)
        alertaConfirmacion.addAction(cancelar)
        
        presentViewController(alertaConfirmacion, animated: true, completion: nil)

        
    }
    
    
    override func viewWillAppear(animated: Bool) {
        textoPizzaCompletada = "Tu Pizza es \(pizza!.tamano!)\ntiene una masa \(pizza!.tipoMasa!)\nsu tipo de queso es \(pizza!.tipoQueso!)\ntiene los siguientes ingredientes\n"
        
        for ingredienteActual in pizza!.ingredientes! {
            textoPizzaCompletada! = textoPizzaCompletada! + "\(ingredienteActual)\n"
        }
        labelPizza.text = textoPizzaCompletada
        labelPizza.sizeToFit()

        
    }
}
