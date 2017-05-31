//
//  DetalleViewController.swift
//  tareas
//
//  Created by tecnico on 31/5/17.
//  Copyright © 2017 tecnico. All rights reserved.
//

import UIKit
import CoreData

class DetalleViewController: UIViewController {

    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var texto: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    
    @IBOutlet weak var importante: UILabel!
    
    var tarea:Tarea?
    override func viewDidLoad() {
        super.viewDidLoad()

        nombre.text=tarea?.nombre
        texto.text=tarea?.texto
        if (tarea?.importante==true){
            //CTRL + CMD + SPACE  para sacar icono
            importante.text="⭐️"
        }else{
        importante.text=""
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
