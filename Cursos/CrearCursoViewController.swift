//
//  CrearCursoViewController.swift
//  Cursos
//
//  Created by mbtec22 on 6/7/20.
//  Copyright © 2020 mbtec22. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var nomCurso: UITextField!
    @IBOutlet weak var promPractica: UITextField!
    @IBOutlet weak var promLab: UITextField!
    @IBOutlet weak var notaExamen: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func agregar(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let curso = Curso(context: context)
        
        curso.nomCurso = nomCurso.text!
        curso.promPractica = NSString(string : promPractica.text!).doubleValue
        curso.promLab = NSString(string : promLab.text!).doubleValue
        curso.notaExamen = NSString(string : notaExamen.text!).doubleValue
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        navigationController!.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
