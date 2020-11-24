//
//  ViewController.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import UIKit
import Foundation

class ViewController: UIViewController , viewModelDelegate {

//    MARK: Properties
    var customerInfo : CustomerInfo?
    let viewModel = ViewModel()
    
    private let customerListNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.layer.borderWidth = 1
        label.frame.size = CGSize(width: 150, height: 50)
        label.textAlignment = .center
        return label
    }()
    
    private let nameButton : UIButton = {
        let button = UIButton()
        button.setTitle("랜덤이름 제조기", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
       return button
    }()

//    MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customerListNameLabel)
        view.addSubview(nameButton)
        
        customerListNameLabel.center = view.center
        nameButton.frame = CGRect(x: 110, y: 550, width: 200, height: 50)
        viewModel.delegate = self
        
    }
//    MARK: Selector
    @objc func buttonTaped() {
       print("😁😁😁😁")
        viewModel.fetch()

    }

//    MARK: Func
    
    // 이름 업데이트
    func updateName(name: String) {
        customerListNameLabel.text = name
    }

}

