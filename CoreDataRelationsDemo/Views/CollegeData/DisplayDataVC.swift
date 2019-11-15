//
//  DisplayDataVC.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 21/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit



class twoCell:UITableViewCell
{
    
    @IBOutlet weak var namLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var uniLbl: UILabel!
    @IBOutlet weak var countryLbl: UILabel!
    
    var mycollegeArry:College!
    {
    didSet
    {
        namLbl.text  = mycollegeArry.name
        cityLbl.text = mycollegeArry.city
        uniLbl.text  = mycollegeArry.college
        countryLbl.text = mycollegeArry.country
    }
    }
   
}


class DisplayDataVC: UIViewController
{
    
@IBOutlet weak var tableObj: UITableView!
    
    var mydisplayArray = [College]()
    
    var collegeDetail:College?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableObj.delegate = self
        tableObj.dataSource = self
        tableObj.reloadData()
        
    }
    


}
extension DisplayDataVC:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "twoCell", for: indexPath) as! twoCell
        cell.mycollegeArry =  mydisplayArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier:"StudentDataVC") as! StudentDataVC
       
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
