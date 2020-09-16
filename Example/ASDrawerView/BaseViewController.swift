//
//  BaseViewController.swift
//  ASDrawerView_Example
//
//  Created by Amit on 16/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

protocol BaseViewControllerDelegate {
    func menuAction(_ sender: Any)
}

class BaseViewController: UIViewController {
    var delegate: BaseViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
