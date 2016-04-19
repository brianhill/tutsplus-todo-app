//
//  AddItemViewController.swift
//  ToDo
//
//  Created by Brian Hill on 4/19/16 by following these tutorials:
//  http://code.tutsplus.com/tutorials/swift-from-scratch-inheritance-and-protocols--cms-23334
//  http://code.tutsplus.com/tutorials/swift-from-scratch-delegation-and-properties--cms-23445
//

import UIKit


protocol AddItemViewControllerDelegate {
    func controller(controller: AddItemViewController, didAddItem: String)
}

class AddItemViewController: UIViewController {
    
    var delegate: AddItemViewControllerDelegate?
    
    @IBOutlet var textField: UITextField!
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func create(sender: UIButton) {
        let item = textField.text
        delegate!.controller(self, didAddItem: item!)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
