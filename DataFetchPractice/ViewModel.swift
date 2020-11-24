//
//  ViewModel.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import Foundation

protocol viewModelDelegate {
    func updateName(name: String)
}

class ViewModel : ServiceDelegate {
    
//    MARK: Properties
    var customerInfo : CustomerInfo?
    private var customerListInfos : [CutomerListResponse] = []
    let dataService = Service()
    let url = "http://crm-staging.gongbiz.kr/app/v2020/cust"
    var delegate : viewModelDelegate?
    
    
    init() {
        dataService.requestDelegate = self
    }
    
    // Data Fetch
    func fetch() {
        dataService.getRequest(url, viewModel: self, param: ["size": 20, "page": 1])
    }
    
    // success 하면 데이터를 넣어주거라
    func success(response: CutomerListResponse) {
        let customerInfosRes = response as! CutomerListResponse
        //RanDom으로 이름 생성
        let name = customerInfosRes.list.randomElement()?.name
        print("\(customerInfosRes.list)")
        delegate?.updateName(name: name ?? "")
        print("성공")
    }
    
    
    
    
}
