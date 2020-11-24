//
//  Model.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import Foundation

struct CustomerListInfo : Codable {
    let name : String
    let contact : String
    
    enum CodingKeys: String, CodingKey {
        case name,contact
    }
}
