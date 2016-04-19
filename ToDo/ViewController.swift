//
//  ViewController.swift
//  ToDo
//
//  Created by Brian Hill on 4/19/16 by following these tutorials:
//  http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
//  http://code.tutsplus.com/tutorials/swift-from-scratch-delegation-and-properties--cms-23445
//  http://code.tutsplus.com/tutorials/swift-from-scratch-access-control-and-property-observers--cms-23487
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
    var doneItems: [String] = ["Buy Milk"]
    
    // Set self as the delegate of the AddItemViewController that is about to come on-screen.

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddItemSegue" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let addItemViewController = navigationController.topViewController as! AddItemViewController
            addItemViewController.delegate = self
        }
    }
    
    // AddItemViewControllerDelegate 
    
    func controller(controller: AddItemViewController, didAddItem newItem: String) {

        self.dismissViewControllerAnimated(true, completion: nil)
        items.append(newItem)
        tableView.beginUpdates()
        let indexPath: NSIndexPath = NSIndexPath(forRow:items.count - 1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
        tableView.endUpdates()
    }
    
    // UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        let item = items[row]
        let tableViewCell = tableView.dequeueReusableCellWithIdentifier("PlainTableViewCell")!
        tableViewCell.textLabel?.text = item
        tableViewCell.accessoryType = doneItems.contains(item) ? .Checkmark : .None
        return tableViewCell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if .Delete == editingStyle {
            let removedItem = items.removeAtIndex(indexPath.row)
            let removedItemIndex = doneItems.indexOf(removedItem)
            if (removedItemIndex != nil) {
                doneItems.removeAtIndex(removedItemIndex!)
            }
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Right)
        }
    }
    
    // UITableViewDelegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let row = indexPath.row
        let item = items[row]
        let tableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        let index = doneItems.indexOf(item)
        if index != nil {
            // User is toggling the item into the not-done state
            doneItems.removeAtIndex(index!)
            tableViewCell.accessoryType = .None
        } else {
            // User is toggling the item into the done state
            doneItems.append(item)
            tableViewCell.accessoryType = .Checkmark
        }
    }
    
    // The registerClass magic that the tutorial author put in viewDidLoad() has been moved into the storyboard.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "To Do"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
