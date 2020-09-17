//
//  ASDrawerView+UIView.swift
//  ASDrawerView
//
//  Created by Amit on 17/9/20.
//

import UIKit
import UIKit

// MARK: - Swift 4
extension UIView {
    func asd_deactivateImmediateConstraints(){
        NSLayoutConstraint.deactivate(self.asd_immediateConstraints)
    }
    func asd_deactivateAllConstraints() {
        NSLayoutConstraint.deactivate(self.asd_allConstraints)
        translatesAutoresizingMaskIntoConstraints = false
    }
    var asd_immediateConstraints:[NSLayoutConstraint]{
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            } ?? []
        return self.constraints + constraints
    }
    var asd_allConstraints:[NSLayoutConstraint] {
        var view: UIView? = self
        var constraints:[NSLayoutConstraint] = []
        while let currentView = view {
            constraints += currentView.constraints.filter {
                return $0.firstItem as? UIView === self || $0.secondItem as? UIView === self
            }
            view = view?.superview
        }
        return constraints
    }
}
