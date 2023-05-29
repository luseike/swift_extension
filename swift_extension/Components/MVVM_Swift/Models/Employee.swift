//
//  Employee.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import Foundation

struct Employees: Decodable{
    let status: String
    let data: [EmployeeData]
}

struct EmployeeData: Decodable{
    let id, employeeSalary, employeeAge: Int
    let profileImage, employeeName: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
        case profileImage = "profile_image"
    }
}
