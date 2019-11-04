//
//  MenuButton.swift
//  MenuButtonDemo
//
//  Created by Tuyen Le on 09.03.19.
//  Copyright © 2019 Tuyen Le. All rights reserved.
//

import UIKit

@IBDesignable
class MenuButton: UIButton {
    // MARK: -  Properties
    
    /// Gradient colors
    @IBInspectable
    open var gradientColors: [CGColor] = [
        UIColor(red:0.44, green:0.47, blue:0.94, alpha:1.0).cgColor,
        UIColor(red:0.58, green:0.42, blue:0.98, alpha:1.0).cgColor,
        ] {
        
        didSet {
            gradientLayer.colors = self.gradientColors
        }
    }

    /// Gradient layer
    fileprivate var gradientLayer: CAGradientLayer = CAGradientLayer()

    /// Check whether button has animated
    open private(set) var hasAnimated: Bool = false
    
    /// On tap action closure. Assign this to notify yourself whenever button is tap
    open var ontap: ((Bool) -> Void)?

    /// Horizontal bars
    private lazy var horizontalBars: [HorizontalBar] = {
        let topHorizontalBar: HorizontalBar = HorizontalBar(frame: CGRect(x: bounds.midX/2,
                                                                          y: bounds.midY - (bounds.height/10 + 3),
                                                                          width: bounds.width/2,
                                                                          height: 3))
        let midHorizontalBar: HorizontalBar = HorizontalBar(frame: CGRect(x: bounds.midX/2,
                                                                          y: bounds.midY,
                                                                          width: bounds.width/2,
                                                                          height: 3))
        let botHorizontalBar: HorizontalBar = HorizontalBar(frame: CGRect(x: bounds.midX/2,
                                                                          y: bounds.midY + bounds.height/10 + 3,
                                                                          width: bounds.width/2,
                                                                          height: 3))
        return [topHorizontalBar, midHorizontalBar, botHorizontalBar]
    }()

    /// Animate to an array of gradient colors
    ///
    /// - Parameters:
    ///     - toGradient: The *x* component of the vector.
    open func animate(toGradient: [CGColor]) {
        let animateGradient: CABasicAnimation = CABasicAnimation(keyPath: "colors")
        animateGradient.fromValue = gradientColors
        animateGradient.toValue = toGradient
        animateGradient.duration = 2
        animateGradient.timingFunction = CAMediaTimingFunction(controlPoints: 0.2, 0.88, 0.09, 0.99)
        animateGradient.fillMode = kCAFillModeForwards
        animateGradient.isRemovedOnCompletion = false
        gradientLayer.add(animateGradient, forKey: animateGradient.keyPath)
    }

    /// Response to user on tap action
    @objc fileprivate func onTapButton() {
        if hasAnimated {
            /// Unanimate
            animate(toGradient: self.gradientColors)
            horizontalBars[0].rotate(toPoint: CGPoint(x: 0, y: 0), byRadian: 0)
            horizontalBars[1].unShrink()
            horizontalBars[2].rotate(toPoint: CGPoint(x: 0, y: 0), byRadian: 0)
        } else {
            /// Animate
            animate(toGradient: [
                UIColor(red:0.34, green:0.59, blue:0.98, alpha:1.0).cgColor,
                UIColor(red:0.71, green:0.80, blue:0.95, alpha:1.0).cgColor,
                UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0).cgColor
            ])
            horizontalBars[0].rotate(toPoint: CGPoint(x: 0, y: bounds.height/10 + 3), byRadian: .pi/4)
            horizontalBars[1].shrink()
            horizontalBars[2].rotate(toPoint: CGPoint(x: 0, y: -bounds.height/10 - 3), byRadian: -.pi/4)
        }
        
        ontap?(hasAnimated)
        hasAnimated = !hasAnimated
    }

    // MARK: - Override funcs
    override func draw(_ rect: CGRect) {
        
        /// Set circle and path shape
        let circleShape: CAShapeLayer = CAShapeLayer()
        let circlePath: UIBezierPath = UIBezierPath(arcCenter: CGPoint(x: rect.midX, y: rect.midY),
                                                    radius: rect.width/2,
                                                    startAngle: 0,
                                                    endAngle: 2 * .pi,
                                                    clockwise: false)
        circleShape.frame = rect
        circleShape.path = circlePath.cgPath

        UIColor.white.setStroke()
        circlePath.stroke()

        /// Set gradient color
        gradientLayer.frame = bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 1)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        gradientLayer.colors = self.gradientColors
        gradientLayer.mask = circleShape
        layer.insertSublayer(gradientLayer, at: 0)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addTarget(self, action: #selector(self.onTapButton), for: UIControlEvents.touchUpInside)

        /// Add horizontal bar
        for horizontalBar in self.horizontalBars {
            layer.addSublayer(horizontalBar)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
