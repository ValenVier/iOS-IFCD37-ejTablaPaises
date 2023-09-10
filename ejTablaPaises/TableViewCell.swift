//
//  TableViewCell.swift
//  ejTablaPaises
//
//  Created by Javier Rodríguez Valentín on 27/09/2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.textColor = .blue
        label.backgroundColor = .yellow
        label.font = .systemFont(ofSize: 20)
        self.backgroundColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
