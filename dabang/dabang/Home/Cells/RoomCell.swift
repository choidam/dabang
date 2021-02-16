//
//  RoomCell.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import UIKit
import SnapKit
import Then

class RoomCell: UITableViewCell {
    static let identifier = "roomCell"
    var divideView = UIView().then {
        $0.backgroundColor = .verylightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var priceLabel = UILabel().then {
        $0.text = "월세 1000/50"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var roomTypeLabel = UILabel().then {
        $0.text = "원룸"
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var roomImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var checkImageView = UIImageView().then {
        $0.image = UIImage(named: "star_fill")
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var descLabel = UILabel().then {
        $0.text = "여의도 역세권 가격도 저렴한 도보 10분 안전 보장~~~!"
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

// MARK: - UI Setup
extension RoomCell {
    private func setupUI(){
        contentView.addSubview(divideView)
        divideView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(115)
            $0.height.equalTo(1)
        }
        contentView.addSubview(priceLabel)
        priceLabel.setPriceLabel()
        priceLabel.snp.makeConstraints{
            $0.leading.equalTo(15)
            $0.top.equalTo(22)
        }
        contentView.addSubview(roomTypeLabel)
        roomTypeLabel.setRoomTypeLabel()
        roomTypeLabel.snp.makeConstraints{
            $0.leading.equalTo(16)
            $0.top.equalTo(priceLabel.snp.bottom).offset(3)
        }
        contentView.addSubview(roomImageView)
        roomImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(-16)
            $0.height.equalTo(84)
            $0.width.equalTo(126)
        }
        contentView.addSubview(checkImageView)
        checkImageView.snp.makeConstraints{
            $0.top.equalTo(22)
            $0.trailing.equalTo(-21)
            $0.width.height.equalTo(18)
        }
        contentView.addSubview(descLabel)
        descLabel.setDescriptionLable()
        descLabel.snp.makeConstraints{
            $0.top.equalTo(roomTypeLabel.snp.bottom)
            $0.leading.equalTo(16)
            $0.trailing.equalTo(roomImageView.snp.leading).offset(-14)
        }
    }
}
