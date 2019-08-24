//
//  ViewController.swift
//  CartButtonView
//
//  Created by Ubrain on 22/08/19.
//  Copyright © 2019 Ubrain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ubButtons = UBCartView.instanceFromNib() as! UBCartView
        ubButtons.frame = CGRect(x: 100, y: 100, width: 120, height: 40)
        ubButtons.loadInitalview()
        
        ubButtons.cartQtyResponse = { (qty) in
            print(qty as Any)
        }
        self.view.addSubview(ubButtons)
        
    }

}

