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
    public func open(completionBlock: @escaping () -> Void)  {
        self.loadBackgroundView {
            self.loadLeftVC {
                UIView.animate(withDuration: self.withDuration, delay: TimeInterval(self.delay), options: [.curveEaseIn], animations: {
                    self.leftVCRightAnchor?.constant = self.leftWidth
                    self.backgroundView?.backgroundColor = self.backgroundShowColor
                    self.layoutIfNeeded()
                }, completion: { (value: Bool) in
                    completionBlock()
                })
            }
        }
    }
    
    public func close(completionBlock: @escaping () -> Void)  {
        UIView.animate(withDuration: withDuration, delay: delay, options: [.curveEaseIn], animations: {
            self.leftVCRightAnchor?.constant = 0
            self.backgroundView?.backgroundColor = self.backgroundHideColor
            self.layoutIfNeeded()
        }, completion: { (value: Bool) in
            self.removeLeftVC {
                self.removeBackgroundView {
                    completionBlock()
                }
            }
        })
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        guard let gestureView = gesture.view else {
            return
        }
        //gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        
        print("translation: \(gestureView.center.x)|\(translation.x) / \(gestureView.center.y)|\(translation.y)")
        
        let centerX = gestureView.center.x + translation.x
        let centerY = gestureView.center.y
        if centerX > -(leftWidth/2) && centerX < (leftWidth/2) {
            gestureView.center = CGPoint(x: centerX, y: centerY)
        }
        gesture.setTranslation(.zero, in: self)
    }
    
    @objc func touchBackgroundView(_ sender: UITapGestureRecognizer) {
        close {
        }
    }
    
    @objc func touchLeftView(_ sender: UITapGestureRecognizer) {
    }
    
    @objc func touchRightView(_ sender: UITapGestureRecognizer) {
    }
}

@available(iOS 9.0, *)
extension ASDrawerView: UIGestureRecognizerDelegate {
    
}