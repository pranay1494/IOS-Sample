//
//  MyApiViewController.swift
//  Sample
//
//  Created by PranayBansal on 08/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit
import Foundation

class MyApiViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var mLoader: UIActivityIndicatorView!
    @IBOutlet weak var ivUserProfile: UIImageView!
    @IBOutlet weak var mUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let apiUrl = URL(string: "https://api.github.com/users/pranay1494")!
        
        self.mLoader.isHidden = false
        self.mLoader.startAnimating()
        let session = URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data else {
                print("url is nil");
                return
                
            }
            
            //By json serializer
//            do{
//                let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
//                let userName = json["login"] as! String
//                let avatarUrl = json["avatar_url"] as! String
//                DispatchQueue.main.async {
//                    self.mUserName.text = userName
//                }
//                print(avatarUrl)
//            }catch{
//                print(error)
//            }

            
            //using codable decoder(desiralization) and encoder(serialization)
            do{
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GithubApi.self, from: data)
                print(gitData)
                DispatchQueue.main.async {
                    self.mUserName.text = gitData.login
                }
                self.fetchImage(gitData.avatar_url)
            }catch{
                print(error)
            }
        }
        session.resume()
    }
    
    func fetchImage(_ url : String){
        let apiUrl = URL(string: url)!
        
        
        let session = URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data else {
                print("data is nil");
                return
                
            }
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.ivUserProfile.image = image
                self.mLoader.isHidden = true
                self.mLoader.stopAnimating()
            }
        }
        session.resume()
    }
    
}
