//
//  UIView+Utils.swift
//  AppleSignIn
//
//  Created by Rizwan Ahmed A on 10/08/19.
//  Copyright © 2019 Rizwan Ahmed A. All rights reserved.
//

import UIKit


extension UIView {
    @objc func pinToParent(_ parentView : UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
        self.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
    }
    
    @discardableResult
    public func addBottomConstraint(toView view: UIView?, attribute: NSLayoutConstraint.Attribute = .bottom, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {

        let constraint = createConstraint(attribute: .bottom, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)

        return constraint
    }
    
    @discardableResult
    public func addTopConstraint(toView view: UIView?, attribute: NSLayoutConstraint.Attribute = .top, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {

        let constraint = createConstraint(attribute: .top, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)

        return constraint
    }

    
     @discardableResult
    public func addLeftConstraint(toView view: UIView?, attribute: NSLayoutConstraint.Attribute = .left, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {

         let constraint = createConstraint(attribute: .left, toView: view, attribute: attribute, relation: relation, constant: constant)
         addConstraintToSuperview(constraint)

         return constraint
     }

    
    @discardableResult
    public func addLeadingConstraint(toView view: UIView?, attribute: NSLayoutConstraint.Attribute = .leading, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {

        let constraint = createConstraint(attribute: .leading, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)

        return constraint
    }
    
    @discardableResult
    public func addTrailingConstraint(toView view: UIView?, attribute: NSLayoutConstraint.Attribute = .trailing, relation: NSLayoutConstraint.Relation = .equal, constant: CGFloat = 0.0) -> NSLayoutConstraint {

        let constraint = createConstraint(attribute: .trailing, toView: view, attribute: attribute, relation: relation, constant: constant)
        addConstraintToSuperview(constraint)

        return constraint
    }
    
    
    // MARK: - Private
    /// Adds an NSLayoutConstraint to the superview
    fileprivate func addConstraintToSuperview(_ constraint: NSLayoutConstraint) {

        translatesAutoresizingMaskIntoConstraints = false
        superview?.addConstraint(constraint)
    }

    /// Creates an NSLayoutConstraint using its factory method given both views, attributes a relation and offset
    fileprivate func createConstraint(attribute attr1: NSLayoutConstraint.Attribute, toView: UIView?, attribute attr2: NSLayoutConstraint.Attribute, relation: NSLayoutConstraint.Relation, constant: CGFloat) -> NSLayoutConstraint {

        let constraint = NSLayoutConstraint(
            item: self,
            attribute: attr1,
            relatedBy: relation,
            toItem: toView,
            attribute: attr2,
            multiplier: 1.0,
            constant: constant)

        return constraint
    }
}
