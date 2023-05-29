//
//  TestView.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit

class TestView: UIView {
    
    @IBOutlet weak var imgView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
        let xib = Bundle.main.loadNibNamed("TestView", owner: self)
        let view = xib?.first as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TestView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        TestView().showPreview()
    }
}
#endif
