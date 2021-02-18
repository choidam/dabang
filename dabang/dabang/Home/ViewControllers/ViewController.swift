//
//  ViewController.swift
//  dabang
//
//  Created by 최담 on 2021/02/16.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    var roomKindLabel = UILabel().then{
        $0.text = "방 종류"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var oneRoomButton = UIButton().then {
        $0.setTitle("원룸", for: .normal)
        $0.tag = 0
        $0.addTarget(self, action: #selector(pressRoomKindButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var twoRoomButton = UIButton().then {
        $0.setTitle("투쓰리룸", for: .normal)
        $0.tag = 1
        $0.addTarget(self, action: #selector(pressRoomKindButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var officetelButton = UIButton().then {
        $0.setTitle("오피스텔", for: .normal)
        $0.tag = 2
        $0.addTarget(self, action: #selector(pressRoomKindButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var apartmentButton = UIButton().then {
        $0.setTitle("아파트", for: .normal)
        $0.tag = 3
        $0.addTarget(self, action: #selector(pressRoomKindButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var forsaleLabel = UILabel().then {
        $0.text = "매물 종류"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var monthlyRentButton = UIButton().then {
        $0.setTitle("월세", for: .normal)
        $0.tag = 4
        $0.addTarget(self, action: #selector(pressSellingTypeButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var jeonseButton = UIButton().then {
        $0.setTitle("전세", for: .normal)
        $0.tag = 5
        $0.addTarget(self, action: #selector(pressSellingTypeButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var tradingButton = UIButton().then {
        $0.setTitle("매매", for: .normal)
        $0.tag = 6
        $0.addTarget(self, action: #selector(pressSellingTypeButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var priceLabel = UILabel().then {
        $0.text = "가격"
        $0.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .black
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var priceSortButton = UIButton().then {
        $0.setTitle("오름차순", for: .normal)
        $0.addTarget(self, action: #selector(pressPriceSortButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var divideLine = UIView().then {
        $0.backgroundColor = .verylightGray
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var dabangTableView = UITableView().then {
        $0.separatorStyle = .none
        $0.allowsSelection = false
        $0.register(RoomCell.self, forCellReuseIdentifier: RoomCell.identifier)
        $0.register(ApartmentCell.self, forCellReuseIdentifier: ApartmentCell.identifier)
        $0.register(AveragePriceCell.self, forCellReuseIdentifier: AveragePriceCell.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var roomDataSet: [RoomStruct] = []
    var roomAllDataSet: [RoomStruct] = []

//    var roomStructDataSet: [RoomStruct] = []

    var roomKindCount: Int = 4
    var sellingTypeCount: Int = 3
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        readTextFile()
    }
}

// MARK: - UI Setup
extension ViewController {
    private func setupUI(){
        self.view.backgroundColor = .white
        self.view.addSubview(roomKindLabel)
        roomKindLabel.snp.makeConstraints{
            $0.left.equalTo(16)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).offset(10)
        }
        self.view.addSubview(oneRoomButton)
        oneRoomButton.setButtonClick()
        oneRoomButton.snp.makeConstraints{
            $0.leading.equalTo(15)
            $0.top.equalTo(roomKindLabel.snp.bottom).offset(10)
        }
        self.view.addSubview(twoRoomButton)
        twoRoomButton.setButtonClick()
        twoRoomButton.snp.makeConstraints{
            $0.centerY.equalTo(oneRoomButton.snp.centerY)
            $0.leading.equalTo(oneRoomButton.snp.trailing).offset(8)
        }
        self.view.addSubview(officetelButton)
        officetelButton.setButtonClick()
        officetelButton.snp.makeConstraints{
            $0.centerY.equalTo(oneRoomButton.snp.centerY)
            $0.leading.equalTo(twoRoomButton.snp.trailing).offset(8)
        }
        self.view.addSubview(apartmentButton)
        apartmentButton.setButtonClick()
        apartmentButton.snp.makeConstraints{
            $0.centerY.equalTo(oneRoomButton.snp.centerY)
            $0.leading.equalTo(officetelButton.snp.trailing).offset(8)
        }
        self.view.addSubview(forsaleLabel)
        forsaleLabel.snp.makeConstraints{
            $0.leading.equalTo(17)
            $0.top.equalTo(oneRoomButton.snp.bottom).offset(14)
        }
        self.view.addSubview(monthlyRentButton)
        monthlyRentButton.setButtonClick()
        monthlyRentButton.snp.makeConstraints{
            $0.leading.equalTo(16)
            $0.top.equalTo(forsaleLabel.snp.bottom).offset(10)
        }
        self.view.addSubview(jeonseButton)
        jeonseButton.setButtonClick()
        jeonseButton.snp.makeConstraints{
            $0.centerY.equalTo(monthlyRentButton.snp.centerY)
            $0.leading.equalTo(monthlyRentButton.snp.trailing).offset(7)
        }
        self.view.addSubview(tradingButton)
        tradingButton.setButtonClick()
        tradingButton.snp.makeConstraints{
            $0.centerY.equalTo(monthlyRentButton.snp.centerY)
            $0.leading.equalTo(jeonseButton.snp.trailing).offset(7)
        }
        self.view.addSubview(priceLabel)
        priceLabel.snp.makeConstraints{
            $0.leading.equalTo(201)
            $0.centerY.equalTo(forsaleLabel.snp.centerY)
        }
        self.view.addSubview(priceSortButton)
        priceSortButton.setButtonClick()
        priceSortButton.snp.makeConstraints{
            $0.leading.equalTo(201)
            $0.centerY.equalTo(monthlyRentButton.snp.centerY)
        }
        self.view.addSubview(divideLine)
        divideLine.snp.makeConstraints{
            $0.top.equalTo(monthlyRentButton.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(0)
            $0.height.equalTo(8)
        }
        self.view.addSubview(dabangTableView)
        dabangTableView.delegate = self
        dabangTableView.dataSource = self
        dabangTableView.snp.makeConstraints{
            $0.top.equalTo(divideLine.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - dabang TableView
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomDataSet.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.roomDataSet[indexPath.row].roomType == 0 || self.roomDataSet[indexPath.row].roomType == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.identifier, for: indexPath) as! RoomCell
            cell.priceLabel.text = self.roomDataSet[indexPath.row].priceTitle
            if self.roomDataSet[indexPath.row].roomType == 0 {
                cell.roomTypeLabel.text = "원룸"
            } else {
                cell.roomTypeLabel.text = "투쓰리룸"
            }
            cell.descLabel.text = self.roomDataSet[indexPath.row].desc
            if self.roomDataSet[indexPath.row].isCheck == false {
                cell.checkImageView.image = UIImage(named: "star_empty")
            } else {
                cell.checkImageView.image = UIImage(named: "star_fill")
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ApartmentCell.identifier, for: indexPath) as! ApartmentCell
            cell.priceLabel.text = self.roomDataSet[indexPath.row].priceTitle
            if self.roomDataSet[indexPath.row].roomType == 2 {
                cell.roomTypeLabel.text = "오피스텔"
            } else {
                cell.roomTypeLabel.text = "아파트"
            }
            cell.descLabel.text = self.roomDataSet[indexPath.row].desc
            if self.roomDataSet[indexPath.row].isCheck == false {
                cell.checkImageView.image = UIImage(named: "star_empty")
            } else {
                cell.checkImageView.image = UIImage(named: "star_fill")
            }
            return cell
        }
    }
}

// MARK: - read Textfile
extension ViewController {
    private func readTextFile(){
        if let filepath = Bundle.main.path(forResource: "RoomListData", ofType: "txt") {
            do {
                let contents = try String(contentsOfFile: filepath)
                guard let data = contents.data(using: .utf8) else { return }
                let decoder = JSONDecoder()
                let roomData = try decoder.decode(RoomResponseString.self, from: data)
                for room in roomData.rooms {
                    var hashtags: [String] = []
                    for hashtag in room.hashTags {
                        hashtags.append(hashtag)
                    }
                    var tmp = ""
                    var price = 0
                    for ch in room.priceTitle {
                        if ch.isNumber == true {
                            tmp.append(ch)
                        } else {
                            if ch == "억" {
                                price += Int(tmp)!*10000
                                tmp = ""
                            } else if ch == "천" {
                                price += Int(tmp)!*1000
                                continue
                            } else if ch == "만" {
                                price += Int(tmp)!
                                continue
                            }
                        }
                    }
                    self.roomAllDataSet.append(RoomStruct(desc: room.desc, isCheck: room.isCheck, priceTitle: room.priceTitle, roomType: room.roomType, sellingType: room.sellingType, hashTags: hashtags, imgURL: room.imgURL, price: price))
                    self.roomDataSet.append(RoomStruct(desc: room.desc, isCheck: room.isCheck, priceTitle: room.priceTitle, roomType: room.roomType, sellingType: room.sellingType, hashTags: hashtags, imgURL: room.imgURL, price: price))
                }
                self.roomDataSet = self.roomDataSet.sorted{($0.price < $1.price) }
                self.dabangTableView.reloadData()
            } catch let e as NSError{
                print(e.localizedDescription)
            }
        } else {
            print("roadTextFile filepath error")
        }
    }
}

// MARK: - Press Button
extension ViewController {
    @objc func pressRoomKindButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            if self.roomKindCount == 1 {
                let alert = UIAlertController(title: "warning", message: "하나 이상 선택해주세요", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                self.roomKindCount -= 1
                sender.setButtonUnclick()
                self.roomDataSet.removeAll(where: {$0.roomType == sender.tag})
                self.dabangTableView.reloadData()
            }
        } else {
            self.roomKindCount += 1
            for room in roomAllDataSet {
                if room.roomType == sender.tag {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressSellingTypeButton(_ sender: UIButton){
        let sellingTypeIndex = sender.tag - 4
        if sender.backgroundColor == UIColor.lightBlue {
            if self.sellingTypeCount == 1 {
                let alert = UIAlertController(title: "warning", message: "하나 이상 선택해주세요", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
                self.present(alert, animated: true)
            } else {
                self.sellingTypeCount -= 1
                sender.setButtonUnclick()
                self.roomDataSet.removeAll(where: {$0.sellingType == sellingTypeIndex})
                self.dabangTableView.reloadData()
            }
        } else {
            self.sellingTypeCount += 1
            for room in roomAllDataSet {
                if room.sellingType == sellingTypeIndex {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressPriceSortButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            sender.setTitle("내림차순", for: .normal)
            self.roomDataSet = self.roomDataSet.sorted{($0.price > $1.price) }
            self.dabangTableView.reloadData()
        } else {
            sender.setButtonClick()
            sender.setTitle("오름차순", for: .normal)
            self.roomDataSet = self.roomDataSet.sorted{($0.price < $1.price) }
            self.dabangTableView.reloadData()
        }
    }
}
