//
//  CarteleraViewController.swift
//  IAInteractive
//
//  Created by catalina lozano on 18/06/22.
//

import UIKit


class CarteleraViewController: UIViewController{//, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
   
    var pelicula : Perfil?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.dataSource = self
        
    }
    
    func apicallCartelera1(){
        guard let url = URL(string: "https://stage-api.cinepolis.com/v2/movies?country_code=MX&cinema=61") else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("stage_HNYh3RaK_Test", forHTTPHeaderField: "api_key")
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            do{ if error == nil {
                let jsonDecoder = JSONDecoder()
               let finalMoo = try! JSONDecoder().decode(Perfil.self, from: data!)
                self.pelicula = finalMoo
                print(String(describing: self.pelicula))
            }
            }catch{
                print("Error in get json data")
            }
            }
        task.resume()
    }
    
 /*   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pelicula?.count!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.nameLbl.text = pelicula[indexPath.row].name//heroes[indexPath.row].localized_name.capitalized
        return cell
    }
   */
    @IBAction func btnClick(_ sender: Any) {
        apicallCartelera1()
        print("hola")
    }
    
   
}
