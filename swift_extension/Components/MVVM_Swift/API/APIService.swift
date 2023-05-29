//
//  APIService.swift
//  swift_extension
//
//  Created by 远路蒋 on 2023/5/29.
//

import Foundation


class APIService {
    private let sourcesURL = URL(string: "http://dummy.restapiexample.com/api/v1/employees")!
    func apiToGetEmployeeData(completion : @escaping (Employees) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                let jsonDecoder = JSONDecoder()
                
                let empData = try! jsonDecoder.decode(Employees.self, from: data)
                    completion(empData)
            }
            
        }.resume()
    }
}
