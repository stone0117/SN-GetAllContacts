//
//  SNQRCodeManager.swift
//  二维码生成_测试
//
//  Created by stone on 16/6/10.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit

class SNQRCodeManager: NSObject {

	/** 设置 二维码 大小 */
	func generateQRCode(codeString: String, size: CGSize) -> UIImage {

		let qrfilter = CIFilter(name: "CIQRCodeGenerator")

		qrfilter?.setDefaults()

		let value = codeString.dataUsingEncoding(NSUTF8StringEncoding)
		qrfilter?.setValue(value, forKey: "inputMessage")

		var ciimage = qrfilter?.outputImage

		let extent = ciimage?.extent

		ciimage = ciimage?.imageByApplyingTransform(CGAffineTransformMakeScale(size.width / extent!.width, size.height / extent!.height))

		return UIImage(CIImage: ciimage!)
	}
	/** 设置 二维码 大小 中心图片 */
	func generateQRCode(codeString: String, size: CGSize, meImage: UIImage) -> UIImage {

		let qrfilter = CIFilter(name: "CIQRCodeGenerator")

		qrfilter?.setDefaults()

		let value = codeString.dataUsingEncoding(NSUTF8StringEncoding)
		qrfilter?.setValue(value, forKey: "inputMessage")

		var ciimage = qrfilter?.outputImage

		let extent = ciimage?.extent

		ciimage = ciimage?.imageByApplyingTransform(CGAffineTransformMakeScale(size.width / extent!.width, size.height / extent!.height))

		let image = UIImage(CIImage: ciimage!)

		UIGraphicsBeginImageContextWithOptions(CGSize(width: image.size.width, height: image.size.height), false, UIScreen.mainScreen().scale)

		image.drawInRect(CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

		let w = size.width * 0.2

		meImage.drawInRect(CGRect(x: (image.size.width - w) * 0.5, y: (image.size.height - w) * 0.5, width: w, height: w))

		let finalImage = UIGraphicsGetImageFromCurrentImageContext()

		UIGraphicsEndImageContext()

		return finalImage
	}

	/** 设置 二维码 大小 颜色 中心图片 */
	func generateQRCode(codeString: String, size: CGSize, inputColors: [CIColor], meImage: UIImage) -> UIImage {

		let qrfilter = CIFilter(name: "CIQRCodeGenerator")

		qrfilter?.setDefaults()

		let value = codeString.dataUsingEncoding(NSUTF8StringEncoding)
		qrfilter?.setValue(value, forKey: "inputMessage")

		var ciimage = qrfilter?.outputImage

		// set color
        // print(colorFilter?.inputKeys)

		let colorFilter = CIFilter(name: "CIFalseColor")
		colorFilter?.setDefaults()

        /** 忘了写这个各种崩 */
		colorFilter?.setValue(ciimage, forKey: "inputImage")
		colorFilter?.setValue(inputColors[0], forKey: "inputColor0")
		colorFilter?.setValue(inputColors[1], forKey: "inputColor1")

		ciimage = colorFilter?.outputImage

		let extent = ciimage?.extent

		ciimage = ciimage?.imageByApplyingTransform(CGAffineTransformMakeScale(size.width / extent!.width, size.height / extent!.height))

		let image = UIImage(CIImage: ciimage!)
        //=========  ============================ stone 🐳 ===========/
		UIGraphicsBeginImageContextWithOptions(CGSize(width: image.size.width, height: image.size.height), false, UIScreen.mainScreen().scale)

		image.drawInRect(CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))

		let w = size.width * 0.2

		meImage.drawInRect(CGRect(x: (image.size.width - w) * 0.5, y: (image.size.height - w) * 0.5, width: w, height: w))

		let finalImage = UIGraphicsGetImageFromCurrentImageContext()

		UIGraphicsEndImageContext()

		return finalImage
	}

}
