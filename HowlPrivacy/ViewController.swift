//
//  ViewController.swift
//  HowlPrivacy
//
//  Created by 유명식 on 2017. 5. 11..
//  Copyright © 2017년 swift. All rights reserved.
//

import UIKit
import AVFoundation
import Photos


class ViewController: UIViewController,UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cameraStatus = AVCaptureDevice.authorizationStatus(forMediaType:  AVMediaTypeVideo)
        
        if cameraStatus == .authorized{
            //승인
        
        } else if cameraStatus == .restricted{
            //일부권한
            
        }else if cameraStatus == .notDetermined{
            //아직 물어보지 않는 부분
            
        }else if cameraStatus == .denied{
            // 거절 한 부분
//            DispatchQueue.main.async {
//                let alert = UIAlertController(title: "권한", message: "카메라 권한을 받아오지 못했습니다.", preferredStyle: UIAlertControllerStyle.alert)
//                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//            }
            
            
        }
        
        let photoStatus = PHPhotoLibrary.authorizationStatus()
        
        if photoStatus == .authorized{
            //승인
            
        } else if photoStatus == .restricted{
            //일부권한
            
        }else if photoStatus == .notDetermined{
            //아직 물어보지 않는 부분
            
        }else if photoStatus == .denied{
            // 거절 한 부분
            DispatchQueue.main.async {
                let alert = UIAlertController(title: "권한", message: "앨범 권한을 받아오지 못했습니다.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func camera(_ sender: Any) {
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
        
        
    }
    @IBAction func album(_ sender: Any) {
        
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
}

