//
//  HomeViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit
import CoreData

var Teams = ["Egypt","Morocco","Nigeria","Senegal","Tunisia","Australia","IR Iran","Japan","Korea Republic","Saudi Arabia","Belgium","Croatia","Denmark","England","France","Germany","Iceland","Poland","Portugal","Russia","Serbia","Spain","Sweden","Switzerland","Costa Rica","Mexico","Panama","Argentina","Brazil","Colombia","Peru","Uruguay"]
var Venues = ["Luzhniki Stadium","Otkritie Arena","Krestovsky Stadium","Fisht Olympic Stadium","Cosmos Arena","Kazan Arena","Rostov Arena","Volgograd Arena","Nizhny Novgorod Stadium","Mordovia Arena","Central Stadium","Kaliningrad Stadium"]
var TeamIcons = [#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup"),#imageLiteral(resourceName: "WorldCup")]
var MyIndex1 : Int = 0
var MyIndex2 : Int = 0
var MyIndex3 : Int = 0
var MainIndex : Int = 0
var STeam1 = [String]()
var S1Team1 = [String]()
var S2Team1 = [String]()
var STeam2 = [String]()
var S1Team2 = [String]()
var S2Team2 = [String]()
var STeam1Icon = [UIImage]()
var S1Team1Icon = [UIImage]()
var S2Team1Icon = [UIImage]()
var STeam2Icon = [UIImage]()
var S1Team2Icon = [UIImage]()
var S2Team2Icon = [UIImage]()
var SVenue = [String]()
var S1Venue = [String]()
var S2Venue = [String]()
var SDateandTime = [String]()
var S1DateandTime = [String]()
var S2DateandTime = [String]()
var Value1 : Int = 0
var Value2 : Int = 0
var RegisteredFixtures : [NSManagedObject] = []
class HomeViewController: UIViewController {
var I : Int = 1
var Check : Int = 0
@IBOutlet weak var AddFixtures: UIButton!
@IBOutlet weak var AddTeamIcons: UIButton!
@IBOutlet weak var ViewFixtures: UIButton!
    
// Function to create Container
func GetContext()-> NSManagedObjectContext
{
let Delegate = UIApplication.shared.delegate as! AppDelegate
return Delegate.persistentContainer.viewContext
}
 
// Function to fetch Data
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
print("Failed to fetch Data")
}
}
    

    
// Function to Check if all Team Icons have been Added
@IBAction func SetFixtures(_ sender: Any) {
if(Check == 0)
{
performSegue(withIdentifier: "Segue2", sender: self)
}
}
// Function to View Fixtures
@IBAction func ViewFixture(_ sender: Any) {
FetchData()
if(RegisteredFixtures.count == 0)
{
Alert(Title: "Alert", Message: "No Fixtures added")
}
if(RegisteredFixtures.count != 0)
{
performSegue(withIdentifier: "Segue11", sender: self)
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
FetchData()
// Design for UI Outlets
AddFixtures.layer.cornerRadius = 5.0
AddTeamIcons.layer.cornerRadius = 5.0
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
