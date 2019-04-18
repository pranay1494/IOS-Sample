//
//  NameViewController.swift
//  Sample
//
//  Created by PranayBansal on 02/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit

class NameViewController: UIViewController {

    var name : String? = ""
    
    @IBOutlet weak var myName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name!);
        myName.text = name
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapLabel))
        myName.addGestureRecognizer(tap)

    }
    
    @objc func didTapLabel(sender: UITapGestureRecognizer){
        print("tap happened")
        let storyBoard = UIStoryboard(name: "Main",bundle: nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "tableVC") as! MyTableViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
}
