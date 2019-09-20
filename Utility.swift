//
//  Utility.swift
//  Noyo
//
//  Created by Retina on 06/08/18.
//  Copyright © 2018 Pavan. All rights reserved.
//

import Foundation
import UIKit

let APPDELEGATE = UIApplication.shared.delegate as! AppDelegate

// Color
let TopMenuBGColor = UIColor(red: 0.0/255.0, green: 144.0/255.0, blue: 254.0/255.0, alpha: 1.0)
//let TopMenuBGColor = UIColor(red: 253.0/255.0, green: 83.0/255.0, blue: 101.0/255.0, alpha: 1.0)
let BtnBGColor = UIColor(red: 253.0/255.0, green: 83.0/255.0, blue: 101.0/255.0, alpha: 1.0)
let PinkColor = UIColor(red: 253.0/255.0, green: 83.0/255.0, blue: 101.0/255.0, alpha: 1.0)
let appGreenColor = UIColor(red: 106.0/255.0, green: 123.0/255.0, blue: 64.0/255.0, alpha: 1.0)
let ScreenBGColor = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0)
let BTNRedColor = UIColor(red: 243.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0)

let Placeholder_Color = UIColor(red: 175.0/255.0, green: 175.0/255.0, blue: 194.0/255.0, alpha: 1.0) // afafc2

let LightWhite_Color = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)

//let apiKey = "KhOSpc4cf67AkbRpq1hkq5O3LPlwU9IAtILaL27EPMlYr27zipbNCsQaeXkSeK3R"

struct CurrentDevice {
    
    // iDevice detection code
    static let IS_IPAD               = UIDevice.current.userInterfaceIdiom == .pad
    static let IS_IPHONE             = UIDevice.current.userInterfaceIdiom == .phone
    static let IS_RETINA             = UIScreen.main.scale >= 2.0
    
    static let SCREEN_WIDTH          = Int(UIScreen.main.bounds.size.width)
    static let SCREEN_HEIGHT         = Int(UIScreen.main.bounds.size.height)
    static let SCREEN_MAX_LENGTH     = Int( max(SCREEN_WIDTH, SCREEN_HEIGHT) )
    static let SCREEN_MIN_LENGTH     = Int( min(SCREEN_WIDTH, SCREEN_HEIGHT) )
    
    static let IS_IPHONE_4_OR_LESS   = IS_IPHONE && SCREEN_MAX_LENGTH  < 568
    static let IS_IPHONE_5           = IS_IPHONE && SCREEN_MAX_LENGTH == 568
    static let IS_IPHONE_6_OR_HIGHER = IS_IPHONE && SCREEN_MAX_LENGTH  > 568
    static let IS_IPHONE_6           = IS_IPHONE && SCREEN_MAX_LENGTH == 667
    static let IS_IPHONE_6P          = IS_IPHONE && SCREEN_MAX_LENGTH == 736
    static let IS_IPHONE_X           = IS_IPHONE && SCREEN_MAX_LENGTH >= 812
    
    static let IS_IPHONE_XS           = IS_IPHONE && SCREEN_MAX_LENGTH == 812
    static let IS_IPHONE_X_OR_HIGHER = IS_IPHONE && SCREEN_MAX_LENGTH  > 812
    static let IS_IPHONE_X_OR_LOWER  = IS_IPHONE && SCREEN_MAX_LENGTH  < 812
    static let IS_IPHONE_5_OR_LESS   = IS_IPHONE && SCREEN_MAX_LENGTH <= 568
    
    // MARK: - Singletons
    static var ScreenWidth: CGFloat {
        struct Singleton {
            static let width = UIScreen.main.bounds.size.width
        }
        return Singleton.width
    }
    
    static var ScreenHeight: CGFloat {
        struct Singleton {
            static let height = UIScreen.main.bounds.size.height
        }
        return Singleton.height
    }
}

func showAlertViewWithOK(vc : UIViewController, titleString : String , messageString: String) ->()
{
    let alertView = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
    
    let alertAction = UIAlertAction(title: "OK", style: .cancel) { (alert) in
        vc.dismiss(animated: true, completion: nil)
    }
    
    alertView.addAction(alertAction)
    vc.present(alertView, animated: true, completion: nil)

}

