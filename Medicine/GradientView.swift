//
//  GradientView.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/23/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import UIKit

@IBDesignable class GradientView: UIView {
    @IBInspectable var leftColor: UIColor = UIColor.white
    @IBInspectable var rightColor: UIColor = UIColor.black
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [leftColor.cgColor, rightColor.cgColor]
        (layer as! CAGradientLayer).startPoint = CGPoint.zero
        (layer as! CAGradientLayer).endPoint = CGPoint(x: 1, y: 1)
    }
}
