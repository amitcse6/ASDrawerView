//
//  ASDrawerViewController+Set.swift
//  superapp
//
//  Created by AMIT on 9/16/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension ASDrawerView {
    public func setMiddle(completionBlock: @escaping () -> Void, animated: Bool) {
        completionBlock()
    }
    
    public func setState(_ state: ASDrawerState, direction: ASDrawerDirection, animated: Bool, allowUserInterruption: Bool, completionBlock: @escaping () -> Void)  {
        completionBlock()
    }
    
    public func setDelegate(_ delegate: ASDrawerViewDelegate?, completionBlock: @escaping () -> Void)  {
        self.delegate = delegate
        completionBlock()
    }
    
    public func addEdgeGestureRecognizer(view: UIView, delegate: UIGestureRecognizerDelegate, completionBlock: @escaping () -> Void)  {
        let edgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(userSwipedFromEdge(gesture:)))
        edgeGestureRecognizer.edges = UIRectEdge.left
        edgeGestureRecognizer.delegate = delegate
        view.addGestureRecognizer(edgeGestureRecognizer)
    }
    
    public func setViewController(vc: UIViewController?, _ state: ASDrawerState, direction: ASDrawerDirection, animated: Bool, allowUserInterruption: Bool, completionBlock: @escaping () -> Void) {
        switch direction {
        case .center:
            centerVC = vc
            loadCenterVC {
                completionBlock()
            }
            break
        case .left:
            leftVC = vc
            loadLeftVC {
                completionBlock()
            }
            break
        case .right:
            rightVC = vc
            loadRightVC {
                completionBlock()
            }
            break
        }
    }
}
