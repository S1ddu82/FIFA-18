//
//  SetFixtureViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class SetFixtureViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIToolbarDelegate {
@IBOutlet weak var Team1Icon: UIImageView!
@IBOutlet weak var Team2Icon: UIImageView!
@IBOutlet weak var Team1: UITextField!
@IBOutlet weak var Team2: UITextField!
@IBOutlet weak var Venue: UITextField!
@IBOutlet weak var DateandTime: UITextField!
@IBOutlet weak var AddFixture: UIButton!
var PickerView = UIPickerView()

    
// PickerView Functions
func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1
}
    
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
return Teams.count
}

    
func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
return Teams[row]
}
    
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
Team1.text = Teams[row]


}

//Function to add Done Button to PickerView
func ToolBar()
{
let ToolBar = UIToolbar()
ToolBar.delegate = self
ToolBar.sizeToFit()
let DoneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(SetFixtureViewController.DismissPickerView))
ToolBar.setItems([DoneButton], animated: false)
ToolBar.isUserInteractionEnabled = true
Team1.inputAccessoryView = ToolBar
}

@objc func DismissPickerView()
{
view.endEditing(true)
}



    


    
// Function to Add Fixtures
@IBAction func AddFixture(_ sender: Any) {
    }
    
override func viewDidLoad() {
ToolBar()
//Connecting PickerView to Delegate and DataSource
PickerView.delegate = self
PickerView.dataSource = self
Team1.inputView = PickerView



    
// Design for UI Outlets
Team1Icon.layer.cornerRadius = 35.0
Team1Icon.layer.borderWidth = 3.0
Team1Icon.layer.borderColor = UIColor.white.cgColor
Team1Icon.clipsToBounds = false
Team1Icon.layer.masksToBounds = true
Team2Icon.layer.cornerRadius = 35.0
Team2Icon.layer.borderWidth = 3.0
Team2Icon.layer.borderColor = UIColor.white.cgColor
Team2Icon.clipsToBounds = false
Team2Icon.layer.masksToBounds = true
AddFixture.layer.cornerRadius = 5.0
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
