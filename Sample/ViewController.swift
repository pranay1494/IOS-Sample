//
//  ViewController.swift
//  Sample
//
//  Created by PranayBansal on 01/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mHeaderText: UITextView!
    
    @IBOutlet weak var mUsername: UITextField!
    
    @IBOutlet weak var mSubmitButton: UIButton!
    
    @IBOutlet weak var mPassword: UITextField!
    
    var nameEntered = ""
    
    @IBAction func mSubmit(_ sender: UIButton) {
        mHeaderText.text = mUsername.text
        mUsername.resignFirstResponder()
        mPassword.resignFirstResponder()
//        performSegue(withIdentifier: "name", sender: self)
    }
    
    @objc func push() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NameViewController") as! NameViewController
        vc.name = mUsername.text ?? ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mSubmitButton.titleEdgeInsets = UIEdgeInsets(top:10,left:10,bottom:10,right:10)
        mSubmitButton.layer.cornerRadius = 10
        mSubmitButton.layer.borderWidth = 1
        mSubmitButton.layer.borderColor = UIColor.black.cgColor
        mUsername.layer.borderWidth = 0.4
        mUsername.layer.borderColor = UIColor.blue.cgColor
        mPassword.layer.borderWidth = 0.4
        mPassword.layer.borderColor = UIColor.blue.cgColor
        let paddingView = UIView(frame: CGRect(x:0, y:0, width:15, height:500))
        
        mUsername.leftView = paddingView
        
        mUsername.leftViewMode = .always
        
        
        mSubmitButton.addTarget(self, action: #selector(push), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let vc = segue.destination as! NameViewController
//        vc.name = mUsername.text!
//
//
//    }


}

