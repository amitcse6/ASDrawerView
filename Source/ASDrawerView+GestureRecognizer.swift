//
//  ASDrawerView+GestureRecognizer.swift
//  ASDrawerView
//
//  Created by AMIT on 9/23/20.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension ASDrawerView {
    @objc func handlePanLeftDrawer(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        guard let gestureView = gesture.view else {
            return
        }
        //gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        //print("translation: \(gestureView.center.x)|\(translation.x) / \(gestureView.center.y)|\(translation.y)")
        let centerX = gestureView.center.x + translation.x
        let centerY = gestureView.center.y
        if gesture.state == .ended || gesture.state == .cancelled || gesture.state == .failed {
            if gestureView.center.x <= 0 {
                setState(.closed, direction: .left, animated: true, allowUserInterruption: true) {
                }
            }else {
                setState(.open, direction: .left, animated: true, allowUserInterruption: true) {
                }
            }
        }else {
            if centerX > -(leftWidth/2) && centerX < (leftWidth/2) {
                gestureView.center = CGPoint(x: centerX, y: centerY)
                changeBackgroundColor(direction: .left, totalDis:  leftWidth, currentDis: abs(-(leftWidth/2)+centerX))
            }
        }
        gesture.setTranslation(.zero, in: self)
    }
    
    @objc func handlePanRightDrawer(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        guard let gestureView = gesture.view else {
            return
        }
        //gestureView.center = CGPoint(x: gestureView.center.x + translation.x, y: gestureView.center.y + translation.y)
        //print("translation: \(gestureView.center.x)|\(translation.x) / \(gestureView.center.y)|\(translation.y)")
        let centerX = gestureView.center.x + translation.x
        let centerY = gestureView.center.y
        
        if gesture.state == .ended || gesture.state == .cancelled || gesture.state == .failed {
            if gestureView.center.x >= frame.width {
                setState(.closed, direction: .right, animated: true, allowUserInterruption: true) {
                }
            }else {
                setState(.open, direction: .right, animated: true, allowUserInterruption: true) {
                }
            }
        }else {
            if centerX > frame.width-(rightWidth/2) && centerX < frame.width+(rightWidth/2)  {
                gestureView.center = CGPoint(x: centerX, y: centerY)
            }
        }
        gesture.setTranslation(.zero, in: self)
    }
    
    @objc func touchBackgroundForLeftDrawer(_ gesture: UITapGestureRecognizer) {
        setState(.closed, direction: .left, animated: true, allowUserInterruption: true) {
        }
    }
    
    @objc func touchBackgroundForRightDrawer(_ gesture: UITapGestureRecognizer) {
        setState(.closed, direction: .right, animated: true, allowUserInterruption: true) {
        }
    }
    
    @objc func touchLeftView(_ gesture: UITapGestureRecognizer) {
    }
    
    @objc func touchRightView(_ gesture: UITapGestureRecognizer) {
    }
    
    @objc func userSwipedFromRectEdgeLeft(gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .began, gesture.edges == .left {
            setState(.open, direction: .left, animated: true, allowUserInterruption: true) {
            }
        }
    }
    
    @objc func userSwipedFromRectEdgeRight(gesture: UIScreenEdgePanGestureRecognizer) {
        if gesture.state == .began, gesture.edges == .right {
            setState(.open, direction: .right, animated: true, allowUserInterruption: true) {
            }
        }
    }
}

@available(iOS 9.0, *)
extension ASDrawerView: UIGestureRecognizerDelegate {
    
}
