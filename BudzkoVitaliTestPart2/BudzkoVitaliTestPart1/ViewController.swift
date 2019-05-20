//
//  ViewController.swift
//  BudzkoVitaliTestPart2
//
//  Created by Sasha Dubikovskaya on 20.05.2019.
//  Copyright © 2019 BudzkoVitaliTestPart2. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var text: UITextField!
    
    var isTapped = false
    
    var numberArray = [UInt]()
    
    @IBOutlet weak var table: UITableView!

    @IBAction func button(_ sender: Any) {
        
        numberArray = [UInt]()
        
        if text.text != "" {
            if let x = UInt(text.text!) {
                label.isHidden = true
                for i in 0...Int32(x) {
                    if i % 2 == 1 {
                        numberArray.append(UInt(i))
                    }
                }
            } else {
                label.isHidden = false
                label.text = "Please, write correct number."
            }
        }
        isTapped = true
        table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if isTapped {
        cell.textLabel?.text = String(numberArray[indexPath.row] * numberArray[indexPath.row])
        } else {
            cell.textLabel?.text = ""
        }
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

