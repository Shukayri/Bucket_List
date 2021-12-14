//
//  ViewController.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri 12/14/2021.
//

import UIKit

protocol CancelButtonDelegate: class{
    
    func cancel(by cont:UIViewController)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var add: UITextField!
    var delete: CancelButtonDelegate?
    var tableViewController: UITableViewController?
    var index = 0
    var myBool = false
    var myTxt = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        add.text = myTxt
        add.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func additem(_ sender: UIBarButtonItem) {
        if(add.text!.isEmpty)
        {
            
        }else{
            if(myBool){
                (tableViewController as! TableViewController).items[index]=String(add.text!)
                myBool = false
            }else{
            (tableViewController as! TableViewController).items.append(String(add.text!))
            }
                delete?.cancel(by: self)

        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delete?.cancel(by: self)
    }
}

