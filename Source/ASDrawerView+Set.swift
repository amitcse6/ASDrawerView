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
    public func setMiddle(completionBlock: () -> Void, animated: Bool) {
        completionBlock()
    }
    
    public func setState(_ state: ASDrawerState, direction: ASDrawerDirection, animated: Bool, allowUserInterruption: Bool, completionBlock: () -> Void)  {
        completionBlock()
    }
    
    public func setViewController(vc: UIViewController?, _ state: ASDrawerState, direction: ASDrawerDirection, animated: Bool, allowUserInterruption: Bool, completionBlock: () -> Void) {
        switch direction {
        case .left:
            leftVC = vc
            loadLeftVC {
            }
            break
        case .center:
            centerVC = vc
            loadCenterVC {
            }
            break
        case .right:
            rightVC = vc
            loadRightVC {
            }
            break
        }
    }
}
