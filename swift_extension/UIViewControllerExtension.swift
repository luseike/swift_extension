//
//  UIViewControllerExtension.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/26.
//

import UIKit
import SwiftUI

extension UIViewController{
    
    private struct Preview: UIViewControllerRepresentable{
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            //
        }
    }
    
    func showPreview() -> some View{
        Preview(viewController: self)
    }
}
