//
//  UIButton+Extensions.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import Foundation
import UIKit

extension UIButton {
    func setButtonClick() {
        self.backgroundColor = .lightBlue
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = 4
        self.contentEdgeInsets = UIEdgeInsets(top: 11, left: 9, bottom: 11, right: 9)
    }
    func setButtonUnclick() {
        self.backgroundColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        self.setTitleColor(.verydarkGray, for: .normal)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 4
        self.contentEdgeInsets = UIEdgeInsets(top: 11, left: 9, bottom: 11, right: 9)
    }
    func setHashtag() {
        self.backgroundColor = .verylightGray
        self.setTitleColor(.darkGray, for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        self.layer.cornerRadius = 2
        self.isUserInteractionEnabled = false
        self.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
