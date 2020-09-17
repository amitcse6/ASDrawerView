//
//  ASDrawerView.swift
//  superapp
//
//  Created by AMIT on 9/16/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

public protocol ASDrawerViewDelegate {
}

public class ASDrawerView: UIView {
    public var delegate: ASDrawerViewDelegate? 
    
    public var storeBack: UIView?
    public var leftVC: UIViewController?
    public var centerVC: UIViewController?
    public var rightVC: UIViewController?
    
    public var backgroundView: UIView?
    
    public var leftWidth: CGFloat = 300
    public var rightWidth: CGFloat = 300
    public var withDuration: TimeInterval = 0.2
    public var delay: TimeInterval = 0
    public var backgroundHideColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.0)
    public var backgroundShowColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    
    public var leftVCRightAnchor: NSLayoutConstraint?
    public var rightVCLeftAnchor: NSLayoutConstraint?
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        if #available(iOS 9.0, *) {
            load()
        } else {
            // Fallback on earlier versions
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if #available(iOS 9.0, *) {
            load()
        } else {
            // Fallback on earlier versions
        }
    }
}

@available(iOS 9.0, *)
extension ASDrawerView {
    func load() {
        initialize()
        loadConstraint()
    }
}
