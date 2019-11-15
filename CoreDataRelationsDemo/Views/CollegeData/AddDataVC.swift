//
//  AddDataVC.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 21/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit

class AddDataVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var universityTF: UITextField!
    @IBOutlet weak var countryTF: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
        
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton)
    {
        let obj = ["name":nameTF.text!,"city":cityTF.text!,"college":universityTF.text!,"country":countryTF.text!]
        DatabaseHelper.shared.saveData(obj:obj)
        self.navigationController?.popViewController(animated: true)
    }
    

}
