//
//  ViewController.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri 12/14/2021.
//

import UIKit

//protocol CancelButtonDelegate: class{
//
//    func cancel(by cont:UIViewController)
//}

class ViewController: UIViewController {
    
    @IBOutlet weak var add: UITextField!
    //var delete: CancelButtonDelegate?
    var tableViewController: UITableViewController?
    weak var delegate: AddItemDelegate?
    var myTxt = [String]()
    var indexPath: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        myTxt.append(add.text!)
        add.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }

    @IBAction func additem(_ sender: UIBarButtonItem) {
        let text = add.text!
        delegate?.savedItem(by: self, with: text, at: indexPath)
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.cancelButtonPressed(by: self)
    }
}

