//
//  ListadoTableViewController.swift
//  tareas
//
//  Created by tecnico on 31/5/17.
//  Copyright © 2017 tecnico. All rights reserved.
//

import UIKit
import CoreData

class ListadoTableViewController: UITableViewController {
//me creo la propiedad para guardar un
    var tareas: [Tarea]=[]
    
    func cargarTareas(){
        
         let contexto=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //sintaxis Do try catch
        do
        {
            tareas=try contexto.fetch(Tarea.fetchRequest())
        }
        catch
        {
            print("Error al traer los datos")
        }
    
    }
 
    //ejecutado al cargar la vista
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    //ejecutado al cuando se refresca la vista
    override func viewWillAppear(_ animated: Bool) {
        cargarTareas()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tareas.count
    }

    //metodo que pinta cada celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celda", for: indexPath)
        var txtImportante:String=""
        // Configure the cell...
        if tareas[indexPath.row].importante==true{
                txtImportante="⭐️"
        }else{
            txtImportante=""
        }
        cell.textLabel?.text="\(tareas[indexPath.row].nombre!) \(txtImportante)"
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    {
        let contexto=(UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if editingStyle == .delete{
            
            let tarea=tareas[indexPath.row]
            
            contexto.delete(tarea)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            //actualizo mi vector de tablas
            cargarTareas()
            
            //recargo la tabla
            self.tableView.reloadData()
        }
        
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "verTarea"{
            let indexPath=self.tableView.indexPathForSelectedRow
            let tareaVC=segue.destination as! DetalleViewController
            tareaVC.tarea=tareas[(indexPath?.row)!]
            
        }
       
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
