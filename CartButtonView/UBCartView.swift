
//
//  UBCartView.swift
//  CartButtonView
//
//  Created by Ubrain on 22/08/19.
//  Copyright © 2019 Ubrain. All rights reserved.
//

import UIKit

//-(void)cartCountCart:(AddToCartButton *)cart qty:(int)qtycount;


class UBCartView: UIView {
    
    //@property(weak, nonatomic) IBOutlet BBCyclingLabel* scrollUpLabel;
    
    @IBOutlet var scrollUpLabel:BBCyclingLabel!
    
    @IBOutlet var btnPls:UIButton!
    @IBOutlet var btnMins:UIButton!
    @IBOutlet var btnAdd:UIButton!
    @IBOutlet var contrainLabel:NSLayoutConstraint!
    
    var buttonWidth:Int = 120
    public var cartQtyResponse: ((Int?) -> ())?
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "UBCartView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
    
    
    func loadInitalview()
    {
        btnPls.alpha = 0;
        btnMins.alpha = 0;
        contrainLabel.constant = 0;
        
        scrollUpLabel.textColor = .white
        
        scrollUpLabel.font = UIFont.systemFont(ofSize: 15)
        scrollUpLabel.shadowColor = UIColor.clear
        scrollUpLabel.numberOfLines = 1
        scrollUpLabel.textAlignment = .center
        scrollUpLabel.transitionDuration = 0.3
        scrollUpLabel.text = "Add"
        scrollUpLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollUp
        scrollUpLabel.clipsToBounds = true
    }
    
    
    func showAddButton()
    {
        btnAdd.isHidden = false
        btnPls.isHidden = true
        btnMins.isHidden = true
    }
    
    func hideAddButton()
    {
        btnAdd.isHidden = true
        btnPls.isHidden = false
        btnMins.isHidden = false
        btnPls.alpha = 1
        btnMins.alpha = 1
    }
    
    @objc func enableButtons()
    {
        btnAdd.isUserInteractionEnabled = true
        btnPls.isUserInteractionEnabled = true
        btnMins.isUserInteractionEnabled = true
    }
    
    @objc func disableButtons()
    {
        btnAdd.isUserInteractionEnabled = false
        btnPls.isUserInteractionEnabled = false
        btnMins.isUserInteractionEnabled = false
    }
    
    @IBAction func onClickAddToCart(_ sender: Any)
    {
        self.disableButtons()
        self.perform(#selector(enableButtons), with: nil, afterDelay: 0.3)
        
        self.contrainLabel.constant = CGFloat(self.buttonWidth - 80)
        UIView.animate(withDuration: 0.3) {
            self.scrollUpLabel.text = "1"
            self.hideAddButton()
            self.setQty(intQty: 1)
            
            self.layoutIfNeeded()
        }
        
        
    }
    
    func setQty(intQty:Int)
    {
        guard let cartQtyResponse = self.cartQtyResponse else {
            return
        }
        cartQtyResponse(intQty)
    }

    func setDefaultQty(qty:Int)
    {
        if qty > 0 {
            contrainLabel.constant = CGFloat(buttonWidth - 70)
            scrollUpLabel.text = String(format: "%d", qty)
            self.hideAddButton()
        }else{
            btnPls.alpha = 0
            btnMins.alpha = 0
            contrainLabel.constant = 0
            self.showAddButton()
        }
    }
    
    @IBAction func onClickPls(_ sender:Any)
    {
        self.disableButtons()
        self.perform(#selector(enableButtons), with: nil , afterDelay: 0.3)
        let nextVal =  Int(scrollUpLabel.text!)! + 1
        //scrollUpLabel.text = String(nextVal)
        
        scrollUpLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollUp
        scrollUpLabel.setText( String(nextVal) , animated: true)
        
        self.setQty(intQty: nextVal)
    }
    
    @IBAction func onClickMins(_ sender: Any)
    {
        self.disableButtons()
        self.perform(#selector(enableButtons), with: nil , afterDelay: 0.3)
        let qtyValue = Int(scrollUpLabel.text!)
        
        scrollUpLabel.transitionEffect = BBCyclingLabelTransitionEffectScrollDown
        
        if qtyValue == 1 {
            scrollUpLabel.text = "Add"
            self.contrainLabel.constant = 0
            UIView.animate(withDuration: 0.3) {
                
                self.btnAdd.isHidden = false
                self.btnMins.alpha = 0
                self.btnPls.alpha = 0
                self.setQty(intQty: 0)
                
                self.layoutIfNeeded()
            }
            
        }else{
            
            let nextVal =   qtyValue!  - 1
            //scrollUpLabel.text = String(nextVal)
            scrollUpLabel.setText( String(nextVal) , animated: true)
            
            self.setQty(intQty: nextVal)
        }
    }
    
}
