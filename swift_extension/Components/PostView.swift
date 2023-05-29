//
//  PostView.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit
import SnapKit


class PostView: UIView{
    lazy var postTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Hey there. Anyone looking for Storyboardless Views?"
        return label
    }()
    
    lazy var textView: UITextView = {
        let textView = UITextView(frame: .zero)
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.textColor = .darkGray
        textView.textAlignment = .justified
        textView.isScrollEnabled = false
        textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sem fringilla ut morbi tincidunt augue interdum. Ut morbi tincidunt augue interdum velit euismod in pellentesque massa. Pulvinar etiam non quam lacus suspendisse faucibus interdum posuere. Mi in nulla posuere sollicitudin aliquam ultrices sagittis orci a. Eget nullam non nisi est sit amet. Odio pellentesque diam volutpat commodo. Id eu nisl nunc mi ipsum faucibus vitae. Duis at consectetur lorem donec massa. Nullam vehicula ipsum a arcu cursus vitae congue. \n\nFelis imperdiet proin fermentum leo. Augue interdum velit euismod in pellentesque massa. Laoreet suspendisse interdum consectetur libero id faucibus nisl. Vitae auctor eu augue ut lectus arcu bibendum at. Morbi tempus iaculis urna id volutpat lacus laoreet. Euismod lacinia at quis risus sed vulputate odio ut. Tempus egestas sed sed risus pretium quam vulputate.\n\nSed pulvinar proin gravida hendrerit. Non pulvinar neque laoreet suspendisse interdum consectetur libero. Commodo ullamcorper a lacus vestibulum sed arcu non. Purus non enim praesent elementum facilisis. Nibh tortor id aliquet lectus. Vulputate dignissim suspendisse in est. Id leo in vitae turpis massa sed. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Magna fringilla urna porttitor rhoncus dolor purus. Blandit turpis cursus in hac habitasse platea dictumst quisque sagittis. Sit amet risus nullam eget felis eget nunc lobortis mattis. Velit sed ullamcorper morbi tincidunt ornare massa eget egestas purus. Tortor posuere ac ut consequat semper viverra nam libero justo. Mauris ultrices eros in cursus turpis massa tincidunt dui ut."
        return textView
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postTitleLabel, textView])
        stackView.axis = .vertical
        stackView.spacing = 16.0
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInset = UIEdgeInsets(top: 8, left: 24, bottom: 8, right: 24)
        return scrollView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView(){
        backgroundColor = .systemBackground
        
        scrollView.addSubview(bodyStackView)
        scrollView.contentSize = CGSize(width: 0, height: 20)// bodyStackView.frame.size
        
        bodyStackView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
            make.width.equalTo(scrollView.snp.width).inset(24)
        }
        
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}


#if DEBUG
import SwiftUI

struct PostView_Previews: PreviewProvider{
    static var previews: some View{
        PostView().showPreview()
    }
}
#endif
