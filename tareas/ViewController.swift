//
//  ViewController.swift
//  tareas
//
//  Created by tecnico on 31/5/17.
//  Copyright © 2017 tecnico. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var nombre: UITextField!
    @IBOutlet weak var texto: UITextField!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var importante: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func añadirTarea(_ sender: Any) {
        
        //con esto llamamos a nuestro repoistorio de entidades
        let contexto=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //nueva tarea, desde entidad
        let tarea=Tarea(context: contexto)
        
        //relleno la tarea con datos
        tarea.nombre=nombre.text//"cortar cesped"
        tarea.texto=texto.text//"robar el cortacesped a flanders y cortar el cesped de la casa okupa"
        tarea.importante=importante.isOn
        //TODO: queda la imagen
        
        //guardo la tarea
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //nos queda vaciar los campos de texto
        nombre.text=""
        texto.text=""
        importante.isOn=false
    
        
    }
}

