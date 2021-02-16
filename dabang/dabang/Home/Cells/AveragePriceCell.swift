//
//  AveragePriceCell.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import UIKit
import SnapKit
import Then

class AveragePriceCell: UITableViewCell {
    static let identifier = "averagePriceCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UISetup
extension AveragePriceCell {
    private func setupUI(){
        contentView.backgroundColor = .blue
    }
}
