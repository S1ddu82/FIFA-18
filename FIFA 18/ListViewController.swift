//
//  ListViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var TableView: UITableView!

//TableView Functions
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return Teams.count
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Custom1TableViewCell
cell.TeamName.text = Teams[indexPath.row]
if(TeamIcons.count == 0)
{
cell.ImageView.image = TeamIcons[indexPath.row]
}
if(TeamIcons.count != 0)
{
cell.ImageView.image = TeamIcons[indexPath.row]
}
return cell
}
    
func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return 130.0
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
MyIndex1 = indexPath.row
Delegate.TeamName = Teams[MyIndex1]
performSegue(withIdentifier: "Segue1", sender: self)
}

override func viewDidAppear(_ animated: Bool) {
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
TableView.reloadData()
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
