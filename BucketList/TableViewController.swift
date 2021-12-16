//
//  TableViewController.swift
//  BucketList
//
//  Created by Abdulmajeed Shukayri 12/14/2021.
//

import UIKit
import CoreData

class TableViewController: UITableViewController,AddItemDelegate {
    func savedItem(by controller: ViewController, with text: String, at indexPath: IndexPath?) {
        if let saved = indexPath {
            let item = items[saved.row]
            item.text = text
        }else {
            let item = NSEntityDescription.insertNewObject(forEntityName: "BucketListItem", into: managedObjectContext) as! BucketListItem
            item.text = text
            items.append(item)
        }
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        
        dismiss(animated: true, completion: nil)
        tableView.reloadData()
    }
    
    func cancelButtonPressed(by controller: ViewController) {
        dismiss(animated: true, completion: nil)    }
    
    
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    @IBOutlet var table: UITableView!
    
    
    var items = [BucketListItem]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.dataSource = self
      table.delegate = self
        fetchAllItems()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            if sender is UIBarButtonItem{
                let nav = segue.destination as! UINavigationController
                let mySeg = nav.topViewController as! ViewController
                mySeg.tableViewController = self
            }else if sender is IndexPath {
                let nav = segue.destination as! UINavigationController
                let mySeg = nav.topViewController as! ViewController
                mySeg.delegate = self
                let indexPath = sender as! IndexPath
                let item = items[indexPath.row]
                mySeg.myTxt = [item.text!]
                mySeg.indexPath = indexPath
            }
        }
    
    func fetchAllItems(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "BucketListItem")
        do{
            let result = try managedObjectContext.fetch(request)
             items = result as! [BucketListItem]
        } catch{
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue", sender: indexPath.row )
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        managedObjectContext.delete(item)
        
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row].text!

        return cell
    }
    

}
