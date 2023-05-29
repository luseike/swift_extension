//
//  EmployeeCell.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import UIKit

class EmployeeCell: UITableViewCell {
    var employee: EmployeeData?{
        didSet{
            if let idInt = employee?.id{
                idLabel.text = String(idInt)
            }else{
                idLabel.text = "foo"
            }
            nameLabel.text = employee?.employeeName
        }
    }
    
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .lightGray
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 18)
        lable.textAlignment = .left
        lable.textColor = .black
        return lable
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    func setupUI(){
        addSubview(idLabel)
        addSubview(nameLabel)
        
        idLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.trailing.equalToSuperview().inset(12)
            make.bottom.equalTo(nameLabel.snp.top).offset(-12)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.right.equalTo(idLabel)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
