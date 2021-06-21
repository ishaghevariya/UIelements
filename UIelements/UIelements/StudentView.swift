//
//  StudentView.swift
//  UIelements
//
//  Created by DCS on 19/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class StudentView: UIViewController {
    
    private let myToolbar:UIToolbar = {
        let toolbar = UIToolbar()
        let cancle =  UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancle))
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self,action: #selector(handleSpace))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        toolbar.items = [cancle,spacer,gallery]
        return toolbar
    }()
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "dcs")
        return imageView
    }()
    
    private let myLabelrate:UILabel = {
        let label=UILabel()
        label.text =  "Rate of department"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myStepper:UIStepper={
        let stepper=UIStepper()
        stepper.minimumValue=0
        stepper.maximumValue=10
        stepper.addTarget(self, action: #selector(handleStepper), for: .valueChanged)
        return stepper
    }()
    
    private let myLabelinformation:UILabel = {
        let label=UILabel()
        label.text =  "Department information Download hear"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myButton:UIButton={
        let button=UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .black
        button.addTarget(self, action: #selector(handleActivity), for: .touchUpInside)
        return button
    }()
    
    private let myActivityindicator:UIActivityIndicatorView={
        let Activity=UIActivityIndicatorView()
        Activity.color = .blue
        return Activity
    }()
    
    private let myLabelstudent:UILabel = {
        let label=UILabel()
        label.text =  "Progress of Department Students"
        label.backgroundColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    private let myProgress:UIProgressView = {
        let progress=UIProgressView()
        progress.setProgress(0.0, animated: true)
        return progress
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0){
            self.myProgress.setProgress(1.0, animated: true)
        }
    }
    
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    private let myTabbar:UITabBar = {
       let tabbar=UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag:1 )
        let download = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabbar.items = [history,download]
        return tabbar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        title = "Student View"
        view.backgroundColor = .white
        view.addSubview(myToolbar)
        view.addSubview(myLabelrate)
        view.addSubview(myStepper)
        view.addSubview(myLabelinformation)
        view.addSubview(myButton)
        view.addSubview(myActivityindicator)
        view.addSubview(myLabelstudent)
        view.addSubview(myProgress)
        
        view.addSubview(myImageView)
        imagePicker.delegate = self
        
        view.addSubview(myTabbar)
        myTabbar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight:CGFloat=view.safeAreaInsets.top+40
        myToolbar.frame=CGRect(x: 0, y: 0, width: view.width, height: toolBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: myToolbar.bottom + 20, width: view.width-40, height: 100)
        myLabelrate.frame=CGRect(x: 20, y: myImageView.bottom + 20, width: view.width-40, height: 40)
        myStepper.frame=CGRect(x: 20, y: myLabelrate.bottom+5, width: view.width-40, height: 40)
        myLabelinformation.frame=CGRect(x:20,y:myStepper.bottom+20,width: view.width-40,height: 40)
        myButton.frame=CGRect(x: 20, y: myLabelinformation.bottom+5, width: view.width-40, height: 40)
        myActivityindicator.frame=CGRect(x: 20, y: myButton.bottom+5, width: view.width-40, height: 40)
        myLabelstudent.frame=CGRect(x: 20, y: myActivityindicator.bottom+20, width: view.width-40, height: 40)
        myProgress.frame=CGRect(x: 20, y: myLabelstudent.bottom + 9, width: view.width-40, height: 40)
        
        let tabBarHeight:CGFloat=view.safeAreaInsets.bottom+40
        myTabbar.frame=CGRect(x: 0, y: view.height-tabBarHeight, width: view.width, height: tabBarHeight)
    }
    
    @objc func handleStepper(){
        print(myStepper.value)
    }
    
    @objc func handleCancle(){
        print("Cancle Cancle")
        self.dismiss(animated:true)
    }
    @objc func handleGallery(){
        print("Gallery Called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker,animated: true)
        }
    }
    
    @objc func handleSpace(){
        print("Space")
    }

    @objc func handleActivity(){
        DispatchQueue.main.async {
            self.myActivityindicator.isHidden = !self.myActivityindicator.isHidden
            self.myActivityindicator.isHidden ? self.myActivityindicator.stopAnimating() : self.myActivityindicator.startAnimating()
        }
      }
}

extension StudentView:UITabBarDelegate{
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

  extension StudentView:UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if  let selectImage=info[.originalImage] as? UIImage{
            myImageView.image = selectImage
        }
        picker.dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
