//
//  SNPersonInfo.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit

class SNContact: NSObject {

	var firstName: String?
	var lastName: String?
	var fullName: String? {
		get {
			return (self.firstName ?? "") + " " + (self.lastName ?? "")
		}
	}
	var phoneNumbers: [SNPhoneNumber]?
}

class SNPhoneNumber: NSObject {
	var label: String?
	var phone: String?
    
    override var description: String{
        return (label ?? "") + ": " + (phone ?? "")
    }
}

