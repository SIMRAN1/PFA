//
//  ViewController.swift
//  PFA
//
//  Created by Apple on 11/04/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func songButtonPressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SongViewController") as! SongViewController
        vc.transitioningDelegate = vc
        vc.modalPresentationStyle = .custom
       self.present(vc, animated: true, completion: nil)
       /*let navigationController = self.navigationController
        
        
       // vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: vc, action: #selector(vc.closeView())
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: vc, action: nil)
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromTop
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(vc, animated: false)*/

    }
    
    
    
}



