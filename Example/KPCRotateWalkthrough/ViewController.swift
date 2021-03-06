//
//  ViewController.swift
//  KPCRotateWalkthrough
//
//  Created by Kaihoko Kenta on 03/19/2016.
//  Copyright (c) 2016 Kaihoko Kenta. All rights reserved.
//

import UIKit
import KPCRotateWalkthrough

class ViewController: UIViewController {
    
    var fixView: [UIView] = []
    var rotationView: [UIView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 1/255, green: 143/255, blue: 100/255, alpha: 1.0)
        
        let dh: CGFloat = self.view.frame.height
        let dw: CGFloat = self.view.frame.width
        
        let rotationFrame = CGRectMake(0, dh * 0.1, dw, dh * 0.7)
        //rotationView factor
        let firstImage = UIImageView(frame: rotationFrame)
        firstImage.contentMode = .ScaleAspectFit
        firstImage.image = UIImage(named: "first")
        let secondImage = UIImageView(frame: rotationFrame)
        secondImage.contentMode = .ScaleAspectFit
        secondImage.image = UIImage(named: "second")
        let thirdImage = UIImageView(frame: rotationFrame)
        thirdImage.contentMode = .ScaleAspectFit
        thirdImage.image = UIImage(named: "third")
        rotationView.append(firstImage)
        rotationView.append(secondImage)
        rotationView.append(thirdImage)
        
        let fixFrame = CGRectMake(50, dh * 0.8, dw - 100, dh * 0.2)
        //fixView factor
        let firstText = UILabel(frame: fixFrame)
        firstText.text = "The text of first view. \nThis text is not rotatable"
        firstText.textColor = UIColor.whiteColor()
        firstText.numberOfLines = 0
        firstText.textAlignment = .Center
        let secondText = UILabel(frame: fixFrame)
        secondText.text = "The text of second view. \nSmooth rotation will contribute to user's high grade UX"
        secondText.textColor = UIColor.whiteColor()
        secondText.numberOfLines = 0
        secondText.textAlignment = .Center
        let thirdText = UILabel(frame: fixFrame)
        thirdText.text = "The text of third view. \nIf you like, please star me. \nThis Library was developed for Channel on AppStore"
        thirdText.textColor = UIColor.whiteColor()
        thirdText.numberOfLines = 0
        thirdText.textAlignment = .Center
        fixView.append(firstText)
        fixView.append(secondText)
        fixView.append(thirdText)
        
        //Call WalkThroughView
        let wtv = WalkThroughView(frame: self.view.frame, fixView: fixView, rotationView: rotationView)
        self.view.addSubview(wtv)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

