//
//  LoginVC.swift
//  UIelements
//
//  Created by DCS on 16/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    private let myTextFiled:UITextField={
        let textFiled = UITextField()
        textFiled.placeholder = "Enter Emailid "
        textFiled.textAlignment = .center
        textFiled.backgroundColor = .gray
        return textFiled
    }()
    
    private let myTextFiledpassword:UITextField={
        let textFiled = UITextField()
        textFiled.placeholder = "Enter Password "
        textFiled.textAlignment = .center
        textFiled.backgroundColor = .gray
        return textFiled
    }()
    
    private let myButton:UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Login Page"
        view.backgroundColor = .white
        view.addSubview(myTextFiled)
        view.addSubview(myTextFiledpassword)
        view.addSubview(myButton)
        // Do any additional setup after loading the view.
    }
    @objc func handleButtonClick(){
        print("clickling..")
        
        let vc = DashboradVC()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myTextFiled.frame=CGRect(x: 20, y: 200, width: view.width-40, height: 40)
        myTextFiledpassword.frame=CGRect(x: 20, y: myTextFiled.bottom + 20, width: view.width-40, height: 40)
        myButton.frame=CGRect(x: 20, y: myTextFiledpassword.bottom + 20, width: view.width-40, height: 40)
    }
}
