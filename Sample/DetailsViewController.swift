//
//  DetailsViewController.swift
//  Sample
//
//  Created by PranayBansal on 03/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var ivPoop: UIImageView!
    @IBOutlet weak var detailText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPoop.image = UIImage(named: "poop_Emoji")
        detailText.text = "IOS Is a piece of shit"
    }

}
