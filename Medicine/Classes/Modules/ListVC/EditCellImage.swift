//
//  EditCellImage.swift
//  Medicine
//
//  Created by Fomin Nickolai on 2/27/17.
//  Copyright © 2017 Fomin Nickolai. All rights reserved.
//

import UIKit

class EditCellImage: UITableViewCell, ReuseIdentifierProtocol {
    
    @IBOutlet weak var medicineImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
