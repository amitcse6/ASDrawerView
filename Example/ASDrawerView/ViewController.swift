//
//  ViewController.swift
//  ASDrawerView
//
//  Created by amitpstu1@gmail.com on 09/16/2020.
//  Copyright (c) 2020 amitpstu1@gmail.com. All rights reserved.
//

import UIKit
import ASDrawerView

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    @IBOutlet weak var drawerView: ASDrawerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let centerVC = storyboard.instantiateViewController(withIdentifier: "CenterViewController") as? CenterViewController
        let leftVC = storyboard.instantiateViewController(withIdentifier: "LeftViewController") as? LeftViewController
        let rightVC = storyboard.instantiateViewController(withIdentifier: "RightViewController") as? RightViewController
        
        centerVC?.delegate = self
        leftVC?.delegate = self
        rightVC?.delegate = self
        drawerView?.delegate = self
        
        drawerView.addEdgeGestureRecognizer(view: self.view, delegate: self, completionBlock: {})
        drawerView.setViewController(vc: centerVC, .closed, direction: .center, animated: false, allowUserInterruption: true) {}
        drawerView.setViewController(vc: leftVC, .closed, direction: .left, animated: false, allowUserInterruption: true) {}
        drawerView.setViewController(vc: rightVC, .closed, direction: .right, animated: false, allowUserInterruption: true) {}
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ASDrawerViewDelegate {
}

extension ViewController: BaseViewControllerDelegate {
    func moreAction(_ sender: Any) {
        drawerView.setState(.open, direction: .right, animated: true, allowUserInterruption: true) {
        }
    }
    
    func menuAction(_ sender: Any) {
        drawerView.open {
        }
    }
}