var container: UIView = UIView()
var loadingView: UIImageView = UIImageView()
//var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

/*
 Show customized activity indicator,
 actually add activity indicator to passing view
 
 @param uiView - add activity indicator to this view
 */
func showActivityIndicator(uiView: UIView) {
    container.frame = uiView.frame
    container.center = uiView.center
    container.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.5)
        
    loadingView.frame = CGRect(x: 0.0, y: 0.0, width: 150.0, height: 113.0)
    loadingView.center = uiView.center
//    loadingView.backgroundColor = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 0.6)
    loadingView.clipsToBounds = true
    loadingView.image = UIImage.gifImageWithName("leaderboard_loading")
//    loadingView.layer.cornerRadius = 10
    
//    activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 40.0)
//    activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
//    activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
    
//    loadingView.addSubview(activityIndicator)
    container.addSubview(loadingView)
    uiView.addSubview(container)
//    activityIndicator.startAnimating()
}

/*
 Hide activity indicator
 Actually remove activity indicator from its super view
 
 @param uiView - remove activity indicator from this view
 */
func hideActivityIndicator(uiView: UIView) {
//    activityIndicator.stopAnimating()
    container.removeFromSuperview()
}

/*
 Define UIColor from hex value
 
 @param rgbValue - hex color value
 @param alpha - transparency level
 */
func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
    let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
    let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
    let blue = CGFloat(rgbValue & 0xFF)/256.0
    return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
}

class Toast {
    static func show(message: String, controller: UIViewController) {
        let toastContainer = UIView(frame: CGRect())
        toastContainer.backgroundColor = UIColor.init(red: (63.0/255.0), green: (142.0/255.0), blue: (248.0/255.0), alpha: 5.0)
        toastContainer.alpha = 0.0
        toastContainer.layer.cornerRadius = 25;
        toastContainer.clipsToBounds  =  true
        
        let toastLabel = UILabel(frame: CGRect())
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font.withSize(12.0)
        toastLabel.text = message
        toastLabel.clipsToBounds  =  true
        toastLabel.numberOfLines = 0
        
        toastContainer.addSubview(toastLabel)
        controller.view.addSubview(toastContainer)
        
        toastLabel.translatesAutoresizingMaskIntoConstraints = false
        toastContainer.translatesAutoresizingMaskIntoConstraints = false
        
        let a1 = NSLayoutConstraint(item: toastLabel, attribute: .leading, relatedBy: .equal, toItem: toastContainer, attribute: .leading, multiplier: 1, constant: 15)
        let a2 = NSLayoutConstraint(item: toastLabel, attribute: .trailing, relatedBy: .equal, toItem: toastContainer, attribute: .trailing, multiplier: 1, constant: -15)
        let a3 = NSLayoutConstraint(item: toastLabel, attribute: .bottom, relatedBy: .equal, toItem: toastContainer, attribute: .bottom, multiplier: 1, constant: -15)
        let a4 = NSLayoutConstraint(item: toastLabel, attribute: .top, relatedBy: .equal, toItem: toastContainer, attribute: .top, multiplier: 1, constant: 15)
        toastContainer.addConstraints([a1, a2, a3, a4])
        
        let c1 = NSLayoutConstraint(item: toastContainer, attribute: .leading, relatedBy: .equal, toItem: controller.view, attribute: .leading, multiplier: 1, constant: 65)
        let c2 = NSLayoutConstraint(item: toastContainer, attribute: .trailing, relatedBy: .equal, toItem: controller.view, attribute: .trailing, multiplier: 1, constant: -65)
        let c3 = NSLayoutConstraint(item: toastContainer, attribute: .bottom, relatedBy: .equal, toItem: controller.view, attribute: .bottom, multiplier: 1, constant: -75)
        controller.view.addConstraints([c1, c2, c3])
        
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            toastContainer.alpha = 1.0
        }, completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 1.5, options: .curveEaseOut, animations: {
                toastContainer.alpha = 0.0
            }, completion: {_ in
                toastContainer.removeFromSuperview()
            })
        })
    }
}

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let size = image.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
        newSize = CGSize(width: (size.width * heightRatio), height: (size.height * heightRatio))
    } else {
        newSize = CGSize(width: (size.width * widthRatio), height: (size.height * widthRatio))
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0.0, y: 0.0, width: newSize.width, height: newSize.height)
    
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    image.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage!
}

