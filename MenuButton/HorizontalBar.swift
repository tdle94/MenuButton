//
//  HorizontalBar.swift
//  MenuButtonDemo
//
//  Created by Tuyen Le on 09.03.19.
//  Copyright © 2019 Tuyen Le. All rights reserved.
//

import UIKit

class HorizontalBar: CAShapeLayer {

    // MARK: Properties

    /// Horizontal bar shape's path
    fileprivate lazy var shapePath: UIBezierPath = {
        return UIBezierPath(roundedRect: bounds, cornerRadius: 5)
    }()

    /// Rotate horizontal bar
    ///
    /// - Parameters:
    ///     - toPoint: Position by point.
    ///     - byRadian: Rotate by radian.
    open func rotate(toPoint: CGPoint, byRadian: CGFloat) {
        let rotate: CGAffineTransform = CGAffineTransform(translationX: toPoint.x, y: toPoint.y).rotated(by: byRadian)
        self.transform = CATransform3DMakeAffineTransform(rotate)
    }

    /// Shrink bar until dissapear
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

    /// Unshrink until re-appear to original size
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

    /// Default setup
    ///
    /// - Parameters:
    ///     - withFrame: Setup with new frame
    fileprivate func defaultSetUp(withFrame: CGRect?) {
        guard let newFrame = withFrame else {
            frame = .zero
            return
        }

        frame = newFrame

        lineWidth = 1
        fillColor = nil
        strokeColor = UIColor.black.cgColor
        backgroundColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.0).cgColor
        path = self.shapePath.cgPath
    }

    // MARK: - init
    init(frame: CGRect) {
        super.init()
        self.defaultSetUp(withFrame: frame)
    }

    // MARK: - override funcs
    override init(layer: Any) {
        super.init(layer: layer)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
