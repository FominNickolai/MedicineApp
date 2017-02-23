//
//  Model.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/23/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import Foundation

class MedicineDummy {
    
    enum MedicineType {
        case tablet
        case liquid
    }
    
    let title: String
    let expireDate: String
    let typeMedicine: MedicineType
    let amount: String
    
    init(title: String, expireDate: String, typeMedicine: MedicineType, amount: String) {
        
        self.title = title
        self.expireDate = expireDate
        self.typeMedicine = typeMedicine
        self.amount = amount
        
    }
    
}
