//
//  SNSearchViewController.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit

class SNSearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let manager = SNLocalAuthenticationManager()
        
        manager.addLocalAuthenticationFunction("使用指纹识别更安全") {
            print("跳转页面")
        }
        
    }
}
