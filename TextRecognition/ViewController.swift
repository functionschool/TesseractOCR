//
//  ViewController.swift
//  TextRecognition
//
//  Created by Kazuyuki Nakatsu on 6/5/18.
//  Copyright © 2018 Kazuyuki Nakatsu. All rights reserved.
//

import UIKit
import TesseractOCR
import AVFoundation
import CoreGraphics


class ViewController: UIViewController, G8TesseractDelegate {
    
    //outlets
    @IBOutlet weak var textView: UITextView!
    
    // View life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //テザラクトのサンプルデータ言語設定と取り込み用の画像設定
        if let tesseract = G8Tesseract(language: "eng"){
            tesseract.delegate = self
            tesseract.image = UIImage(named: "demoText")?.g8_blackAndWhite()
            tesseract.recognize()
            textView.text = tesseract.recognizedText
            
            
            
            
            
            
        }
    }
    
    
    
    func progressImageRecognition(for tesseract: G8Tesseract!) {
        print("Recognition process \(tesseract.progress)%")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

