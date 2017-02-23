//
//  ReuseIdentifierProtocol.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/23/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import UIKit

public protocol ReuseIdentifierProtocol {
    static var deafaultReuseIdentifier: String { get }
}

public extension ReuseIdentifierProtocol where Self: UIView {
    
    static var deafaultReuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}
