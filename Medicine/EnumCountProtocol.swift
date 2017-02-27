//
//  EnumCountProtocol.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/27/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import Foundation

protocol CaseCountable: RawRepresentable {}

extension CaseCountable where RawValue == Int {
    static var count: RawValue {
        var i: RawValue = 0
        while let _ = Self(rawValue: i) { i += 1 }
        return i
    }
}
