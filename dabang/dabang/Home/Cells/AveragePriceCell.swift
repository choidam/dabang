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
    var divideView = UIView().then {
        $0.backgroundColor = .verylightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var averagePriceLabel = UILabel().then {
        $0.text = "평균 매물가"
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var addressLabel = UILabel().then {
        $0.textColor = .verydarkGray
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var monthLabel = UILabel().then {
        $0.text = "평균월세"
        $0.textColor = .verydarkGray
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var monthPriceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .dustyBlue
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var divideView2 = UIView().then {
        $0.backgroundColor = .lightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var jeonseLabel = UILabel().then {
        $0.text = "평균전세"
        $0.font = UIFont.systemFont(ofSize: 11)
        $0.textColor = .verydarkGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var jeonsePriceLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.textColor = .dustyOrange
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
extension AveragePriceCell {
    private func setupUI(){
        contentView.backgroundColor = .verylightBlue
        addSubview(divideView)
        divideView.snp.makeConstraints{
            $0.leading.trailing.bottom.equalToSuperview()
            $0.top.equalTo(80)
            $0.height.equalTo(1)
        }
        addSubview(averagePriceLabel)
        averagePriceLabel.snp.makeConstraints{
            $0.leading.equalTo(15)
            $0.top.equalTo(10)
        }
        addSubview(addressLabel)
        addressLabel.snp.makeConstraints{
            $0.centerY.equalTo(averagePriceLabel.snp.centerY)
            $0.leading.equalTo(averagePriceLabel.snp.trailing).offset(13)
        }
        addSubview(monthLabel)
        monthLabel.snp.makeConstraints{
            $0.leading.equalTo(15)
            $0.top.equalTo(averagePriceLabel.snp.bottom).offset(9)
        }
        addSubview(monthPriceLabel)
        monthPriceLabel.snp.makeConstraints{
            $0.leading.equalTo(15)
            $0.top.equalTo(monthLabel.snp.bottom).offset(6)
        }
        addSubview(divideView2)
        divideView2.snp.makeConstraints{
            $0.leading.equalTo(88)
            $0.width.equalTo(1)
            $0.top.equalTo(34)
            $0.bottom.equalTo(-16)
        }
        addSubview(jeonseLabel)
        jeonseLabel.snp.makeConstraints {
            $0.leading.equalTo(divideView2.snp.trailing).offset(13)
            $0.top.equalTo(averagePriceLabel.snp.bottom).offset(10)
        }
        addSubview(jeonsePriceLabel)
        jeonsePriceLabel.snp.makeConstraints {
            $0.leading.equalTo(divideView2.snp.trailing).offset(13)
            $0.top.equalTo(jeonseLabel.snp.bottom).offset(5)
        }
    }
}
