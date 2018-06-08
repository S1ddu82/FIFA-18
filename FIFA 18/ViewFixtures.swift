//
//  ViewFixtureViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit
import CoreData

class ViewFixtureViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let Delegate = UIApplication.shared.delegate as! AppDelegate
var RegisteredFixtures : [NSManagedObject] = []
@IBOutlet weak var TableView: UITableView!
var Image1 = UIImage()
var Image2 = UIImage()


    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
print("!!!!!!!!!!!!!!")
print(RegisteredFixtures.count)
return RegisteredFixtures.count
//return SVenue.count
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell2", for: indexPath) as! Custom2TableViewCell
let Fixture = RegisteredFixtures[indexPath.row]
let Data1 = Fixture.value(forKeyPath: "team1icon") as! NSData
if(Data1 != nil)
{
print("Image 1 Absent")
}
let Data2 = Fixture.value(forKeyPath: "team2icon") as! NSData
if(Data2 != nil)
{
print("Image 2 Absent")
}
print("**********************Data1***************************")
print(Data1)
print("**********************Data2***************************")
print(Data2)
Image1 = UIImage(data: Data1 as Data)!
Image2 = UIImage(data: Data2 as Data)!
Cell.Team1.text = Fixture.value(forKeyPath: "team1") as? String
Cell.Team2.text = Fixture.value(forKeyPath: "team2") as? String
Cell.Venue.text = Fixture.value(forKeyPath: "venue") as? String
Cell.DateandTime.text = Fixture.value(forKeyPath: "dateandtime") as? String
Cell.Button1.setBackgroundImage(Image1, for: .normal)
Cell.Button2.setBackgroundImage(Image2, for: .normal)
    
//Cell.Button1.setBackgroundImage(STeam1Icon[indexPath.row], for: .normal)
//Cell.Button2.setBackgroundImage(STeam2Icon[indexPath.row], for: .normal)
//Cell.Team1.text = STeam1[indexPath.row]
//Cell.Team2.text = STeam2[indexPath.row]
//Cell.Venue.text = SVenue[indexPath.row]
//Cell.DateandTime.text = SDateandTime[indexPath.row]
Cell.MatchNumber.text = String(indexPath.row + 1)
return Cell
}
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
return 250.0
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
MainIndex = indexPath.row
print("Didselect",MainIndex)
performSegue(withIdentifier: "Segue8", sender: self)
}
    
func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//STeam1Icon.remove(at: indexPath.row)
//STeam2Icon.remove(at: indexPath.row)
//STeam1.remove(at: indexPath.row)
//STeam2.remove(at: indexPath.row)
//SVenue.remove(at: indexPath.row)
//SDateandTime.remove(at: indexPath.row)
let NoteEntity = "Fixtures"
let Context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
let Note = RegisteredFixtures[indexPath.row]
if editingStyle == .delete {
Context.delete(Note)
do {
try Context.save()
} catch let error as NSError {
print("Error While Deleting Note: \(error.userInfo)")
    }
let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: NoteEntity)
do {
RegisteredFixtures = try Context.fetch(FetchRequest) as! [Fixtures]
} catch let error as NSError {
print("Error While Fetching Data From DB: \(error.userInfo)")
}
TableView.reloadData()
}
}
 
//To Check for Specific Team Fixtures 1
func Check1()
{
//for I in 0...STeam1.count-1{
for I in 0...RegisteredFixtures.count-1{
//if(STeam1[I] == Delegate.Image1 || STeam2[I] == Delegate.Image1)
let GTeam1 = RegisteredFixtures[I].value(forKeyPath: "team1") as? String
let Gteam2 = RegisteredFixtures[I].value(forKeyPath: "team2") as? String

if(GTeam1 == Delegate.Image1 || Gteam2 == Delegate.Image1)
{
S1Team1.append((RegisteredFixtures[I].value(forKeyPath: "team1") as? String)!)
S1Team2.append((RegisteredFixtures[I].value(forKeyPath: "team2") as? String)!)
S1Venue.append((RegisteredFixtures[I].value(forKeyPath: "venue") as? String)!)
let Data1 = RegisteredFixtures[I].value(forKeyPath: "team1icon") as! NSData
let Data2 = RegisteredFixtures[I].value(forKey: "team2icon") as! NSData
let Image1 = UIImage(data: Data1 as Data)
let Image2 = UIImage(data: Data2 as Data)
S1Team1Icon.append(Image1!)
S1Team2Icon.append(Image2!)
S1DateandTime.append((RegisteredFixtures[I].value(forKeyPath: "dateandtime") as? String)!)

//S1Team1.append(STeam1[I])
//S1Team2.append(STeam2[I])
//S1Team1Icon.append(STeam1Icon[I])
//S1Team2Icon.append(STeam2Icon[I])
//S1Venue.append(SVenue[I])
//S1DateandTime.append(SDateandTime[I])
}
}
}

