//
//  ProductTableViewCell.swift
//  PackedSafe
//
//  Created by Josua Gonzales-Neal on 7/21/16.
//  Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
	
	//Cell Attributes (Product Details)
	@IBOutlet weak var ProductImage: UIImageView!
	@IBOutlet weak var ProductName: UILabel!
	@IBOutlet weak var CompanyName: UILabel!
	
	func setProductImage(imageData:UIImage) {
		ProductImage.image = imageData
	}
	
	func setProductName(name:String) {
		ProductName.text = name
	}
	
	func setCompanyName(name:String) {
		CompanyName.text = name
	}
	
	
}
