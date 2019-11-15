//
//  StudentDataDisplayVC.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 26/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit

class studentCell:UITableViewCell
{
    
    @IBOutlet weak var namLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var mobileLbl: UILabel!
    @IBOutlet weak var percentageLbl: UILabel!
    
    var myStudentArry:Student!
    {
        didSet
        {
            namLbl.text  = myStudentArry.name
            emailLbl.text = myStudentArry.email
            mobileLbl.text  = myStudentArry.phone
            percentageLbl.text = myStudentArry.percentage
        }
    }
    
}


class StudentDataDisplayVC: UIViewController
{
    
    @IBOutlet weak var tableObj: UITableView!
    
    var mydisplayArray = [Student]()
    //var college:College?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        if college?.student?.allObjects != nil{
//           mydisplayArray = college?.student?.allObjects as! [Student]
//        }
        
        mydisplayArray = DatabaseHelper.shared.fetchDataStudent()
        tableObj.reloadData()
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableObj.delegate = self
        tableObj.dataSource = self
    }
    
    
    
}
extension StudentDataDisplayVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mydisplayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath) as! studentCell
        cell.myStudentArry =  mydisplayArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            mydisplayArray = DatabaseHelper.shared.deleteDataStudent(index: indexPath.row)
            self.tableObj.deleteRows(at: [indexPath], with: .automatic)
        }
    }
   
}
