//
//  ViewController.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 21/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import UIKit

class dataCell:UITableViewCell
{
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var universityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var mycollegeArry:College!
    {
        didSet
        {
            nameLabel.text = mycollegeArry.name
            cityLabel.text = mycollegeArry.city
            universityLabel.text = mycollegeArry.college
            countryLabel.text = mycollegeArry.country
        }
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var tableObj: UITableView!
     var mycollegeArray = [College]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        tableObj.delegate = self
        tableObj.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        mycollegeArray = DatabaseHelper.shared.fetchData()
        tableObj.reloadData()
    }

    @IBAction func addBtnTapped(_ sender: UIBarButtonItem)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier:"AddDataVC") as! AddDataVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mycollegeArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath) as! dataCell
        cell.mycollegeArry =  mycollegeArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete
        {
            mycollegeArray = DatabaseHelper.shared.deleteData(index: indexPath.row)
            self.tableObj.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let vc = storyboard?.instantiateViewController(withIdentifier:"DisplayDataVC") as! DisplayDataVC
        vc.mydisplayArray = [mycollegeArray[indexPath.row]]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
