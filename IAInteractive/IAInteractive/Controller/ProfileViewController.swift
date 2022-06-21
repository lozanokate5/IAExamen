//
//  ProfileViewController.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var cineLbl: UILabel!
    @IBOutlet weak var fechaLbl: UILabel!
    @IBOutlet weak var puntosLbl: UILabel!
    @IBOutlet weak var mensajeLbl: UILabel!
    
    var transaction : Transact?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func apicallCliente(){
        
          guard let url = URL(string: "https://stage-api.cinepolis.com/v2/members/loyalty/") else {return}
          
         let JsonString =  "{"+"card_number"+":"+"1303030763820961"+","+"country_code"+":"+"MX"+","+"pin"+":"+"4804"+","+"transaction_include"+":"+"true"+"}"
          
          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")
          request.setValue("stage_4V78Fwm_android", forHTTPHeaderField: "api_key")
          
          let pjson = JsonString
          let data = (pjson.data(using: .utf8))! as Data

          request.httpBody = data
          
          let task = URLSession.shared.dataTask(with: request) { data, response, error in
             if let data1 = data {
                  let jsonDecoder = JSONDecoder()
                 let finalMoo = try! jsonDecoder.decode(Transact.self, from: data1)
                 self.transaction = finalMoo
                 print("respuesta: \(finalMoo)")
                 DispatchQueue.main.async {
                     self.cineLbl.text = finalMoo.cinema as! String? ?? "nulo"
                     self.mensajeLbl.text = finalMoo.message as! String? ?? "nulo"
                     self.fechaLbl.text = finalMoo.date as! String? ?? "nulo"
                     self.puntosLbl.text = finalMoo.points as! String? ?? "nulo"
                 }
              }
          }
          task.resume()
    }
    
    @IBAction func consultarClick(_ sender: Any) {
        apicallCliente()
    }
    
    
    @IBAction func nextCarteleraClick(_ sender: Any) {
        
       /* let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "CarteleraViewController") as? CarteleraViewController
        self.navigationController?.pushViewController(vc!, animated: true)*/
        
        
         let storyboard = UIStoryboard (name: "Main", bundle: nil)
                 let resultVC = storyboard.instantiateViewController(withIdentifier: "CarteleraViewController")as! CarteleraViewController

                 // you can set any value stored in the destination VC here
                 //resultVC.name = "Ejemplo"
                 self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
}

