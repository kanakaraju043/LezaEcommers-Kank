//
//  NetWorkManager.swift
//  LezaEcommers
//
//  Created by KANAKARAJU GANDREDDI on 3/30/18.
//  Copyright © 2018 com.org.test. All rights reserved.
//

import UIKit
import Alamofire

let wsUrl = "http://dev.boutiqat.com/api/v2/search?q=&lang=en&category_id=&attribute_id=&brand_id=&boutique_id=&price_range=&in_stock=&page=1&per_page=10&user_id=297&store=KW&is_featured=1&latest=&sort=1"


class NetWorkManager: NSObject {

    typealias completionHandlerWithData = (NSArray) -> Void

    class  func getProductDetailsFromServer(completionHandler: @escaping completionHandlerWithData) -> Void {
        let url = URL(string: wsUrl)
    
        Alamofire.request(url!).responseJSON{ (response) in
            
            if let result = response.result.value {
                let JSON = result as! NSDictionary
                 // print(JSON)
                let jsonArray = JSON["data"] as? NSDictionary
                if let jsonArray = jsonArray{
                    completionHandler((jsonArray["products"] as? NSArray)!)

                }

            }
            
        };
    }
}
