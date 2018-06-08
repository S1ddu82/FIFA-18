//
//  AddFixtureViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit
import CoreData

class AddFixtureViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UIToolbarDelegate,UITextFieldDelegate {
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var ImageView1: UIImageView!
@IBOutlet weak var ImageView2: UIImageView!
@IBOutlet weak var Team1: UILabel!
@IBOutlet weak var Team2: UILabel!
@IBOutlet weak var Venue: UITextField!
@IBOutlet weak var DateandTime: UITextField!
@IBOutlet weak var AddFixture: UIButton!
@IBOutlet weak var ViewFixtures: UIButton!
var RegisteredFixtures : [NSManagedObject] = []
var PickerView = UIPickerView()
var DatePickerView = UIDatePicker()

    

    
@IBAction func datandTime(_ sender: UITextField) {
DatePickerView.datePickerMode = UIDatePickerMode.dateAndTime
sender.inputView = DatePickerView
    DatePickerView.addTarget(self, action: #selector(AddFixtureViewController.datePickerValueChanged), for: UIControlEvents.valueChanged)
}
    
@objc func datePickerValueChanged(sender:UIDatePicker) {
let dateFormatter = DateFormatter()
dateFormatter.dateStyle = DateFormatter.Style.medium
dateFormatter.timeStyle = DateFormatter.Style.medium
DateandTime.text = dateFormatter.string(from: sender.date)
}
    
    
    
func numberOfComponents(in pickerView: UIPickerView) -> Int {
return 1
}
    
func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
return Venues.count
}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
return Venues[row]
}
    
func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
Venue.text = Venues[row]

}

// Function to Create Done Button in Picker View
func ToolBar()
{
let ToolBar = UIToolbar()
ToolBar.delegate = self
ToolBar.sizeToFit()
let DoneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(AddFixtureViewController.DismissPickerView))
ToolBar.setItems([DoneButton], animated: false)
ToolBar.isUserInteractionEnabled = true
Venue.inputAccessoryView = ToolBar
DateandTime.inputAccessoryView = ToolBar
}
    
// Function to Dismiss PickerView
    @objc func DismissPickerView()
{
view.endEditing(true)
}
    
// Function to Produce Alert Box
func Alert( Title: String, Message: String)
{
let Alert = UIAlertController(title: Title, message: Message, preferredStyle: .alert)
Alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
}))
self.present(Alert,animated: true, completion: nil)
}
    
func GetContext() -> NSManagedObjectContext
{
return Delegate.persistentContainer.viewContext
}
// Function to Save Data
func SaveData()
{
let Context = GetContext()
let Entity = NSEntityDescription.entity(forEntityName: "Fixtures", in: Context)
let NewFixture = NSManagedObject(entity: Entity!, insertInto: Context)
NewFixture.setValue(Team1.text!, forKey: "team1")
NewFixture.setValue(Team2.text!, forKey: "team2")
NewFixture.setValue(Venue.text!, forKey: "venue")
NewFixture.setValue(DateandTime.text!, forKey: "dateandtime")
let Image1 = UIImagePNGRepresentation(ImageView1.image!)! as NSData
let Image2 = UIImagePNGRepresentation(ImageView2.image!)! as NSData
NewFixture.setValue(Image1, forKey: "team1icon")
NewFixture.setValue(Image2, forKey: "team2icon")
do
{
try Context.save()
print(NewFixture)
}
catch
{
print("Error Saving Data")
}
}
    
func FetchData()
{
let Context = GetContext()
let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fixtures")
do
{
RegisteredFixtures = try Context.fetch(FetchRequest) as! [NSManagedObject]
}
catch
{
print("Failed to Fetch Data")
}
}
    
// Function to Add Fixture
@IBAction func AddFixture(_ sender: Any) {
if(Team1.text != "" && Team2.text != "" && ImageView1.image != nil && ImageView2.image != nil && Venue.text != "" && DateandTime.text != "")
{
Alert(Title: "Done", Message: "Fixture has been added")

SaveData()

//STeam1.append(Team1.text!)
//STeam2.append(Team2.text!)
//STeam1Icon.append(ImageView1.image!)
//STeam2Icon.append(ImageView2.image!)
//SVenue.append(Venue.text!)
//SDateandTime.append(DateandTime.text!)
}
if(Team1.text == "" && Team2.text == "" && ImageView1.image == nil && ImageView2.image == nil && Venue.text == "" && DateandTime.text == "")
{
Alert(Title: "Alert", Message: "Please fill in the required credentials")
}
}
    
// Function to move to next View Controller
@IBAction func ViewFixtures(_ sender: Any) {
FetchData()
//if(SVenue.count == 0)
//{
//Alert(Title: "Alert", Message: "No Fixtures added")
//}
//if(SVenue.count != 0 && SDateandTime.count != 0)
//{
//performSegue(withIdentifier: "Segue5", sender: self)
//}
    
if(RegisteredFixtures.count == 0)
{
Alert(Title: "Alert", Message: "No Fixtures added")
}
if(RegisteredFixtures.count != 0)
{
performSegue(withIdentifier: "Segue5", sender: self)
}
}


    
    
override func viewDidLoad() {
Venue.delegate = self
DateandTime.delegate = self
ToolBar()
// Connecting PickerView to Delegate and DataSource
PickerView.delegate = self
PickerView.dataSource = self
Venue.inputView = PickerView
Venue.textAlignment = .center
DateandTime.inputView = DatePickerView
DateandTime.textAlignment = .center

Team1.text = Delegate.Team1
Team2.text = Delegate.Team2
ImageView1.image = TeamIcons[MyIndex2]
ImageView2.image = TeamIcons[MyIndex3]

//Design for UI Outlets
ImageView1.layer.borderWidth = 5.0
ImageView1.layer.borderColor = UIColor.white.cgColor
ImageView1.layer.cornerRadius = 50.0
ImageView1.clipsToBounds = false
ImageView1.layer.masksToBounds = true
ImageView2.layer.borderWidth = 5.0
ImageView2.layer.borderColor = UIColor.white.cgColor
ImageView2.layer.cornerRadius = 50.0
ImageView2.clipsToBounds = false
ImageView2.layer.masksToBounds = true
AddFixture.layer.cornerRadius = 5.0
ViewFixtures.layer.cornerRadius = 5.0
    
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
