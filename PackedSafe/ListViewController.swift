//
//  ListTableViewController.swift
//  PackedSafe
//
//  Created by Josua Gonzales-Neal on 7/21/16.
//  Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//
//VC = View Controller

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

class ListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
	
	//Products
    var listOfProducts = [Product]()
	
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
        
//        guard let cell = tableView.cellForRow(at: indexPath) as? ProductTableViewCell else {return}
//        
//        cell.CompanyName.text = "PackedSafe Example"
//        cell.ProductName.text = "Pack of Example"
//        cell.ProductImage.image =
//        
        
        
        //Help from:
        //http://stackoverflow.com/questions/26207846/pass-data-through-segue
        
        //let selectedProduct = Product(uniqueURL: cell.uniqueProductURL)
        
        //Get unique url from product at the selected row
        let selectedProduct = listOfProducts[indexPath.row]
        
        //Connect segue to destination controller
        let destinationVC = ProductInformaitonPage()
        destinationVC.newProduct = selectedProduct
        
        //Perform the Segue and pre-load the variable to use in ProductInformation Page
        destinationVC.performSegue(withIdentifier: "productPageSegue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Set the cellForRowAt and return object UITAbleViewCell
        guard let cell = tableView.cellForRow(at: indexPath) as? ProductTableViewCell else {return UITableViewCell.init()}
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Set the number of Rows in the section and return int
        return listOfProducts.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        //Need to send information of Product to ProductInformationPage UIViewController
        
        //Creating a variable that I want to send to another Page^
        //var newProduct = Product(ProductImage: <#T##UIImage#>, ProductName: <#T##String#>, CompanyName: <#T##String#>, uniqueURL: <#T##URL#>)
        
        //Create a new variable to store hte instance of ProductINformationPage VC
        
        
        
    }
}
