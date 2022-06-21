//
//  ViewController.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    
    var serv = Service()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func accesoClick(_ sender: Any) {
          guard let userTxt = self.userTxt.text else {return}
          guard let passTxt = self.passTxt.text else {return}
          
          
          if(userTxt == "pruebas_beto_ia@yahoo.com") && (passTxt == "Pruebas01"){
              serv.apicallToken(user: userTxt,passw: passTxt)
              let alert = UIAlertController(title: "Bienvenido", message: "Usuario y password correctos", preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
              
         
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController
         self.navigationController?.pushViewController(vc!, animated: true)
         
          } else if (userTxt == "") || (passTxt == "") {
              let alert = UIAlertController(title: "Alert", message: "Usuario o password se encuentran vacios", preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          } else if (userTxt != "pruebas_beto_ia@yahoo.com") && (passTxt != "Pruebas01"){
              let alert = UIAlertController(title: "Alert", message: "El usuario y/o password son incorrectos", preferredStyle: UIAlertController.Style.alert)
              alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
              self.present(alert, animated: true, completion: nil)
          }
        
    }
    
}

