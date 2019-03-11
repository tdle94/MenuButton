//
//  HorizontalBar.swift
//  MenuButtonDemo
//
//  Created by Tuyen Le on 09.03.19.
//  Copyright © 2019 Tuyen Le. All rights reserved.
//

import UIKit

class HorizontalBar: CAShapeLayer {

    // MARK: horizontal bar properties

    /// horizontal bar shape's path
    fileprivate lazy var shapePath: UIBezierPath = {
        return UIBezierPath(roundedRect: bounds, cornerRadius: 5)
    }()

    /// rotate horizontal bar
    open func rotate(translation: CGPoint, radian: CGFloat) {
        let rotate: CGAffineTransform = CGAffineTransform(translationX: translation.x, y: translation.y).rotated(by: radian)
        self.transform = CATransform3DMakeAffineTransform(rotate)
    }

    /// shrink bar until dissapear
    open func shrink() {
        let shrinkAnim = CABasicAnimation(keyPath: "transform.scale.x")
        shrinkAnim.fromValue = 1
        shrinkAnim.toValue = 0
        shrinkAnim.duration = 1
        shrinkAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.isRemovedOnCompletion = false
        add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }

    /// unshrink until re-appear to original size
    open func unShrink() {
        let shrinkAnim = CABasicAnimation(keyPath: "transform.scale.x")
        shrinkAnim.fromValue = 0
        shrinkAnim.toValue = 1
        shrinkAnim.duration = 1
        shrinkAnim.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
        shrinkAnim.fillMode = kCAFillModeForwards
        shrinkAnim.isRemovedOnCompletion = false
        add(shrinkAnim, forKey: shrinkAnim.keyPath)
    }

    /// default set up
    fileprivate func defaultSetUp(frame: CGRect?) {
        if frame != nil {
            self.frame = frame!
        }
        lineWidth = 1
        fillColor = nil
        strokeColor = UIColor.black.cgColor
        backgroundColor = UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
        path = self.shapePath.cgPath
    }

    // MARK: - init
    init(frame: CGRect) {
        super.init()
        self.defaultSetUp(frame: frame)
    }

    // MARK: - override funcs
    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
