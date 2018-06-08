//
//  Specific1ViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class Specific1ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
let Delegate =  UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var TableView: UITableView!
    
// TableView Functions
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return S1Team1.count
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let Cell = tableView.dequeueReusableCell(withIdentifier: "Cell3", for: indexPath) as! Custom3TableViewCell
Cell.ImageView1.image = S1Team1Icon[indexPath.row]
Cell.ImageView2.image = S1Team2Icon[indexPath.row]
Cell.Venue.text = S1Venue[indexPath.row]
Cell.DateandTime.text = S1DateandTime[indexPath.row]
Cell.MatchNumber.text = String(indexPath.row + 1)
Cell.Team1.text = S1Team1[indexPath.row]
Cell.Team2.text = S1Team2[indexPath.row]
return Cell
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
return 250.0
}
    
override func viewWillAppear(_ animated: Bool) {
TableView.reloadData()
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
UIView.animate(withDuration: 1.75, delay: Double(DelayCounter)*0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations:
    {
cell.transform = CGAffineTransform.identity
}, completion: nil)
DelayCounter += 1
}
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
