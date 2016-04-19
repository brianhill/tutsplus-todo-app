//
//  ViewController.swift
//  ToDo
//
//  Created by Brian Hill on 4/19/16 by following this tutorial:
//  http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    
    var items: [String] = ["Buy Milk", "Finish Tutorial", "Play Minecraft"]
    
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
