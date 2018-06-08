//
//  AddIconViewController.swift
//  FIFA 18
//
//  Created by Macho Man on 29/05/18.
//  Copyright © 2018 siddharth. All rights reserved.
//

import UIKit

class AddIconViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
let Delegate = UIApplication.shared.delegate as! AppDelegate
@IBOutlet weak var ImageView: UIImageView!
@IBOutlet weak var AddIcon: UIButton!
@IBOutlet weak var TeamName: UILabel!
let ImagePicker = UIImagePickerController()


// ImagePicker Functions
func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
let Image = info[UIImagePickerControllerOriginalImage]
ImageView.image = Image as? UIImage
picker.dismiss(animated: true, completion: nil)
}

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
picker.dismiss(animated: true, completion: nil)
}
    

@IBAction func Save(_ sender: Any) {
if(ImageView.image == UIImage(named: "WorldCup"))
{
Alert(Title: "Team Icon not added", Message: "Add Icon")
}
if(ImageView.image != UIImage(named: "WorldCup"))
{
Alert(Title: "Changes Saved", Message: "Team Icon added")
TeamIcons[MyIndex1] = ImageView.image!

}
}
    
    
    
    

    
// Button Action to Add Team Icon
@IBAction func AddIcon(_ sender: Any) {
ActionSheet()
}
    
// Function to produce ActionSheet for Add Icon Button
func ActionSheet()
{
let ActionSheet = UIAlertController(title: "Photo Source", message: "Choose a Photo Source", preferredStyle: .actionSheet)
ActionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
if(UIImagePickerController.isSourceTypeAvailable(.camera))
{
self.ImagePicker.sourceType = .camera
self.present(self.ImagePicker, animated: true , completion: nil)
}
else
{
print("Camera not Available")
}
}))
ActionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action) in
self.ImagePicker.sourceType = .photoLibrary
self.present(self.ImagePicker, animated: true , completion: nil)
}))
ActionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
}))
self.present(ActionSheet, animated: true , completion: nil)
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
ImageView.image = UIImage(named: "WorldCup")
ImagePicker.delegate = self
TeamName.text = Delegate.TeamName
//Design for Team Icon
ImageView.layer.borderWidth = 3.0
ImageView.layer.borderColor = UIColor.white.cgColor
ImageView.layer.cornerRadius = 100.0
ImageView.clipsToBounds = false
ImageView.layer.masksToBounds = true
    
//Design for Add Icon Button
AddIcon.layer.cornerRadius = 5.0
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
