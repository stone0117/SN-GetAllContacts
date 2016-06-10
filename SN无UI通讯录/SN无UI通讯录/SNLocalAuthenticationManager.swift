//
//  SNLocalAuthenticationManager.swift
//  指纹识别_测试
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit
import LocalAuthentication
class SNLocalAuthenticationManager: NSObject {

    func addLocalAuthenticationFunction(localizedReason:String, successBlock:(()->Void)) -> Void {
        let context = LAContext()
        
        if context.canEvaluatePolicy(LAPolicy.DeviceOwnerAuthentication, error: nil) {
            
            context.evaluatePolicy(LAPolicy.DeviceOwnerAuthentication, localizedReason: localizedReason, reply: { (success, error) in
                
                if error != nil {
                    print(error?.code)
                }
                
                if success {
                    successBlock()
                }
            })
        }
    }
}
