//
//  DatabaseHelper.swift
//  CoreDataRelationsDemo
//
//  Created by Shaik Baji on 21/10/19.
//  Copyright © 2019 smartitventures.com. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DatabaseHelper
{
    
    static var shared = DatabaseHelper()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveData(obj:[String:String])
    {
        let college = NSEntityDescription.insertNewObject(forEntityName: "College", into: context) as! College
        college.name = obj["name"]
        college.city = obj["city"]
        college.college = obj["college"]
        college.country = obj["country"]
        
        do
        {
            try context.save()
        }
        catch
            {
             print("Cannot save data into table")
        }
    }
    
    func fetchData() -> [College]
    {
        var myfetchData = [College]()
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName:"College")
        do
        {
            myfetchData = try context.fetch(fetchReq) as! [College]
        }
        catch
        {
            print("Failed to save data in table")
        }
        return myfetchData
    }
    
    func deleteData(index:Int) -> [College]
    {
        var deleteObj = fetchData()
        context.delete(deleteObj[index])
        deleteObj.remove(at: index)
        do
        {
            try context.save()
        }
        catch
        {
            print("Failed to delete record from table")
        }
        return deleteObj
        
    }
    
    
    func saveDataStudents(studentobj:[String:String])
    {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        
        student.name = studentobj["name"]
        student.email = studentobj["email"]
        student.phone = studentobj["phone"]
        student.percentage = studentobj["percentage"]
        //student.universities = college
        
        do
        {
            try context.save()
        }
        catch
        {
            print("Cannot save data into table")
        }
    }
    
    func fetchDataStudent() -> [Student]
    {
        var myfetchData = [Student]()
        
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName:"Student")
        do
        {
            myfetchData = try context.fetch(fetchReq) as! [Student]
        }
        catch
        {
            print("Failed to save data in table")
        }
        return myfetchData
    }
    
    func deleteDataStudent(index:Int) -> [Student]
    {
        var deleteObj = fetchDataStudent()
        context.delete(deleteObj[index])
        deleteObj.remove(at: index)
        do
        {
            try context.save()
        }
        catch
        {
            print("Failed to delete record from table")
        }
        return deleteObj
        
    }
    
}
