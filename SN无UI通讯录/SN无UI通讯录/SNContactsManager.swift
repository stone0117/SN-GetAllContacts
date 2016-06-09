//
//  SNContactsManager.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit
import AddressBook

class SNContactsManager: NSObject {

	override init() {
		super.init()

		let status = ABAddressBookGetAuthorizationStatus()

		if status == ABAuthorizationStatus.NotDetermined {
			let addressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()

			ABAddressBookRequestAccessWithCompletion(addressBook, { (granted, error) in
				if granted == true {
					print("授权成功")
				}
			})
		}
	}

	func getAllContacts() -> [SNContact] {

		var contacts = [SNContact]()

		let addressBook = ABAddressBookCreateWithOptions(nil, nil).takeRetainedValue()

		let peoples = ABAddressBookCopyArrayOfAllPeople(addressBook).takeRetainedValue() as [ABRecord]

		for i in 0 ..< peoples.count {

			let contact = SNContact()

			let person = peoples[i]

			let firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty).takeRetainedValue() as! String
			let lastName = ABRecordCopyValue(person, kABPersonLastNameProperty).takeRetainedValue() as! String

			// print(firstName, lastName)
            // print("\(firstName) \(lastName)")

			contact.firstName = firstName
			contact.lastName = lastName

			var phoneArrM = [SNPhoneNumber]()

			let phoneNumbers: ABMultiValueRef = (ABRecordCopyValue(person, kABPersonPhoneProperty)?.takeRetainedValue())!

			// print(phoneNumbers)

			for index in 0 ..< ABMultiValueGetCount(phoneNumbers) {
				let phoneModel = SNPhoneNumber()

				let number = ABMultiValueCopyValueAtIndex(phoneNumbers, index)?.takeRetainedValue() as? String
				let label = ABMultiValueCopyLabelAtIndex(phoneNumbers, index)?.takeRetainedValue()

				// print(number,label)

				let str = self.subStringBetween(String(label), start: "_$!<", end: ">!$_")
//				print("\(str) = \(number!)")

				phoneModel.label = str
				phoneModel.phone = number ?? ""

				phoneArrM.append(phoneModel)

			}
			contact.phoneNumbers = phoneArrM
//			print("//===================================== stone 🐳 ===========/")

			contacts.append(contact)
		}

		return contacts
	}

}
extension SNContactsManager {
	/** 截取字符串 */
	private func subStringBetween(originalString: String, start: String, end: String?) -> String {

		let startFlag = start

		let startRange = originalString.rangeOfString(startFlag)

		if end == nil {

			let subStr = originalString.substringFromIndex(startRange!.endIndex)

			return subStr
		}

		let endFlag = end
		let endRange = originalString.rangeOfString(endFlag!)

		let range = startRange!.endIndex ..< endRange!.startIndex

		let subStr = originalString.substringWithRange(range)

		return subStr

	}
}
