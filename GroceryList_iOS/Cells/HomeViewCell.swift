//
//  HomeViewCell.swift
//  GroceryList_iOS
//
//  Created by Amandeep Singh on 2022-04-13.
//

import UIKit



class HomeViewCell: UITableViewCell {

    
    @IBOutlet weak var View1: UIView!
    
    @IBOutlet weak var editbuttom: UIButton!
    @IBOutlet weak var listname_home: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
