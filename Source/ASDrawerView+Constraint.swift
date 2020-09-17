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
        storeBack?.asd_deactivateAllConstraints()
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
        removeBackgroundView {}
        storeBack?.addSubview(backgroundView.unsafelyUnwrapped)
        backgroundView?.asd_deactivateAllConstraints()
        backgroundView?.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundView?.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        backgroundView?.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        backgroundView?.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchBackgroundView(_:)))
        tap.delegate = self
        backgroundView?.addGestureRecognizer(tap)
        completionBlock()
    }
    
    func loadCenterVC(completionBlock: @escaping () -> Void) {
        removeCenterVC {}
        storeBack?.addSubview(centerVC.unsafelyUnwrapped.view)
        centerVC?.view.translatesAutoresizingMaskIntoConstraints = false
        centerVC?.view.topAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.topAnchor).isActive = true
        centerVC?.view.leftAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.leftAnchor).isActive = true
        centerVC?.view.rightAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.rightAnchor).isActive = true
        centerVC?.view.bottomAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.bottomAnchor).isActive = true
        
        let edgeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(userSwipedFromEdge(gesture:)))
        edgeGestureRecognizer.edges = UIRectEdge.left
        edgeGestureRecognizer.delegate = self
        (delegate as? UIViewController)?.view.addGestureRecognizer(edgeGestureRecognizer)
        completionBlock()
    }
    
    func loadLeftVC(completionBlock: @escaping () -> Void) {
        removeLeftVC {}
        storeBack?.addSubview(leftVC.unsafelyUnwrapped.view)
        leftVC?.view.asd_deactivateAllConstraints()
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
        removeRightVC {}
        storeBack?.addSubview(rightVC.unsafelyUnwrapped.view)
        rightVC?.view.asd_deactivateAllConstraints()
        rightVC?.view.topAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.topAnchor).isActive = true
        rightVCLeftAnchor = rightVC?.view.leftAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.rightAnchor)
        rightVCLeftAnchor?.isActive = true
        rightVC?.view.bottomAnchor.constraint(equalTo: storeBack.unsafelyUnwrapped.bottomAnchor).isActive = true
        rightVC?.view.widthAnchor.constraint(equalToConstant: rightWidth).isActive = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(touchRightView(_:)))
        tap.delegate = self
        rightVC?.view.addGestureRecognizer(tap)
        completionBlock()
    }
}
