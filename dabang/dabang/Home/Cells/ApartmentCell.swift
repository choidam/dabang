//
//  ApartmentCell.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import UIKit
import SnapKit
import Then

class ApartmentCell: UITableViewCell {
    static let identifier = "apartmentCell"
    var divideView = UIView().then {
        $0.backgroundColor = .verylightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var roomImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var checkImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var priceLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var roomTypeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var descLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UISetup
extension ApartmentCell {
    private func setupUI(){
        addSubview(divideView)
        divideView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(113)
            $0.height.equalTo(1)
        }
        addSubview(roomImageView)
        roomImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(13)
            $0.width.equalTo(126)
            $0.height.equalTo(84)
        }
        addSubview(checkImageView)
        checkImageView.snp.makeConstraints{
            $0.leading.equalTo(17)
            $0.top.equalTo(18)
            $0.width.height.equalTo(18)
        }
        addSubview(priceLabel)
        priceLabel.setPriceLabel()
        priceLabel.snp.makeConstraints{
            $0.leading.equalTo(roomImageView.snp.trailing).offset(34)
            $0.top.equalTo(18)
        }
        addSubview(roomTypeLabel)
        roomTypeLabel.setRoomTypeLabel()
        roomTypeLabel.snp.makeConstraints{
            $0.leading.equalTo(roomImageView.snp.trailing).offset(34)
            $0.top.equalTo(priceLabel.snp.bottom).offset(4)
        }
        addSubview(descLabel)
        descLabel.setDescriptionLable()
        descLabel.snp.makeConstraints{
            $0.leading.equalTo(roomImageView.snp.trailing).offset(34)
            $0.trailing.equalTo(-24)
            $0.top.equalTo(roomTypeLabel.snp.bottom)
        }
    }
}
