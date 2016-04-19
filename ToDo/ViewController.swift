//
//  ViewController.swift
//  ToDo
//
//  Created by Brian Hill on 4/19/16 by following these tutorials:
//  http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
//  http://code.tutsplus.com/tutorials/swift-from-scratch-delegation-and-properties--cms-23445
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
    
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
        return tableViewCell
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
