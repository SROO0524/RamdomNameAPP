//
//  Model.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import Foundation

public protocol Response: Codable {}

//    MARK: Data Model
struct CutomerListResponse: Response {
    let list: [CustomerInfo]
}


struct CustomerInfo : Codable {
    let custno: Int
    let name : String
    let contact : String
    let birth : String
    let memo: String
    let dontsend: Int
    let point : Int
    let profile : Int
    let chargeName : String
    let regdate : String
    let profileUrl : String
    
    enum CodingKeys: String, CodingKey {
        case custno, name, contact, birth, memo, dontsend, point, profile, chargeName, regdate, profileUrl
    }
}
