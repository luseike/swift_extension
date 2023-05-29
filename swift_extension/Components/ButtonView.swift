//
//  ButtonView.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit
import SnapKit

class ButtonView: UIView {
    
    let buttonHeight = 54.0
    static let height = 86.0
    lazy var demoButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = button.tintColor
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = buttonHeight / 2
        button.clipsToBounds = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addSubview(demoButton)
        demoButton.snp.makeConstraints { make in
            make.height.equalTo(buttonHeight)
            make.top.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-16)
            make.leading.trailing.equalToSuperview().inset(24)
        }
    }
}
