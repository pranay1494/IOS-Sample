//
//  MyCollectionViewController.swift
//  Sample
//
//  Created by PranayBansal on 17/04/19.
//  Copyright © 2019 PranayBansal. All rights reserved.
//

import UIKit

class MyCollectionViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    let arr = ["Pranay","Bansal","WOW","IOS sucks","This is shit"]
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        
        let layout = self.mCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0,left: 5,bottom: 0,right: 5)
        layout.minimumLineSpacing = 40
        layout.itemSize = CGSize(width: mCollectionView.frame.size.width/4, height: mCollectionView.frame.size.height/4)
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = mCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.ivPoop.image = UIImage(named: "poop_Emoji")
        cell.mText.text = arr[indexPath.row]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showToast(controller: self, message : arr[indexPath.row], seconds: 2.0)
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .actionSheet)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
