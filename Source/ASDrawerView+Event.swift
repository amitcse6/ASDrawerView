//
//  ASDrawerViewController+Event.swift
//  superapp
//
//  Created by AMIT on 9/16/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension ASDrawerView {
    public func getBackgroundShowColor(direction: ASDrawerDirection) -> UIColor {
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    }
    
    public func getBackgroundHideColor(direction: ASDrawerDirection) -> UIColor {
        return UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    }
    
    public func changeBackgroundColor(direction: ASDrawerDirection, totalDis: CGFloat, currentDis: CGFloat) {
        backgroundView?.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
    }
    
    public func openingAnimation(direction: ASDrawerDirection, completionBlock: @escaping () -> Void)  {
        switch direction {
        case .center:
            completionBlock()
            break
        case .left:
            UIView.animate(withDuration: self.withDuration, delay: TimeInterval(self.delay), options: [.curveEaseIn], animations: {
                self.leftVCRightAnchor?.constant = self.leftWidth
                self.backgroundView?.backgroundColor = self.getBackgroundShowColor(direction: direction)
                self.layoutIfNeeded()
            }, completion: { (value: Bool) in
                completionBlock()
            })
            break
        case .right:
            UIView.animate(withDuration: self.withDuration, delay: TimeInterval(self.delay), options: [.curveEaseIn], animations: {
                self.rightVCLeftAnchor?.constant = -self.rightWidth
                self.backgroundView?.backgroundColor = self.getBackgroundShowColor(direction: direction)
                self.layoutIfNeeded()
            }, completion: { (value: Bool) in
                completionBlock()
            })
            break
        }
    }
    
    public func closingAnimation(direction: ASDrawerDirection, completionBlock: @escaping () -> Void)  {
        switch direction {
        case .center:
            completionBlock()
            break
        case .left:
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseIn], animations: {
                self.leftVCRightAnchor?.constant = 0
                self.backgroundView?.backgroundColor = self.getBackgroundHideColor(direction: direction)
                self.layoutIfNeeded()
            }, completion: { (value: Bool) in
                completionBlock()
            })
            break
        case .right:
            UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseIn], animations: {
                self.rightVCLeftAnchor?.constant = 0
                self.backgroundView?.backgroundColor = self.getBackgroundHideColor(direction: direction)
                self.layoutIfNeeded()
            }, completion: { (value: Bool) in
                completionBlock()
            })
            break
        }
    }
}
