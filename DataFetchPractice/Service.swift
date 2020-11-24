//
//  Service.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import UIKit
import Alamofire

protocol ServiceDelegate  {
    func success(response: CutomerListResponse) -> Void
}

class Service {
    
    var requestDelegate: ServiceDelegate?
    public func getRequest(_ url: String, viewModel: ViewModel, param: [String: Any]){
        AF.request(url,
                   method: .get,
                   parameters: param,
                   encoding: URLEncoding.default
        ).response { (response) in
            if let error = response.error {
                //localizedDescription : 어떤 오류가 났는지 스트링 타입으로 보여줌
                print("AF RESPONSE [GET] ERROR ------- \(error.localizedDescription)")
            }
            
            guard let code = response.response?.statusCode else { return }
            
            // 오류 체크
            if code >= 200, code<=299 {
                switch response.result {
                
                case .success(let data) :
                    guard let data = data else {return}
                    do {
                        let json = try JSONDecoder().decode(CutomerListResponse.self, from: data)
                        self.requestDelegate?.success(response: json)
                    } catch let error {
                        print("----- JSONDecoder ERROR (CUSTOMER INFO)-----  \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("----- AF RESULT FAIL [GET] (CUSTOMER INFO)----- \(error.localizedDescription)")
                }
                
            } else if code >= 400, code <= 499 {
                print("----- AF STATUS CODE IS 400 ~ 499 [GET] (STORE INFO)----- ")
            } else {
                print("----- AF STATUS CODE IS 500 ~ [GET] (STORE INFO)----- ")
            }
        }
    }
}


