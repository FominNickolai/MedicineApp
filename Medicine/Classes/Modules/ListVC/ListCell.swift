//
//  ListCell.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/23/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import UIKit

class ListCell: UICollectionViewCell, ReuseIdentifierProtocol {
    @IBOutlet weak var expireDateLabel: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var medicineImage: UIImageView!
    @IBOutlet weak var mediciniTypeImage: UIImageView!
}
