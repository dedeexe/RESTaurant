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
    
    @IBOutlet private weak var containerView : UIView!
    @IBOutlet private weak var shadowView : UIView!
    
    var menuItem: MenuItem? = nil {
        didSet {
            self.update()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.reset()
        self.setup()
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
        self.priceLabel.text = formatedNumber(menuItem?.price ?? 0.0)
    }
    
    func setup() {
        containerView.layer.cornerRadius = 8.0
        containerView.layer.masksToBounds = true
        shadowView.layer.shadowRadius = 8.0
        shadowView.layer.shadowOpacity = 50
        shadowView.layer.shadowColor = UIColor.black.cgColor
    }
    
    func formatedNumber(_ number:Double) -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: number))
    }

}
