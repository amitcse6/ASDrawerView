//
//  ASDrawerViewController+Get.swift
//  superapp
//
//  Created by AMIT on 9/16/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension ASDrawerView {
    public func getLeftVC() -> UIViewController? {
        return self.leftVC
    }
    
    public func getCenterVC() -> UIViewController? {
        return self.centerVC
    }
    
    public func getRightVC() -> UIViewController? {
        return self.rightVC
    }
}
