//
//  ListTableViewController.swift
//  PackedSafe
//
//  Created by Josua Gonzales-Neal on 7/21/16.
//  Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

class ListViewController: UIViewController, UITableViewDelegate{
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
        //Change status bar color
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
            //let fancySwiftColor = UIColor(red: 1.0, green: 0.6, blue: 51)
            let color = UIColor.init(red: 249, green: 198, blue: 114)
            statusBar.backgroundColor = color
        }
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //get cell from Product Table View Cell Class
        guard let cell = tableView.cellForRow(at: indexPath) as? ProductTableViewCell else {return}
        
        cell.CompanyName.text = "PackedSafe Example"
        cell.ProductName.text = "Pack of Example"
        cell.ProductImage.image = #imageLiteral(resourceName: "Image")
        
        
    }
}
