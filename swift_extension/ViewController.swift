//
//  ViewController.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var headerView: HeaderView = {
        let headerView = HeaderView(frame: .zero)
        return headerView
    }()
    
    lazy var postView: PostView = {
        let view = PostView(frame: .zero)
        return view
    }()
    
    private lazy var buttonView = ButtonView(frame: .zero)

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [headerView, postView, buttonView])
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupView()
        setupData()
    }
    
    func setupView(){
        
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.topMargin)
            make.bottom.equalTo(self.view.snp.bottomMargin)
            make.leading.trailing.equalToSuperview()
        }
        
        buttonView.snp.makeConstraints { make in
            make.height.equalTo(ButtonView.height)
        }
    }
    
    func setupData(){
        self.title = "Lorem Ipsum"
        
        let store = DemoStore.shared
        let headerTitle = store.authorName
        let headerSubTitle = store.authorRole
        let headerImage = UIImage(named: store.authorImageName)
        headerView.configure(title: headerTitle, subtitle: headerSubTitle, image: headerImage)
    }


}

#if DEBUG
import SwiftUI

struct ViewController_Preview: PreviewProvider{
    static var previews: some View{
        ViewController().showPreview()
    }
}
#endif
