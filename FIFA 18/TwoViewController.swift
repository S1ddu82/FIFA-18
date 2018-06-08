//
//  TwoViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class TwoViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UIToolbarDelegate {
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var ImageView: UIImageView!
@IBOutlet weak var TeamName: UITextField!
@IBOutlet weak var Next: UIButton!
var PickerView = UIPickerView()
    
//PickerView Functions
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
TeamName.text = Teams[row]
Delegate.Team2 = TeamName.text
ImageView.image = TeamIcons[row]
MyIndex3 = row
}
 
// Function to Create Done Button in Picker View
func ToolBar()
{
let ToolBar = UIToolbar()
ToolBar.delegate = self
ToolBar.sizeToFit()
let DoneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(TwoViewController.DismissPickerView))
ToolBar.setItems([DoneButton], animated: false)
ToolBar.isUserInteractionEnabled = true
TeamName.inputAccessoryView = ToolBar
}

// Function to Dismiss PickerView
@objc func DismissPickerView()
{
view.endEditing(true)
}
    
// Button Action to go to the next View Controller
@IBAction func Next(_ sender: Any) {
if(Delegate.Team == TeamName.text)
{
Alert(Title: "Alert", Message: "Choose a different Team")
}
if(Delegate.Team != TeamName.text )
{
performSegue(withIdentifier: "Segue4", sender: self)
}
if(TeamName.text == "")
{
Alert(Title: "Alert", Message: "Please select a Team")
}
}
    
// Function to Produce Alert Box
func Alert( Title: String, Message: String)
{
let Alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
}))
self.present(Alert,animated: true, completion: nil)
}
    
override func viewDidLoad() {
ToolBar()
// Connecting PickerView to Delegate and Datasource
TeamName.inputView = PickerView
TeamName.textAlignment = .center
PickerView.delegate = self
PickerView.dataSource = self
// Design for UI Outlets
ImageView.layer.borderWidth = 3.0
ImageView.layer.borderColor = UIColor.white.cgColor
ImageView.layer.cornerRadius = 100.0
ImageView.clipsToBounds = false
ImageView.layer.masksToBounds = true
Next.layer.cornerRadius = 5.0
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
