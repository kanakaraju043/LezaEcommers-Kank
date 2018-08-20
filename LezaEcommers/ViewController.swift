//
//  ViewController.swift
//  LezaEcommers
//
//  Created by KANAKARAJU GANDREDDI on 3/30/18.
//  Copyright © 2018 com.org.test. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDataSource{

    @IBOutlet weak var productsCollectionView: UICollectionView!
    var yourArray:NSArray?
    let columns: CGFloat = 2.0
    let lineSpace: CGFloat = 0.0
    let inset: CGFloat = 0.0
    let space: CGFloat = 0.0
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         
        
        NetWorkManager.getProductDetailsFromServer { (data) in
            DispatchQueue.main.async {
                self.yourArray = data
                
                self.productsCollectionView.reloadData()
            }        }
        
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if let dataArray = yourArray{
            return dataArray.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        // Configuring Cell
        let dataItem = yourArray![indexPath.item]
        cell.renderPrdouctuctInformationOnUI(productInformation: dataItem as? NSDictionary)
        return cell
    }
    


}



// MARK: UICollectionViewDelegateFlowLayout

extension ViewController: UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        let width = Int((collectionView.frame.width/columns) - (inset+space))
        return CGSize(width: width ,height: 330)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsets(top: inset , left: inset ,bottom: inset , right: inset)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        
        return lineSpace
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        
        return space
    }
    
    
}
