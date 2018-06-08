//
//  Update2ViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 05/06/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit
import CoreData

class Update2ViewController: UIViewController {
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var Team1Image: UIImageView!
@IBOutlet weak var Team2Image: UIImageView!
@IBOutlet weak var DateandTime: UILabel!
@IBOutlet weak var Venue: UILabel!
@IBOutlet weak var Done: UIButton!
@IBOutlet weak var Team1: UILabel!
@IBOutlet weak var Team2: UILabel!
var RegisteredFixtures = NSArray()
    
// Function to create Container
func GetContext()-> NSManagedObjectContext
{
return Delegate.persistentContainer.viewContext
}
    
// Function to Update Fixture
func UpdateData()
{
let Context = GetContext()
let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fixtures")
do
{
RegisteredFixtures = try Context.fetch(FetchRequest)  as NSArray
if(RegisteredFixtures.count >= 1)
{
let Update = RegisteredFixtures.firstObject as! Fixtures
Update.setValue(Team1.text, forKey: "team1")
Update.setValue(Team2.text, forKey: "team2")
let Image1 = UIImagePNGRepresentation(Team1Image.image!)! as NSData
let Image2 = UIImagePNGRepresentation(Team2Image.image!)! as NSData
Update.setValue(Image1, forKey: "team1icon")
Update.setValue(Image2, forKey: "team2icon")
Update.setValue(Venue.text, forKey: "venue")
Update.setValue(DateandTime.text, forKey: "dateandtime")
do
{
try Context.save()
}
}
}
catch
{
print("Update Failed")
}
}
    
// Function to Update
@IBAction func Done(_ sender: Any) {
UpdateData()
    
//STeam1[MainIndex] = Team1.text!
//STeam2[MainIndex] = Team2.text!
//SVenue[MainIndex] = Venue.text!
//SDateandTime[MainIndex] = DateandTime.text!
Alert(Title: "Success", Message: "Updated Fixture Successfully")
performSegue(withIdentifier: "Segue10", sender: self)
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
//FetchData()

Team1.text = Delegate.UTeam1
Team2.text = Delegate.UTeam2
Venue.text = Delegate.Uvenue
DateandTime.text = Delegate.UDateandTime
Team1Image.image = TeamIcons[Value1]
Team2Image.image = TeamIcons[Value2]
// Design for UI Outlets
Done.layer.cornerRadius = 50.0
Team1Image.layer.cornerRadius = 50.0
Team1Image.layer.borderWidth = 3.0
Team1Image.layer.borderColor = UIColor.white.cgColor
Team1Image.layer.masksToBounds = false
Team1Image.clipsToBounds = true
Team2Image.layer.cornerRadius = 50.0
Team2Image.layer.borderWidth = 3.0
Team2Image.layer.borderColor = UIColor.white.cgColor
Team2Image.layer.masksToBounds = false
Team2Image.clipsToBounds = true


        
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
