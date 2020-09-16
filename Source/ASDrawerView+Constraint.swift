//
//  ASDrawerViewController+Censtraint.swift
//  superapp
//
//  Created by AMIT on 9/16/20.
//  Copyright © 2020 Amit. All rights reserved.
//

import Foundation
import UIKit

@available(iOS 9.0, *)
extension ASDrawerView {
    func loadConstraint() {
        storeBack = UIView()
        addSubview(storeBack.unsafelyUnwrapped)
        storeBack?.translatesAutoresizingMaskIntoConstraints = false
        storeBack?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        storeBack?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        storeBack?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        storeBack?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

@available(iOS 9.0, *)
extension ASDrawerView {
    func removeBackgroundView(completionBlock: @escaping () -> Void) {
        backgroundView?.removeFromSuperview()
        completionBlock()
    }
    func removeCenterVC(completionBlock: @escaping () -> Void) {
        centerVC?.view.removeFromSuperview()
        completionBlock()
    }
    func removeLeftVC(completionBlock: @escaping () -> Void) {
        leftVC?.view.removeFromSuperview()
        completionBlock()
    }
    func removeRightVC(completionBlock: @escaping () -> Void) {
        rightVC?.view.removeFromSuperview()
        completionBlock()
    }
}

@available(iOS 9.0, *)
extension ASDrawerView {
    func loadBackgroundView(completionBlock: @escaping () -> Void) {
        storeBack?.addSubview(backgroundView.unsafelyUnwrapped)
        backgroundView?.isUserInteractionEnabled = true
        backgroundView?.translatesAutoresizingMaskIntoConstraints = false
        backgroundView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchBackgroundView(_:)))
        backgroundView?.addGestureRecognizer(tap)
        completionBlock()
    }
    
    func loadCenterVC(completionBlock: @escaping () -> Void) {
        storeBack?.addSubview(centerVC.unsafelyUnwrapped.view)
        centerVC?.view.translatesAutoresizingMaskIntoConstraints = false
        centerVC?.view.topAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.topAnchor).isActive = true
        centerVC?.view.leftAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.leftAnchor).isActive = true
        centerVC?.view.rightAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.rightAnchor).isActive = true
        centerVC?.view.bottomAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.bottomAnchor).isActive = true
        completionBlock()
    }
    
    func loadLeftVC(completionBlock: @escaping () -> Void) {
        storeBack?.addSubview(leftVC.unsafelyUnwrapped.view)
        leftVC?.view.isUserInteractionEnabled = true
        leftVC?.view.translatesAutoresizingMaskIntoConstraints = false
        leftVC?.view.topAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.topAnchor).isActive = true
        leftVCRightAnchor = leftVC?.view.rightAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.leftAnchor)
        leftVCRightAnchor?.isActive = true
        leftVC?.view.bottomAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.bottomAnchor).isActive = true
        leftVC?.view.widthAnchor.constraint(equalToConstant: leftWidth).isActive = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchLeftView(_:)))
        leftVC?.view.addGestureRecognizer(tap)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        gesture.delegate = self
        leftVC?.view.addGestureRecognizer(gesture)
        completionBlock()
    }
    
    func loadRightVC(completionBlock: @escaping () -> Void) {
        storeBack?.addSubview(rightVC.unsafelyUnwrapped.view)
        rightVC?.view.isUserInteractionEnabled = true
        rightVC?.view.translatesAutoresizingMaskIntoConstraints = false
        rightVC?.view.topAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.topAnchor).isActive = true
        rightVCLeftAnchor = rightVC?.view.leftAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.rightAnchor)
        rightVCLeftAnchor?.isActive = true
        rightVC?.view.bottomAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.bottomAnchor).isActive = true
        rightVC?.view.widthAnchor.constraint(equalToConstant: rightWidth).isActive = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchRightView(_:)))
        rightVC?.view.addGestureRecognizer(tap)
        completionBlock()
    }
}
