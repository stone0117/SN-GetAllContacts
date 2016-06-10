//
//  SNTabBarController.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit

class SNTabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()

		let GlobalBackGroundColor = UIColor(red: 237.0 / 255.0, green: 237.0 / 255.0, blue: 237.0 / 255.0, alpha: 1.0)

		let nav1 = makeNavigationController(ViewController(), backgroundColor: GlobalBackGroundColor, tabBarSystemItem: .Favorites, tag: 0, title: "Favorites")
		let nav2 = makeNavigationController(UIViewController(), backgroundColor: GlobalBackGroundColor, tabBarSystemItem: .Contacts, tag: 1, title: "Contacts")
		let nav3 = makeNavigationController(SNSearchViewController(), backgroundColor: GlobalBackGroundColor, tabBarSystemItem: .Search, tag: 2, title: "Search")
		let nav4 = makeNavigationController(UIViewController(), backgroundColor: GlobalBackGroundColor, tabBarSystemItem: .History, tag: 3, title: "History")
		let nav5 = makeNavigationController(UIViewController(), backgroundColor: GlobalBackGroundColor, tabBarSystemItem: .More, tag: 4, title: "More")
		let controllers = [nav1, nav2, nav3, nav4, nav5]

		self.viewControllers = controllers
	}

	private func makeNavigationController(vc: UIViewController, backgroundColor: UIColor, tabBarSystemItem: UITabBarSystemItem, tag: Int, title: String) -> UINavigationController {

		vc.view.backgroundColor = backgroundColor
//		vc.navigationItem.title = title
		vc.tabBarItem = UITabBarItem(tabBarSystemItem: tabBarSystemItem, tag: tag)
		return UINavigationController(rootViewController: vc)
	}
}
