//
//  HalfSizeViewController.swift
//  PFA
//
//  Created by Apple on 12/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class HalfSizeViewController: UIPresentationController {
    
        override var frameOfPresentedViewInContainerView: CGRect {
            get {
                guard let theView = containerView else {
                    return CGRect.zero
                }
                
                return CGRect(x: 0, y: theView.bounds.height/2, width: theView.bounds.width, height: theView.bounds.height/2)
            }
        }
    


}
