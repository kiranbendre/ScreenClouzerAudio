//
//  ViewController.swift
//  ScreenClouzer
//
//  Created by Iphone XR on 12/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcomeLabel:UILabel!
    @IBOutlet weak var phonenoTF:UITextField!
    @IBOutlet weak var typecallTF:UITextField!
    @IBOutlet weak var noteTF:UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var dropdownBtn: UIButton!
    @IBOutlet weak var logoIMG: UIImageView!
    @IBOutlet weak var clouzerTableview: UITableView!
    
    var dataArray = ["Audio","Video"]
    var selectedindex = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .iphoneBackColor1
        self.clouzerTableview.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        phontUI()
        typecallUI()
        noteUI()
        dropdownUI()
        tableviewUI()
    }
    func phontUI(){
        phonenoTF.attributedPlaceholder = NSAttributedString(string: "Enter your phonenumber", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
        phonenoTF.font = UIFont.systemFont(ofSize: 15)
        phonenoTF.textColor = .white
        phonenoTF.backgroundColor = .clear
        phonenoTF.borderStyle = UITextField.BorderStyle.roundedRect
        phonenoTF.layer.borderColor = UIColor.gray.cgColor;
        phonenoTF.layer.borderWidth = 1.0
        phonenoTF.layer.masksToBounds = true
        phonenoTF.layer.cornerRadius = 15.0
    }
    func typecallUI(){
        typecallTF.attributedPlaceholder = NSAttributedString(string: "Enter your typecall", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
        typecallTF.font = UIFont.systemFont(ofSize: 15)
        typecallTF.textColor = .white
        typecallTF.backgroundColor = .clear
        typecallTF.borderStyle = UITextField.BorderStyle.roundedRect
        typecallTF.layer.borderColor = UIColor.gray.cgColor;
        typecallTF.layer.borderWidth = 1.0
        typecallTF.layer.masksToBounds = true
        typecallTF.layer.cornerRadius = 15.0
    }
    func noteUI(){
        noteTF.attributedPlaceholder = NSAttributedString(string: "Enter your note", attributes:[NSAttributedString.Key.foregroundColor: UIColor.gray])
        noteTF.font = UIFont.systemFont(ofSize: 15)
        noteTF.textColor = .white
        noteTF.backgroundColor = .clear
        noteTF.borderStyle = UITextField.BorderStyle.roundedRect
        noteTF.layer.borderColor = UIColor.gray.cgColor;
        noteTF.layer.borderWidth = 1.0
        noteTF.layer.masksToBounds = true
        noteTF.layer.cornerRadius = 15.0
    }
    func dropdownUI(){
        dropdownBtn.backgroundColor = .clear
        dropdownBtn.tintColor = .white
        
    }
    func tableviewUI(){
            clouzerTableview.layer.masksToBounds = false
            clouzerTableview.layer.shadowOffset = CGSize(width: 0, height: 2)
            clouzerTableview.layer.shadowColor = UIColor.black.cgColor
            clouzerTableview.layer.shadowOpacity = 0.5
            clouzerTableview.layer.shadowRadius = 1
            clouzerTableview.layer.cornerRadius = 15
            clouzerTableview.backgroundColor = .clear
            clouzerTableview.isHidden = true
    }
    @IBAction func dropdownAction(_ sender: UIButton){
        print("dropdown btn click")
        if selectedindex == 0 {
              clouzerTableview.isHidden = true
               //self.selectedindex = 1
           }
           else{
              clouzerTableview.isHidden = false
               //self.selectedindex = 0
           }
    }

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = clouzerTableview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)as!  TableViewCell
        typecallTF.text = dataArray[indexPath.row]
        clouzerTableview.isHidden = true
    }
    
}
extension ViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
extension UIColor
{
    func colorFromHexString (_ hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    static var iphoneBackColor1 :UIColor {
        return UIColor().colorFromHexString("#232742")
    }
}
