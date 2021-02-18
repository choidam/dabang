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
        $0.addTarget(self, action: #selector(pressOneRoomButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var twoRoomButton = UIButton().then {
        $0.setTitle("투쓰리룸", for: .normal)
        $0.addTarget(self, action: #selector(pressTwoThreeRoomButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var officetelButton = UIButton().then {
        $0.setTitle("오피스텔", for: .normal)
        $0.addTarget(self, action: #selector(pressOfficetelButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var apartmentButton = UIButton().then {
        $0.setTitle("아파트", for: .normal)
        $0.addTarget(self, action: #selector(pressApartmentButton(_:)), for: .touchUpInside)
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
        $0.addTarget(self, action: #selector(pressMonthlyRentButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var jeonseButton = UIButton().then {
        $0.setTitle("전세", for: .normal)
        $0.addTarget(self, action: #selector(pressJeonseButton(_:)), for: .touchUpInside)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    var tradingButton = UIButton().then {
        $0.setTitle("매매", for: .normal)
        $0.addTarget(self, action: #selector(pressTradingButton(_:)), for: .touchUpInside)
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
    var roomDataSet: [Room] = []
    var roomAllDataSet: [Room] = []
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
                    self.roomDataSet.append(Room(desc: room.desc, isCheck: room.isCheck, priceTitle: room.priceTitle, roomType: room.roomType, sellingType: room.sellingType, hashTags: hashtags, imgURL: room.imgURL))
                    self.roomAllDataSet.append(Room(desc: room.desc, isCheck: room.isCheck, priceTitle: room.priceTitle, roomType: room.roomType, sellingType: room.sellingType, hashTags: hashtags, imgURL: room.imgURL))
                }
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
    @objc func pressOneRoomButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            self.roomDataSet.removeAll(where: {$0.roomType == 0})
            self.dabangTableView.reloadData()
        } else {
            for room in roomAllDataSet {
                if room.roomType == 0 {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressTwoThreeRoomButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            self.roomDataSet.removeAll(where: {$0.roomType == 1})
            self.dabangTableView.reloadData()
        } else {
            for room in roomAllDataSet {
                if room.roomType == 1 {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressOfficetelButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            self.roomDataSet.removeAll(where: {$0.roomType == 2})
            self.dabangTableView.reloadData()
        } else {
            for room in roomAllDataSet {
                if room.roomType == 2 {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressApartmentButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            self.roomDataSet.removeAll(where: {$0.roomType == 3})
            self.dabangTableView.reloadData()
        } else {
            for room in roomAllDataSet {
                if room.roomType == 3 {
                    self.roomDataSet.append(room)
                }
            }
            self.dabangTableView.reloadData()
            sender.setButtonClick()
        }
    }
    @objc func pressMonthlyRentButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
        } else {
            sender.setButtonClick()
        }
    }
    @objc func pressJeonseButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
        } else {
            sender.setButtonClick()
        }
    }
    @objc func pressTradingButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
        } else {
            sender.setButtonClick()
        }
    }
    @objc func pressPriceSortButton(_ sender: UIButton){
        if sender.backgroundColor == UIColor.lightBlue {
            sender.setButtonUnclick()
            sender.setTitle("내림차순", for: .normal)
        } else {
            sender.setButtonClick()
            sender.setTitle("오름차순", for: .normal)
        }
    }
}
