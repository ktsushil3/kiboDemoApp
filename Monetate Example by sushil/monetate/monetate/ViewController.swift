//
//  ViewController.swift
//  monetate
//
//  Created by Sushil Tiwari on 07/10/21.
//

import UIKit
import monetate_ios_sdk
import LGSideMenuController

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var lbl:UILabel = UILabel(frame: CGRect(x: self.view.frame.minX, y: self.view.frame.maxY/2, width: self.view.frame.width, height: 40))
        lbl.text = "Monetate"
        lbl.textAlignment = .center
        self.view.addSubview(lbl)
    
    }


}

