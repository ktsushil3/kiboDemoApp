//
//  VariousEventsVC.swift
//  monetate
//
//  Created by Sushil Tiwari on 08/11/21.
//

import UIKit
import monetate_ios_sdk
import CoreLocation

class VariousEventsVC: UIViewController {
    var eventType:EventType?
    
    @IBOutlet weak var txtFiled1: UITextField!
    @IBOutlet weak var txtField2: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    let requestId = "123456"
    var isManual:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        handleUIForEvents(event: eventType!)
        let button: UIButton = UIButton(type: .custom) as! UIButton
               //set image for button
        button.setTitle("Select Options", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
               //add function for button
        button.addTarget(self, action: #selector(selectOptions), for: .touchUpInside)
               //set frame
              
     
               let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = .black
               //assign button to navigationbar
               self.navigationItem.rightBarButtonItem = barButton
        
        let button1: UIButton = UIButton(type: .custom) as! UIButton
               //set image for button
        button1.setImage(UIImage(named: "menuleft"), for: .normal)
               //add function for button
        button1.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
               //set frame
               button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        button1.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
               let barButton1 = UIBarButtonItem(customView: button1)
        barButton1.tintColor = .black
               //assign button to navigationbar
        self.navigationController?.navigationBar.tintColor = .black
               self.navigationItem.leftBarButtonItem = barButton1
        self.navigationItem.title = "Coordinate"
        
    }
    @objc  func openLeftMenu()
      {
      
      self.sideMenuController?.showLeftView(animated: true, completion: nil)
    }
      
    @objc func selectOptions()
    {
        let alert = UIAlertController(title: "Select Options", message: "Please Select an Option", preferredStyle: .actionSheet)
          
        alert.addAction(UIAlertAction(title: "Auto", style: .default , handler:{ [self] (UIAlertAction)in
           isManual = false
          }))
          
          alert.addAction(UIAlertAction(title: "Manual", style: .default , handler:{ (UIAlertAction)in
            self.isManual = true
              print("User click Edit button")
          }))

          alert.addAction(UIAlertAction(title: "cancel", style: .destructive , handler:{ (UIAlertAction)in
              print("User click Delete button")
          }))
        

          
          //uncomment for iPad Support
          //alert.popoverPresentationController?.sourceView = self.view

          self.present(alert, animated: true, completion: {
              print("completion block")
          })
    }
    func handleUIForEvents(event:EventType)
{
        switch event {
       
        case .coordinate:
            
            print("")
        case .purchase:
            print("")
        case .screensize:
            print("")
        case .ipaddress:
            print("")
        case .userAgent:
            print("")
        case .Metadata:
            print("")
        }
}
    func purchase()
    {
        Personalization.shared.getActions(context: .Purchase, requestId: requestId, event: Purchase(account: "Flipkart", domain: "www.flipkart.com", instance: "instance-198", purchaseId: "PID-23892", purchaseLines: [PurchaseLine(sku: "sku-321", pid: "", quantity: 7, currency: "USD", value: "")])).on(success: { (res) in
           
        })
    }
    func ipaddress()
    {
        if isManual
        {
        Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(ipAddress: "")).on(success: { (res) in
           
        })
        }
        else
        {
        
        Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(auto: true)).on(success: { (res) in
           
        })
        }
    }
    func coordinate()
    {
        if isManual
        {
            Personalization.shared.getActions(context: .Coordinates, requestId: requestId, event: Coordinates(latitude: txtFiled1.text!, longitude: txtField2.text!)).on { (res) in
                self.alertcall(message: "Coordinate event Sucessfully executed")
                print("me")
            }
            
        }
        else
        {
            if CLLocationManager.locationServicesEnabled() {
                switch CLLocationManager.authorizationStatus() {
                    case .notDetermined, .restricted, .denied:
                        print("No access")
                        self.alertforlocationnotenabled()
                    case .authorizedAlways, .authorizedWhenInUse:
                        Personalization.shared.getActions(context: .Coordinates, requestId: requestId, event: Coordinates(auto: true)).on { (res) in
                            self.alertcall(message: "Coordinate event Sucessfully executed")
                           print("me")
                        }
                        print("Access")
                    @unknown default:
                        break
                }
            } else {
                self.alertforlocationnotenabled()
                print("Location services are not enabled")
            }
            
        }
    }
    @IBAction func proceed(_ sender: Any) {
        switch eventType
        {
        case .coordinate:

            self.coordinate()
        case .purchase:
            print("")
        case .screensize:
            print("")
        case .ipaddress:
            ipaddress()
            print("")
        case .userAgent:
            print("")
        case .Metadata:
            print("")
        case .none:
            print("")
        }
    
}

    func alertcall(message:String)
    {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .actionSheet)
        
               alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
          
               }))

        alert.view.backgroundColor = .red

               self.present(alert, animated: true, completion: {
                   print("completion block")
               })
    }
    
    func alertforlocationnotenabled()
    {
        let alert = UIAlertController(title: "alert", message: "location Service Permission is not provided", preferredStyle: .actionSheet)
        
               alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
          
               }))

        alert.view.backgroundColor = .red

               self.present(alert, animated: true, completion: {
                   print("completion block")
               })
    }
    
}
