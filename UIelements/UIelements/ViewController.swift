//
//  ViewController.swift
//  UIelements
//
//  Created by DCS on 16/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    private let myTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Name"
        textField.textAlignment = .center
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let myTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Enter Your Email"
        textView.textAlignment = .center
        textView.backgroundColor = .gray
        return textView
    }()
    
    private let myLabel:UILabel = {
        let label=UILabel()
        label.text =  "Seclect Date Of Birth in DatePicker"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .gray
        datePicker.addTarget(self, action: #selector(handleDateChange),for: .valueChanged)
        return datePicker
    }()
    
    private let myLabelgender:UILabel = {
        let label=UILabel()
        label.text =  "Seclect Gender"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let mySegmentControl : UISegmentedControl = {
       let segControl=UISegmentedControl()
        segControl.insertSegment(withTitle: "Female", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Male", at: 1, animated: true)
        segControl.selectedSegmentIndex=0
        segControl.addTarget(self, action: #selector(handleSegment), for: .valueChanged)
        return segControl
    }()
    
    private let myTextFieldpassword:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Password"
        textField.textAlignment = .center
        textField.backgroundColor = .gray
        return textField
    }()
    
    private let mybutton:UIButton = {
       let button=UIButton()
        button.setTitle("Registration", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .black
        return button
    }()
    
    private let myPageControl:UIPageControl = {
        let pageControl=UIPageControl()
        pageControl.numberOfPages=4
        pageControl.addTarget(self, action:#selector(handlepageChange), for: .valueChanged)
        pageControl.backgroundColor = .gray
        return pageControl
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title="Create your Account"
        view .backgroundColor = .white
        
        view.addSubview(myTextField)
        view.addSubview(myTextView)
        view.addSubview(myLabel)
        view.addSubview(myDatePicker)
        view.addSubview(myTextFieldpassword)
        view.addSubview(mybutton)
        view.addSubview(myPageControl)
        view.addSubview(myLabelgender)
        view.addSubview(mySegmentControl)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        myTextField.frame=CGRect(x: 20, y:110, width:view.width-40, height: 40)
        myTextView.frame=CGRect(x: 20, y: myTextField.bottom+20, width: view.width-40, height: 40)
        myLabel.frame=CGRect(x: 20, y: myTextView.bottom+20, width: view.width-40, height: 40)
        myDatePicker.frame=CGRect(x: 20, y: myLabel.bottom+5, width: view.width-40, height: 40)
        myLabelgender.frame=CGRect(x: 20, y: myDatePicker.bottom + 20, width: view.width-40, height: 40)
        mySegmentControl.frame=CGRect(x: 20, y: myLabelgender.bottom+5, width: view.width-40, height: 40)
        myTextFieldpassword.frame=CGRect(x: 20, y: mySegmentControl.bottom+20, width: view.width-40, height: 40)
        mybutton.frame=CGRect(x:20,y:myTextFieldpassword.bottom+20,width:view.width-40,height: 40)
        myPageControl.frame=CGRect(x: 20, y: view.height-100, width:view.width-40, height:40 )
       
    }
    @objc func handleDateChange(){
        print(myDatePicker.date)
    }
    @objc func handlepageChange(){
        print(myPageControl.currentPage)
    }
    
    @objc func handleButtonClick(){
        print("Clicked")
        let vc = LoginVC()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }
    @objc func handleSegment(){
        print(mySegmentControl.selectedSegmentIndex)
    }
   
}

