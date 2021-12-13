//
//  CartViewCell.swift
//  monetate
//
//  Created by Sushil Tiwari on 08/11/21.
//

import UIKit

class CartViewCell: UITableViewCell {
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productQuantity: UILabel!
    @IBOutlet weak var productAmount: UILabel!
    @IBOutlet weak var productTotal: UILabel!
    @IBOutlet weak var productimg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
