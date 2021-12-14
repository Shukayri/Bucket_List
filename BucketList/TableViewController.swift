//
//  TableViewController.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri 12/14/2021.
//

import UIKit

class TableViewController: UITableViewController,CancelButtonDelegate {
    func cancelButtonPressed(by cont: UIViewController) {
    print("test")
    }
    
    
    
    @IBOutlet var table: UITableView!
    
    
    var items = ["Go Hiking", "Visit Egypt", "Ride Rollercoaster"]
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource=self
        table.delegate=self

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(sender is UIBarButtonItem){
            let nv = segue.destination as! UINavigationController
            let seg = nv.topViewController! as! ViewController
            seg.tableViewController = self
            seg.delete = self
                seg.index = items.count
        }else if(sender is Int){
            
            let nv = segue.destination as! UINavigationController
            let seg = nv.topViewController! as! ViewController
            
            seg.tableViewController = self
            seg.delete = self
            
            seg.index = sender as! Int
            seg.myBool = true
            
            seg.myTxt = items[sender as! Int]
        }
        
    }
    func cancel(by cont: UIViewController) {
        table.reloadData()
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "", sender: indexPath.row )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        table.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]

        return cell
    }

}
