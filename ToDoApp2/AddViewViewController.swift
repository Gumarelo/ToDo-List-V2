//
//  AddViewViewController.swift
//  ToDoApp2
//
//  Created by Jorge Casariego on 16/6/15.
//  Copyright (c) 2015 Jorge Casariego. All rights reserved.
//

import UIKit

class AddViewViewController: UIViewController {
    
    @IBOutlet weak var titleTaskTextField: UITextField!
    @IBOutlet weak var noteTextField: UITextView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButton(sender: UIBarButtonItem) {
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()

        var itemList: NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        var datos: NSMutableDictionary = NSMutableDictionary()
        datos.setObject(titleTaskTextField.text, forKey: "itemTitle")
        datos.setObject(noteTextField.text, forKey: "itemNote")
        
        if ((itemList) != nil){ //data already available
            var newMutableList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!{
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableList.addObject(datos)
            userDefaults.setObject(newMutableList, forKey: "itemList")
            
            
        } else{ //This is the first item in the list
            userDefaults.removeObjectForKey("itemList")
            
            itemList = NSMutableArray()
            itemList?.addObject(datos)
            
            userDefaults.setObject(itemList, forKey: "itemList")
        }
        
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

}