//To Check for Specific Team Fixtures 2
func Check2()
{
//for I in 0...STeam1.count-1{
for I in 0...RegisteredFixtures.count-1{
//if(STeam1[I] == Delegate.Image2 || STeam2[I] == Delegate.Image2)
let GTeam1 = RegisteredFixtures[I].value(forKeyPath: "team1") as? String
let Gteam2 = RegisteredFixtures[I].value(forKeyPath: "team2") as? String

if(GTeam1 == Delegate.Image2 || Gteam2 == Delegate.Image2)
{

S2Team1.append((RegisteredFixtures[I].value(forKeyPath: "team1") as? String)!)
S2Team2.append((RegisteredFixtures[I].value(forKeyPath: "team2") as? String)!)
S2Venue.append((RegisteredFixtures[I].value(forKeyPath: "venue") as? String)!)
let Data1 = RegisteredFixtures[I].value(forKeyPath: "team1icon") as! NSData
let Data2 = RegisteredFixtures[I].value(forKey: "team2icon") as! NSData
let Image1 = UIImage(data: Data1 as Data)
let Image2 = UIImage(data: Data2 as Data)
S2Team1Icon.append(Image1!)
S2Team2Icon.append(Image2!)
S2DateandTime.append((RegisteredFixtures[I].value(forKeyPath: "dateandtime") as? String)!)
    
//S2Team1.append(STeam1[I])
//S2Team2.append(STeam2[I])
//S2Team1Icon.append(STeam1Icon[I])
//S2Team2Icon.append(STeam2Icon[I])
//S2Venue.append(SVenue[I])
//S2DateandTime.append(SDateandTime[I])
}
}
}
    
// To call Specific Team Fixtures 1
@IBAction func Action1(_ sender: Any) {
print("Hello World")
Check1()
}

// To call Specific Team Fixtures 2
@IBAction func Action2(_ sender: Any) {
print("Hello World")
Check2()
}
// Function to create Container for DataSource
func GetContext()-> NSManagedObjectContext
{
return Delegate.persistentContainer.viewContext
}
    
// Function to Fetch Data
func FetchData()
{
let Context = GetContext()
let FetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Fixtures")
do
{
RegisteredFixtures = try Context.fetch(FetchRequest) as! [NSManagedObject]
print("*********************************")
print(RegisteredFixtures)
}
catch
{
print("Datacannot be retrieved")
}
}
    
    
override func viewWillAppear(_ animated: Bool) {
S1Team1.removeAll()
S1Team2.removeAll()
S1Team1Icon.removeAll()
S1Team2Icon.removeAll()
S1Venue.removeAll()
S1DateandTime.removeAll()
S2Team1.removeAll()
S2Team2.removeAll()
S2Team1Icon.removeAll()
S2Team2Icon.removeAll()
S2Venue.removeAll()
S2DateandTime.removeAll()
TableView.reloadData()
AnimateTable()
}
    
// Function to Animate Table
func AnimateTable()
{
TableView.reloadData()
let cells = TableView.visibleCells
let TableViewHeight = TableView.bounds.size.height
for cell in cells{
cell.transform = CGAffineTransform(translationX: 0, y: TableViewHeight)
}
var DelayCounter = 0
for cell in cells{
UIView.animate(withDuration: 1.75, delay: Double(DelayCounter)*0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
cell.transform = CGAffineTransform.identity
}, completion: nil)
DelayCounter += 1
}
}
    
override func viewDidLoad() {
FetchData()
    




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
