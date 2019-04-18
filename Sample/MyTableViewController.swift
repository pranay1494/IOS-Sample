//
//  MyTableViewController.swift
//  Sample
//
//  Created by PranayBansal on 03/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit

class MyTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    let arr = ["Pranay","Bansal dkjahkjda dsakldalksds dklsandas dlaskndam, dadal dald lkad alsk da dkla dl","WOW","IOS sucks","This is shit"]
    
    var indexSelected = 0
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "custom_cell", for: indexPath)
        
        let label = cell.viewWithTag(1001) as! UILabel
        label.text = arr[indexPath.row]
        
        if let ivCell = cell.viewWithTag(1) as? UIImageView{
            ivCell.image = UIImage(named: "poop_Emoji")
        }
        
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexSelected = indexPath.row
        print("table row clicked")
        performSegue(withIdentifier: "details", sender: self)
    }
    
    
}
