//
// DatabaseConnectionClass.swift
// PackedSafe
//
// Created by Josua Gonzales-Neal on 8/9/16.
// Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//

import Foundation

//create a protocal for items retrieved
protocol ProductConnectionProtocal: class{
    func productDownloaded(items: Product)
}

class ProductConnection: NSObject, URLSessionDataDelegate  {
    
    //properties
    weak var delegate: ProductConnectionProtocal!
    
    var data : NSMutableData = NSMutableData()
    
    let urlPath : String? = ""
    
    func downloadedItems() {
        let url: URL = URL(string: urlPath!)!
        var session: URLSession
        //let configuration = URLSessionConfiguration.defaultSessionConfiguration()
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        
        //let task = session.dataTaskWithURL(url)
        let task = session.dataTask(with: url)
        
        task.resume()
    
    }
    
    

}
