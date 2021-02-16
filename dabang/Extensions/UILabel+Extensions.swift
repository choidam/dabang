//
//  UILabel+Extensions.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import Foundation
import UIKit

extension UILabel {
    func setPriceLabel() {
        self.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.textColor = .black
    }
    func setRoomTypeLabel() {
        self.font = UIFont.systemFont(ofSize: 13)
        self.textColor = .black
    }
    func setDescriptionLable() {
        self.font = UIFont.systemFont(ofSize: 13)
        self.textColor = .lightGray
    }
}
