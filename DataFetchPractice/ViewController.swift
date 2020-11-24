//
//  ViewController.swift
//  DataFetchPractice
//
//  Created by 김믿음 on 2020/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    private let customerListNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.clipsToBounds = true
        label.layer.borderColor = UIColor.systemBlue.cgColor
        label.layer.borderWidth = 1
        label.frame.size = CGSize(width: 150, height: 50)
        return label
    }()
    
    private let nameButton : UIButton = {
        let button = UIButton()
        button.setTitle("랜덤이름 제조기", for: .normal)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonTaped), for: .touchUpInside)
       return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(customerListNameLabel)
        view.addSubview(nameButton)
        
        customerListNameLabel.center = view.center
        nameButton.frame = CGRect(x: 110, y: 550, width: 200, height: 50)
    
    }
    
    @objc func buttonTaped() {
       print("😁😁😁😁")
    }

}

