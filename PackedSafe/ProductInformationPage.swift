//
//  ProductInformation.swift
//  PackedSafe
//
//  Created by Josua Gonzales-Neal on 7/21/16.
//  Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//

import Foundation
import UIKit

class ProductInformaitonPage: UIViewController {
	
	//Product Information variables

	
	@IBOutlet weak var NavigationBar: UINavigationBar!
	@IBAction func BackButton(_ sender: AnyObject) {
		
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		NavigationBar.topItem?.title = "Test"
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
}
