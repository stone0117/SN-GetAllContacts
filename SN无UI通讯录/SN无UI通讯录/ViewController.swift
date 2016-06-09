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

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
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