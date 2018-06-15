//
//  Update1ViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 05/06/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit
import CoreData

class Update1ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource ,UIToolbarDelegate,UITextFieldDelegate{
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var Team1: UITextField!
@IBOutlet weak var Team2: UITextField!
@IBOutlet weak var Venue: UITextField!
@IBOutlet weak var DateandTime: UITextField!
@IBOutlet weak var Next: UIButton!
var PickerView = UIPickerView()
var DatePickerView = UIDatePicker()
var TapGesture1 = UITapGestureRecognizer()
var TapGesture2 = UITapGestureRecognizer()
var TapGesture3 = UITapGestureRecognizer()
var T1 :Int = 0
var T2 : Int = 0
var Ven : Int = 0
var RegisteredFixtures = NSArray()


@objc func Tap1(){
T1 = 1
T2 = 0
Ven = 0
}
@objc func Tap2(){
T1 = 0
T2 = 1
Ven = 0
}
@objc func Tap3(){
T1 = 0
T2 = 0
Ven = 1
}
    


  

    
// PickerView Functions
func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1
}
    
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
if(T1 == 1)
{
return Teams.count
}
else if(T2 == 1)
{
return Teams.count
}
else if(Ven == 1)
{
return Venues.count
}
return 0
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
if(T1 == 1)
{
return Teams[row]
}
else if(T2 == 1)
{
return Teams[row]
}
else if(Ven == 1)
{
return Venues[row]
}
return nil
}
    
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
if(T1 == 1)
{
Team1.text = Teams[row]
Value1 = row
}
else if(T2 == 1)
{
Team2.text = Teams[row]
Value2 = row
}
else if(Ven == 1)
{
Venue.text = Venues[row]
}

}
    
//Date Picekr Functions
@IBAction func DatePicker(_ sender: UITextField){
DatePickerView.datePickerMode = UIDatePickerMode.dateAndTime
sender.inputView = DatePickerView
DatePickerView.addTarget(self, action: #selector(Update1ViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
}
    
@objc func datePickerValueChanged(sender:UIDatePicker) {
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = DateFormatter.Style.medium
dateFormatter.timeStyle = DateFormatter.Style.medium
DateandTime.text = dateFormatter.string(from: sender.date)
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
Team1.inputAccessoryView = ToolBar
Team2.inputAccessoryView = ToolBar
Venue.inputAccessoryView = ToolBar
DateandTime.inputAccessoryView = ToolBar
}
    
// Function to Dismiss PickerView
@objc func DismissPickerView()
{
view.endEditing(true)
}
    
// Sending Values to next View Controller
@IBAction func Next(_ sender: Any) {
performSegue(withIdentifier: "Segue9", sender: self)
Delegate.UTeam1 = Team1.text
Delegate.UTeam2 = Team2.text
Delegate.Uvenue = Venue.text
Delegate.UDateandTime = DateandTime.text
}

// Function to Produce Alert Box
func Alert( Title: String, Message: String)
{
let Alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
}))
self.present(Alert,animated: true, completion: nil)
}
    
func GetContext()-> NSManagedObjectContext
{
return Delegate.persistentContainer.viewContext
}
    
func FetchData()
{
let Context = GetContext()
let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fixtures")
do
{
RegisteredFixtures = try Context.fetch(FetchRequest) as NSArray
}
catch
{
print("Failed to fetch Data")
}
}
    

    
    

override func viewDidLoad() {
//Tap Gesture Commands
TapGesture1 = UITapGestureRecognizer(target: self, action: #selector(Tap1))
TapGesture1.numberOfTapsRequired = 1
TapGesture1.numberOfTouchesRequired = 1
TapGesture2 = UITapGestureRecognizer(target: self, action: #selector(Tap2))
TapGesture2.numberOfTapsRequired = 1
TapGesture2.numberOfTouchesRequired = 1
TapGesture3 = UITapGestureRecognizer(target: self, action: #selector(Tap3))
TapGesture3.numberOfTapsRequired = 1
TapGesture3.numberOfTouchesRequired = 1
Team1.addGestureRecognizer(TapGesture1)
Team2.addGestureRecognizer(TapGesture2)
Venue.addGestureRecognizer(TapGesture3)
Team1.isUserInteractionEnabled = true
Team2.isUserInteractionEnabled = true
Venue.isUserInteractionEnabled = true

// Design for UI Outlets
Next.layer.cornerRadius = 5.0
ToolBar()
//Connecting PickerView to Delegate and Datasource
PickerView.delegate = self
PickerView.dataSource = self
//Providind PickerView to various TextFields
Team1.inputView = PickerView
Team2.inputView = PickerView
Venue.inputView = PickerView
DateandTime.inputView = PickerView

    
FetchData()
    

//Initial value of TextFields
let Update = RegisteredFixtures.firstObject as! Fixtures
Team1.text = Update.value(forKeyPath: "team1") as? String
Team2.text = Update.value(forKeyPath: "team2") as? String
Venue.text = Update.value(forKeyPath: "venue") as? String
DateandTime.text = Update.value(forKeyPath: "dateandtime") as? String
    
    
    
//Team1.text = STeam1[MainIndex]
//Team2.text = STeam2[MainIndex]
//Venue.text = SVenue[MainIndex]
//DateandTime.text = SDateandTime[MainIndex]
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
