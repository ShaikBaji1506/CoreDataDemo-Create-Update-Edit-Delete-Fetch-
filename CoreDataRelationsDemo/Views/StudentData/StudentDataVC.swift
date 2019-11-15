//
//  StudentDataVC.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 26/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit

class StudentDataVC: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var mailTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var percentageTF: UITextField!
    
    //var college:College?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    

    @IBAction func saveBtnTapped(_ sender: UIButton)
    {
        let obj = ["name":nameTF.text!,"email":mailTF.text!,"phone":phoneTF.text!,"percentage":percentageTF.text!]
       
        
        DatabaseHelper.shared.saveDataStudents(studentobj: obj)
        
        let vc = storyboard?.instantiateViewController(withIdentifier:"StudentDataDisplayVC") as! StudentDataDisplayVC
       
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
