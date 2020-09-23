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
    public func setState(_ state: ASDrawerState, direction: ASDrawerDirection, animated: Bool, allowUserInterruption: Bool, completionBlock: @escaping () -> Void)  {
        switch state {
        case .open:
            self.loadBackgroundView(direction: direction) {
                self.loadVC(direction: direction) {
                    switch state {
                    case .open:
                        self.openingAnimation(direction: direction) {
                            completionBlock()
                        }
                        break
                    case .closed:
                        completionBlock()
                        break
                    }
                }
            }
            break
        case .closed:
            self.closingAnimation(direction: direction) {
                self.removeVC(direction: direction, completionBlock: {
                    self.removeBackgroundView {
                        completionBlock()
                    }
                })
            }
            break
        }
    }
    
    public func open(completionBlock: @escaping () -> Void)  {
        setState(.open, direction: .left, animated: true, allowUserInterruption: true) {
            completionBlock()
        }
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
    
    public func setDelegate(_ delegate: ASDrawerViewDelegate?, completionBlock: @escaping () -> Void)  {
        self.delegate = delegate
        completionBlock()
    }
    
    public func addEdgeGestureRecognizer(view: UIView, delegate: UIGestureRecognizerDelegate, completionBlock: @escaping () -> Void)  {
        let edgeGestureRecognizerEdgeLeft = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(userSwipedFromRectEdgeLeft(gesture:)))
        edgeGestureRecognizerEdgeLeft.edges = UIRectEdge.left
        edgeGestureRecognizerEdgeLeft.delegate = delegate
        view.addGestureRecognizer(edgeGestureRecognizerEdgeLeft)
        
        let edgeGestureRecognizerEdgeRight = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(userSwipedFromRectEdgeRight(gesture:)))
        edgeGestureRecognizerEdgeRight.edges = UIRectEdge.right
        edgeGestureRecognizerEdgeRight.delegate = delegate
        view.addGestureRecognizer(edgeGestureRecognizerEdgeRight)
    }
}
