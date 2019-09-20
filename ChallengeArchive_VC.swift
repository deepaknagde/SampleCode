//
//  ChallengeArchive_VC.swift
//  stepJockey
//
//  Created by Apple on 27/06/19.
//  Copyright © 2019 com.apple. All rights reserved.
//

import UIKit

class ChallengeArchive_VC: UIViewController, UITableViewDataSource, UITableViewDelegate, businessLogicLayerDelegate {

    @IBOutlet weak var Tbl_challengeArchive : UITableView!

    let HalperBL: businessLogicLayer = businessLogicLayer()
    
    var Json_Array = NSArray()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /**************************************************************************/
    //MARK:-  Api Call :- v3/users/id/archive-challenges {GetArchiveChallenges}
    /**************************************************************************/
    
    func GetArchiveChallenges_InvokeAPI() {
        let reachability = Reachability()!
        if !reachability.isReachable
        {
            Toast.show(message: "No internet available.", controller: self)
        } else {
            
            showActivityIndicator(uiView: self.view)
            HalperBL.GetArchiveChallengesAPICall()
            
            return
        }
    }
    
    func GetArchiveChallengesAPICallFinished(_ dict : NSDictionary) {
        hideActivityIndicator(uiView: self.view)
        
        if let myValue : NSArray = dict.value(forKey: "data") as? NSArray {
            
            Json_Array = myValue
        }
        
        Tbl_challengeArchive.reloadData()
    }
    
    func GetArchiveChallengesAPICallMessage(_ massge : String) {
        hideActivityIndicator(uiView: self.view)
        
        Toast.show(message: massge, controller: self)
    }
    
    func GetArchiveChallengesAPICallError(_ error: Error) {
        hideActivityIndicator(uiView: self.view)
        
        Toast.show(message: "Something went wrong. Please try again!", controller: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        HalperBL.delegate = self
        
        GetArchiveChallenges_InvokeAPI()
        
        Tbl_challengeArchive.reloadData()
    }
    
    /******************************************************/
    //MARK:- Table view
    /******************************************************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 150
        } else {
            return 80
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 60
        } else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let view_header = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0, height:60 ))
            
            let lbl_header = UILabel(frame: CGRect(x: 14.0, y: 10.0, width: CurrentDevice.ScreenWidth-40, height:40 ))
            lbl_header.text = "Challenge Archive"
            lbl_header.textColor = #colorLiteral(red: 0.07843137255, green: 0.1058823529, blue: 0.1921568627, alpha: 1)
            lbl_header.font = UIFont(name: FontNameGotham, size: 26)
            view_header.addSubview(lbl_header)
            
            view_header.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9843137255, alpha: 1)

            return view_header
            
        } else {
            let view_header = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 0.0, height:20.0 ))
            view_header.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.968627451, blue: 0.9843137255, alpha: 1)
            
            return view_header
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return Json_Array.count
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeArchive_TVC", for: indexPath) as! ChallengeArchive_TVC
            
            let loacDict :NSDictionary = Json_Array.object(at: indexPath.row) as! NSDictionary
            
            cell.Lbl_Title.text = loacDict.GotValue(key: "Name") as String
            cell.Lbl_SubTitle.text = "Completed on"
            cell.Lbl_Info1.text = "\(OnlyDF().string(from: UTCBig_DF().date(from: "\((loacDict.GotValue(key: "EndDate") as String).split(separator: "T")[0])")!))"
            
            cell.Img_Info.sd_setShowActivityIndicatorView(true)
            cell.Img_Info.sd_setIndicatorStyle(.gray)
            cell.Img_Info?.sd_setImage(with: NSURL(string:(ImgPath + (loacDict.GotValue(key: "CssClassName") as String) + "/icon.png") )! as URL) { (image, error, cache, urls) in
                if (error != nil) {
                    cell.Img_Info.image = UIImage(named: "default")
                } else {
                    cell.Img_Info.image = image
                }
            }
            
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "Chanllanges_lastCell_TVCell", for: indexPath) as! Chanllanges_lastCell_TVCell
            
            cell.Btn_Info.tag = indexPath.row
            cell.Btn_Info.addTarget(self, action: #selector(ShowInfoAlert), for: .touchUpInside)
            
            return cell
        }
    }
    
    
    @objc func ShowInfoAlert() {
        
        showAlertViewWithOK(vc: self, titleString: "", messageString: "Play fairly - no cheating!\n\nAll stair climbs completed through the app are monitored and our sophisticated cheating algorithm will automatically red flag any unusual climbs. Offenders will be reported and erroneous climbs will be deleted.\n\nWe do this to ensure the integrity of the challenge and make sure that those who decide to cheat don't have an opportunity to win prizes.\n\nTo take part fairly, simply scan the signs at the start and end of your journey. Step up, improve your health and enjoy the challenge!")
    }
    
    /******************************************************/
    //MARK:- Actions
    /******************************************************/
    
    @IBAction func action_BackBTN(_ sender : UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

class Chanllanges_lastCell_TVCell: UITableViewCell {
    @IBOutlet weak var Lbl_Title : UILabel!
    @IBOutlet weak var Btn_Info : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        Lbl_Title.font = UIFont(name: FontNameGothamBold, size: 13)
    }
}