func UTC_DF() -> DateFormatter {
    let dateFormatter = DateFormatter()
    if let time = NSTimeZone(name: "UTC") {
        dateFormatter.timeZone = time as TimeZone
    }
    dateFormatter.locale = NSLocale.system
    dateFormatter.dateFormat = "yyyy-MM-dd"
    
    return dateFormatter
}

func MM_DD_UTC_DF() -> DateFormatter {
    let dateFormatter = DateFormatter()
//    if let time = NSTimeZone(name: "UTC") {
//        dateFormatter.timeZone = time as TimeZone
//    }
//    dateFormatter.locale = NSLocale.system
    dateFormatter.dateFormat = "dd MMM"
    
    return dateFormatter
}

func GMT_DF() -> DateFormatter {
    let dateFormatter = DateFormatter()
    if let time = NSTimeZone(name: "GMT") {
        dateFormatter.timeZone = time as TimeZone
    }
    dateFormatter.locale = NSLocale.system
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    
    return dateFormatter
}

extension NSDictionary {
    func GotValue(key : String)-> NSString {
        
        if self[key] != nil {
            
            if((self["\(key)"] as? NSObject) != nil && (key .isEmpty) == false) {
                
                let obj_value = self["\(key)"] as? NSObject
                
                let str = NSString(format:"%@", obj_value!)
                
                if str == "<null>" {
                    
                    return ""
                }
                
                return str
            }
        }
        
        return ""
    }
}

extension Date {
    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .hour, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
}

extension Date {
    static func getDates(forLastNDays nDays: Int) -> [Date] {
        
        let cal = NSCalendar.current
        // start with today
        var date = cal.startOfDay(for: cal.date(byAdding: Calendar.Component.day, value: 2, to: Date().midnight)!)
        
        print("--WeekSteps date--\(date)")
        
        var arrDates = [Date]()
        
        for _ in 1 ... nDays {
            // move back in time by one day:
            date = cal.date(byAdding: Calendar.Component.day, value: -1, to: date)!
            
            arrDates.append(date)
        }
        return arrDates
    }
}

extension Date {
    func localString(dateStyle: DateFormatter.Style = .medium,
                     timeStyle: DateFormatter.Style = .medium) -> String {
        return DateFormatter.localizedString(
            from: self,
            dateStyle: dateStyle,
            timeStyle: timeStyle)
    }
    
    var midnight:Date{
        let cal = Calendar(identifier: .gregorian)
        return cal.startOfDay(for: self)
    }
}

// Get and show images with URL
let imageCache = NSCache<NSString, AnyObject>()

extension UIImageView {
    func loadImageUsingCache(withUrl urlString : String) {
        if urlString.count > 0 {
            let url = URL(string: urlString)
            self.image = nil
            
            // check cached image
            if let cachedImage = imageCache.object(forKey: urlString as NSString) as? UIImage {
                self.image = cachedImage
                self.backgroundColor = UIColor.clear
                return
            }
            
            // if not, download image from url
            URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
                if error != nil {
                    //                    print(error!)
                    return
                }
                
                DispatchQueue.main.async {
                    if let image = UIImage(data: data!) {
                        imageCache.setObject(image, forKey: urlString as NSString)
                        self.backgroundColor = UIColor.clear
                        self.image = image
                    }
                }
                
            }).resume()
        }
    }
}

extension Int {
    
    var ordinal: String {
        var suffix: String
        let ones: Int = self % 10
        let tens: Int = (self/10) % 10
        if tens == 1 || tens == -1 {
            suffix = "th"
        } else if ones == 1 || ones == -1 {
            suffix = "st"
        } else if ones == 2 || ones == -2 {
            suffix = "nd"
        } else if ones == 3 || ones == -3 {
            suffix = "rd"
        } else {
            suffix = "th"
        }
        //        return "\(self)\(suffix)"
        
        return "\(suffix)"
    }
}

extension UIColor {
    convenience init(hexFromString:String, alpha:CGFloat = 1.0) {
        var cString:String = hexFromString.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)
        }
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

