//
//  RoundedButton.swift
//  Notify
//
//  Created by Nishanth P on 2/21/17.
//  Copyright © 2017 Nishapp. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

   
    override func draw(_ rect: CGRect) {
       
        layer.cornerRadius = 20.0
        layer.masksToBounds = true

        
    }
   

}
