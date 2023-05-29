//
//  UserInfo.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit
import SnapKit

class UserInfo: UIView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "我的信息"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .left
        return label
    }()
    
    let imageWidth = 60.0
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "yaofan"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth / 2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "Luseike"
        return label
    }()
    
    lazy var roleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.text = "iOS Engineer"
        return label
    }()
    
    lazy var nameStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, roleLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()
    
    
    func setUpView(){
        self.addSubview(titleLabel)
        self.addSubview(profileImageView)
        self.addSubview(nameStackView)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(10)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(20)
        }
        
        nameStackView.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(12)
            make.centerY.equalTo(profileImageView.snp.centerY)
            make.trailing.equalToSuperview().offset(-20)
        }
        
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct UserInfo_Preview: PreviewProvider {
    static var previews: some View {
        UserInfo().showPreview()
    }
}
#endif

