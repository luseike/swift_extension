//
//  PresentFromViewController.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import UIKit


class PresentFromViewController: UIViewController {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem Ipsum"
        label.font = .boldSystemFont(ofSize: 32)
        return label
    }()
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isEditable = false
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae. "
        return textView
    }()
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = view.tintColor
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    lazy var containerStackView: UIStackView = {
        let spacer = UIView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textView, spacer, registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupConstraints()
        
        registerButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }
    
    func setupConstraints(){
        view.addSubview(containerStackView)
        containerStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 24),
            containerStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -24),
            containerStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            containerStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func presentModalController(){
        let vc = PresentDesViewController()
        vc.modalPresentationStyle = .overCurrentContext
        self.present(vc, animated: false)
    }
    
    
}
