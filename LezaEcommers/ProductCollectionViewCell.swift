//
//  ProductCollectionViewCell.swift
//  LezaEcommers
//
//  Created by KANAKARAJU GANDREDDI on 3/30/18.
//  Copyright © 2018 com.org.test. All rights reserved.
//

import UIKit
import Kingfisher

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var discountLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productNameLabel: UILabel!
    
    @IBOutlet weak var offerPriceLabel: UILabel!
    
    @IBOutlet weak var favouriteImageView: UIImageView!
    
    @IBOutlet weak var regularPriceLabel: UILabel!
    
    @IBOutlet weak var discriptionLabel: UILabel!
    
    @IBOutlet weak var discountOfferView: UIView!

    func renderPrdouctuctInformationOnUI(productInformation: NSDictionary?) {
        
        if #available(iOS 11.0, *) {
            discountOfferView.clipsToBounds = true
            discountOfferView.layer.cornerRadius = discountOfferView.frame.size.height/2
            //            discountOfferView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMinXMinYCorner,.layerMinXMinYCorner,.layerMinXMaxYCorner]
            discountOfferView.layer.maskedCorners = [.layerMaxXMinYCorner,.layerMaxXMaxYCorner]
            
            
        } else {
            // Fallback on earlier versions
        }
        
        
       // discountLabel.text = productInformation?.object(forKey: "flash_discount") as? String
        productNameLabel.text = productInformation?.object(forKey: "name") as? String
        offerPriceLabel.text = "KWD \(productInformation?.object(forKey: "final_price") as? String ?? "")"

        regularPriceLabel.text = "KWD \(productInformation?.object(forKey: "regular_price") as? String ?? "")"

        discriptionLabel.text = productInformation?.object(forKey: "description") as? String
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: regularPriceLabel.text!)
        attributeString.addAttribute(NSAttributedStringKey.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        regularPriceLabel.attributedText = attributeString
        
        let urlRequest = productInformation?.object(forKey: "image") as! String
        
        let url:URL = URL.init(string: urlRequest)!
        let r = ImageResource(downloadURL: url, cacheKey: nil)
        productImageView.kf.setImage(with: r, placeholder: nil)
        productImageView.kf.setImage(with: r)
        
    }
}
