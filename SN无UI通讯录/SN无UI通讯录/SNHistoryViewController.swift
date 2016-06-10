//
//  SNHistoryViewController.swift
//  SN无UI通讯录
//
//  Created by stone on 16/6/11.
//  Copyright © 2016年 stone. All rights reserved.
//

import UIKit
import AVFoundation
class SNHistoryViewController: UIViewController {
    
    /** 摄像头 */
    var videoInput: AVCaptureDeviceInput?
    /** 麦克风 */
    var audioInput: AVCaptureDeviceInput?
    /** 输出设备 */
    var fileOutput: AVCaptureMovieFileOutput?
    /** 会话 --> 连接输入和输出设备 */
    var session: AVCaptureSession?
    /** 预览的图层 */
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let videoDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do {
            // try : 发生异常会跳到catch中继续执行
            // try! : 发生异常程序直接崩溃
            videoInput = try AVCaptureDeviceInput(device: videoDevice)
        } catch {
            // 发生异常之后会执行的代码
            print(error)
        }
        
        let audioDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeAudio)
        audioInput = try! AVCaptureDeviceInput(device: audioDevice)
        
        fileOutput = AVCaptureMovieFileOutput()
        
        session = AVCaptureSession()
        
        if session?.canAddInput(videoInput) == true {
            session?.addInput(videoInput)
        }
        if session?.canAddInput(audioInput) == true {
            session?.addInput(audioInput)
        }
        if session?.canAddOutput(fileOutput) == true {
            session?.addOutput(fileOutput)
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: self.session)
        self.previewLayer = previewLayer
        
        previewLayer.frame = view.bounds
        view.layer.addSublayer(previewLayer)
        
        /** 不需要关闭的吗? */
        session?.startRunning()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if fileOutput?.recording == true {
            fileOutput?.stopRecording()
        } else {
            let path = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).last
            
            let urlPath = (path! as NSString).stringByAppendingPathComponent("123.mov")
            
            let url = NSURL(fileURLWithPath: urlPath)
            
            fileOutput?.startRecordingToOutputFileURL(url, recordingDelegate: self)
        }
    }
}
extension SNHistoryViewController: AVCaptureFileOutputRecordingDelegate {
    func captureOutput(captureOutput: AVCaptureFileOutput!, didStartRecordingToOutputFileAtURL fileURL: NSURL!, fromConnections connections: [AnyObject]!) {
        print("开始录制")
    }
    func captureOutput(captureOutput: AVCaptureFileOutput!, didFinishRecordingToOutputFileAtURL outputFileURL: NSURL!, fromConnections connections: [AnyObject]!, error: NSError!) {
        print("结束录制")
    }
    
}

