//
//  ViewController.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit
import AddressBook
class ViewController: UIViewController {

	// ========= lazy imageView ============================ stone 🐳 ===========/
	private lazy var imageView: UIImageView = {

		let imgView = UIImageView()

		return imgView
	}()
	// ================================================/

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		imageView.frame = CGRect(x: 20, y: 20, width: 200, height: 200)

		let manager = SNQRCodeManager()
		// let image = manager.generateQRCode("项羽,刘邦...", size: imageView.bounds.size)
		// let image = manager.generateQRCode("下雨天了怎么办,我好想你", size: imageView.bounds.size, meImage: UIImage(named: "1593863")!)

		let colors = [
			CIColor(color: UIColor.orangeColor()),
			CIColor(color: UIColor.blueColor())
		]
		let image = manager.generateQRCode("下雨天了怎么办,我好想你", size: imageView.bounds.size, inputColors: colors, meImage: UIImage(named: "1593863")!)
		imageView.image = image

		view.addSubview(imageView)
	}
	override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

		let manager = SNContactsManager()

		let arr = manager.getAllContacts()

		// print(arr)

		for i in 0 ..< arr.count {
			let contact = arr[i]
			print("name = \(contact.fullName ?? "")")

			if let phoneNumbers = contact.phoneNumbers {
				print(phoneNumbers)
			}
			print("//===================================== stone 🐳 ===========/")
		}

	}
}