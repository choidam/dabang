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
    let divideView = UIView().then {
        $0.backgroundColor = .verylightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let priceLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let roomTypeLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let roomImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 4
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let checkImageView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let descLabel = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let hashtag1 = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let hashtag2 = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let hashtag3 = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    let hashtag4 = UIButton().then {
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
        contentView.addSubview(hashtag1)
        hashtag1.setHashtag()
        hashtag1.snp.makeConstraints {
            $0.leading.equalTo(15)
            $0.top.equalTo(descLabel.snp.bottom).offset(5)
        }
        contentView.addSubview(hashtag2)
        hashtag2.setHashtag()
        hashtag2.snp.makeConstraints {
            $0.centerY.equalTo(hashtag1.snp.centerY)
            $0.leading.equalTo(hashtag1.snp.trailing).offset(4)
        }
        contentView.addSubview(hashtag3)
        hashtag3.setHashtag()
        hashtag3.snp.makeConstraints {
            $0.centerY.equalTo(hashtag1.snp.centerY)
            $0.leading.equalTo(hashtag2.snp.trailing).offset(4)
        }
        contentView.addSubview(hashtag4)
        hashtag4.setHashtag()
        hashtag4.snp.makeConstraints {
            $0.centerY.equalTo(hashtag1.snp.centerY)
            $0.leading.equalTo(hashtag3.snp.trailing).offset(4)
        }
    }
}
