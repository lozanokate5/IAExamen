//
//  Service.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import Foundation

public class Service {
    
    var pelicula : Perfil?
    
    
    func apicallCartelera(){
        guard let url = URL(string: "https://stage-api.cinepolis.com/v2/movies?country_code=MX&cinema=61") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("stage_HNYh3RaK_Test", forHTTPHeaderField: "api_key")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
           if let data1 = data {
                let jsonDecoder = JSONDecoder()
               let finalMoo = try? jsonDecoder.decode(Perfil.self, from: data1)
               self.pelicula = finalMoo
               print("RespuestaCine: \(String(describing: finalMoo))")
               
               /*DispatchQueue.main.async {
                   self.cinemaLbl.text = finalMoo.cinema as! String? ?? "nulo"
                   self.respLbl.text = finalMoo.message as! String? ?? "nulo"
                   self.dateLbl.text = finalMoo.date as! String? ?? "nulo"
                   self.points.text = finalMoo.points as! String? ?? "nulo"
               }*/
            }
        }
        task.resume()
    }
    
    
    func apicallToken(user : String, passw : String){
        let parameters: [String : Any] = [
            "username":user,
            "password":passw
        ]
        
        guard let url = URL(string: "https://stage-api.cinepolis.com/v2/oauth/token") else {return}
        
        let JsonString = "country_code=MX&username=pruebas_beto_ia@yahoo.com&password=Pruebas01&grant_type=password&client_id=IATestCandidate&client_secret=c840457e777b4fee9b510fbcd4985b68"
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("stage_HNYh3RaK_Test", forHTTPHeaderField: "api_key")
        
        let pjson = JsonString
        let data = (pjson.data(using: .utf8))! as Data

        request.httpBody = data
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            let jsonRes = try? JSONSerialization.jsonObject(with: data!, options: [])
            print("Response json is: \(jsonRes)")
        }
        task.resume()
    }
}
