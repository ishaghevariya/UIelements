//
//  DashboradVC.swift
//  UIelements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DashboradVC: UIViewController {
    private let myLabel:UILabel = {
        let label=UILabel()
        label.text =  "Image Of Department"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "dcs")
        return imageView
    }()

    private let myLabelnotification:UILabel = {
        let label=UILabel()
        label.text =  "On/OFF notifaction"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let mySwitch:UISwitch = {
        let mswitch=UISwitch()
        mswitch.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return mswitch
    }()
    
    private let myLabelprogress:UILabel = {
        let label=UILabel()
        label.text =  "progress of department"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let mySlider:UISlider={
        let slider=UISlider()
        slider.minimumValue=0
        slider.maximumValue=10
        slider.addTarget(self, action: #selector(handleSlider), for: .valueChanged)
        return slider
    }()
    
    
    private let myLabeldepatment:UILabel = {
        let label=UILabel()
        label.text =  "Avaliable course in Department"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myPickerView :UIPickerView={
        let picker=UIPickerView()
        picker.backgroundColor = .gray
        return picker
    }()
    private let pickerdata=["BCA","BBA","BCOME"]
    
    private let myButton:UIButton = {
        let button=UIButton()
        button.setTitle("StudentView", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "DashBorad"
        view.backgroundColor = .white
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(myLabelnotification)
        view.addSubview(mySwitch)
        view.addSubview(myLabelprogress)
        view.addSubview(mySlider)
        view.addSubview(myLabeldepatment)
        
        view.addSubview(myPickerView)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        view.addSubview(myButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame=CGRect(x: 20, y: 80 ,width: view.width - 40, height: 40)
        myImageView.frame = CGRect(x: 20, y: myLabel.bottom + 20, width: view.width - 40, height: 100)
        myLabelnotification.frame=CGRect(x: 20, y: myImageView.bottom + 20, width: view.width-40, height: 40)
        mySwitch.frame=CGRect(x: 20, y: myLabelnotification.bottom + 5, width: view.width-40, height: 40)
        myLabelprogress.frame=CGRect(x: 20, y: mySwitch.bottom+20, width: view.width-40, height: 40)
        mySlider.frame=CGRect(x: 20, y: myLabelprogress.bottom+5, width: view.width-40, height: 40)
        myLabeldepatment.frame=CGRect(x: 20, y: mySlider.bottom + 20, width: view.width - 40, height: 40)
        myPickerView.frame=CGRect(x: 20, y: myLabeldepatment.bottom + 5, width: view.width - 40, height: 40)
        myButton.frame=CGRect(x: 20, y: myPickerView.bottom + 20, width: view.width - 40, height: 40)
    }
    
    @objc func handleSwitch(){
        print(mySwitch.isOn)
    }
    
    @objc func handleSlider(){
        print(mySlider.value)
    }
    
    @objc func handleButton(){
        print("clickling..")
        
        let vc = StudentView()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated:false)
        present(nav,animated: false)
    }
  
}

extension DashboradVC : UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
       return  pickerdata.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return  pickerdata[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerdata[row])
    }
}
