//
//  EmployeeController.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import UIKit

class EmployeeViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.register(EmployeeCell.self, forCellReuseIdentifier: "EmployeeCell")
        return tableView
    }()
    
    private var employeeViewModel: EmployeeViewModel!
    
    private var dataSource: EmployeeTableViewDataSource<EmployeeCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "MVVM test"
        self.view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.employeeViewModel = EmployeeViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateSource()
        }
    }
    
    func updateSource(){
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeCell", items: self.employeeViewModel.empData.data, configureCell: { cell, evm in
            cell.employee = evm
        })
        
        DispatchQueue.main.async {
            self.tableView.dataSource = self.dataSource
            self.tableView.reloadData()
        }
    }
}
