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
        
        let rotationFrame = CGRectMake(0, dh * 0.2, dw, dh * 0.5)
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
        
        let fixFrame = CGRectMake(0, dh * 0.7, dw, dh * 0.3)
        //fixView factor
        let firstText = UILabel(frame: fixFrame)
        firstText.text = "The text of first view. This text is not rotatable"
        firstText.textColor = UIColor.whiteColor()
        let secondText = UILabel(frame: fixFrame)
        secondText.text = "The text of second view. Smooth rotation will contribute to user's high grade UX"
        secondText.textColor = UIColor.whiteColor()
        let thirdText = UILabel(frame: fixFrame)
        thirdText.text = "The text of third view. If you like, please star me."
        thirdText.textColor = UIColor.whiteColor()
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

