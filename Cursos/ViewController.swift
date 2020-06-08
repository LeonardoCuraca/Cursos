//
//  ViewController.swift
//  Cursos
//
//  Created by mbtec22 on 6/7/20.
//  Copyright © 2020 mbtec22. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        
        cell.textLabel?.text = curso.nomCurso!
        
        let prom = (curso.promPractica + curso.promLab + curso.notaExamen) / 3
        
        if prom >= 14 {
            cell.backgroundColor = UIColor.green
        } else {
            cell.backgroundColor = UIColor.red
        }
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var cursos:[Curso] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction func agregarCurso(_ sender: Any) {
        performSegue(withIdentifier: "agregarSegue", sender: nil)
    }
    
    func obtenerCursos() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        } catch {
            print("HA OCURRIDO UN ERROR")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let curso = cursos[indexPath.row]
            context.delete(curso)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            obtenerCursos()
            self.tableView.reloadData()
        }
    }

}

