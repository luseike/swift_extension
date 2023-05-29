//
//  EmployeeViewModel.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import Foundation

class EmployeeViewModel: NSObject{
    private var apiService: APIService!
    
    private(set) var empData: Employees!{
        didSet{
            self.bindEmployeeViewModelToController()
        }
    }
    
    // 这个bind方法会在controller里调用
    var bindEmployeeViewModelToController: (() -> ()) = {}
    
    override init() {
        super.init()
        
        self.apiService = APIService()
        self.apiService.apiToGetEmployeeData { empData in
            self.empData = empData
        }
    }
}
