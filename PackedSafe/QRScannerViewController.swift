//
//  QRScannerViewController.swift
//  PackedSafe
//
//  Created by Josua Gonzales-Neal on 7/21/16.
//  Copyright © 2016 Josua Gonzales-Neal. All rights reserved.
//

import AVFoundation
import UIKit

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {

	//QRcode variables
	var objCaptureSession:AVCaptureSession?
	var objCaptureVideoPreviewLayer:AVCaptureVideoPreviewLayer?
	var vwQRCode:UIView?

	@IBOutlet weak var lblQRCodeResult: UILabel!
    @IBAction func closeButton(_ sender: AnyObject) {
        
    }
	
	func configureVideoCapture() {
		let objCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
		//let objCaptureDevice = AVCaptureDevice.devices().filter{$0.hasMediaType(AVMediaTypeVideo) && $0.position == AVCaptureDevicePosition.back }
		var error:NSError?
		let objCaptureDeviceInput: AnyObject!
		
		
		do {
			objCaptureDeviceInput = try AVCaptureDeviceInput(device: objCaptureDevice) as AVCaptureDeviceInput
		} catch let error1 as NSError {
			error = error1
			objCaptureDeviceInput = nil
		}
		
		if (error != nil) {
			//old way - let alertView:UIAlertController = UIAlertController(title: "Device Error", message:"Device not Supported for this Application", delegate: nil, cancelButtonTitle: "Ok Done")
			let alertView:UIAlertController = UIAlertController(title: "Device Error", message: "Device not Supported for this Application", preferredStyle: UIAlertControllerStyle.alert)
			let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
				print("OK")
			}
			alertView.addAction(okAction)
			//old way - self.presentViewController(alertView, animated: true, completion: nil)
			self.present(alertView, animated: true, completion: nil)
			return
		}
		
		
		objCaptureSession = AVCaptureSession()
		objCaptureSession?.addInput(objCaptureDeviceInput as! AVCaptureInput)
		let objCaptureMetadataOutput = AVCaptureMetadataOutput()
		objCaptureSession?.addOutput(objCaptureMetadataOutput)
		//objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main())
		objCaptureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
		objCaptureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
	}

	func addVideoPreviewLayer()
	{
		objCaptureVideoPreviewLayer = AVCaptureVideoPreviewLayer(session: objCaptureSession)
		objCaptureVideoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
		objCaptureVideoPreviewLayer?.frame = view.layer.bounds
		self.view.layer.addSublayer(objCaptureVideoPreviewLayer!)
		objCaptureSession?.startRunning()
		self.view.bringSubview(toFront: lblQRCodeResult)
	}
	
	func initializeQRView() {
		vwQRCode = UIView()
		vwQRCode?.layer.borderColor = UIColor.green.cgColor
		vwQRCode?.layer.borderWidth = 5
		self.view.addSubview(vwQRCode!)
		//self.view.bringSubviewToFront(vwQRCode!)
		self.view.bringSubview(toFront: vwQRCode!)
	}

	func captureOutput(_ captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, from connection: AVCaptureConnection!) {
		if metadataObjects == nil || metadataObjects.count == 0 {
			//vwQRCode?.frame = CGRectZero
			vwQRCode?.frame = CGRect.zero
			lblQRCodeResult.text = "NO QRCode text detacted"
			return
		}
		let objMetadataMachineReadableCodeObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
		if objMetadataMachineReadableCodeObject.type == AVMetadataObjectTypeQRCode {
			//let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObjectForMetadataObject(objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
			let objBarCode = objCaptureVideoPreviewLayer?.transformedMetadataObject(for: objMetadataMachineReadableCodeObject as AVMetadataMachineReadableCodeObject) as! AVMetadataMachineReadableCodeObject
			vwQRCode?.frame = objBarCode.bounds;
			if objMetadataMachineReadableCodeObject.stringValue != nil {
				lblQRCodeResult.text = objMetadataMachineReadableCodeObject.stringValue
			}
		}
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
        
        //Ask user for permission to use camera
        if AVCaptureDevice.authorizationStatus(forMediaType: AVMediaTypeVideo) == .notDetermined {
            AVCaptureDevice.requestAccess(forMediaType: AVMediaTypeVideo, completionHandler: { (granted: Bool) in
                if granted {
                    print("granted")
                }
                else {
                    print("not granted")
                }
            })
        }
		self.configureVideoCapture()
		self.addVideoPreviewLayer()
		self.initializeQRView()
	}
	
}
