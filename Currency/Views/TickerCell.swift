//
//  TickerCell.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit
import SnapKit

class TickerCell: UITableViewCell {
   
    var title = UILabel()
    var subtitle = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initializeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var ticker : TickerModel? {
        didSet {
            
            guard let ticker = ticker else {
                return
            }
            title.text = ticker.name
            subtitle.text = ticker.value
            
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        makeConstraints()
    }
    
    private func initializeUI(){
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
    }
    
    private func makeConstraints(){
        title.snp.makeConstraints{ (make) in
            make.left.equalTo(contentView).offset(16)
            make.centerY.equalTo(contentView).offset(0)
        }
        subtitle.snp.makeConstraints{ (make) in
            make.right.equalTo(contentView).offset(-16)
            make.centerY.equalTo(contentView).offset(0)
        }
    }
    
}
