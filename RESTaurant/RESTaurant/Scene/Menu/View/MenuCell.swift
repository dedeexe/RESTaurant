//
//  MenuCell.swift
//  RESTaurant
//
//  Created by dede.exe on 07/07/19.
//  Copyright © 2019 dede.exe. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var detailLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var itemImageView: UIImageView!
    
    var menuItem: MenuItem? = nil {
        didSet {
            self.update()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.reset()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        reset()
    }

    // --------------------------------------------------
    // MARK: - Helpers
    // --------------------------------------------------
    
    private func reset() {
        self.nameLabel.text = nil
        self.detailLabel.text = nil
        self.priceLabel.text = nil
    }
    
    private func update() {
        self.nameLabel.text = menuItem?.name
        self.detailLabel.text = menuItem?.description
        self.priceLabel.text = String(menuItem?.price ?? 0.0)
    }

}
