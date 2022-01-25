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
    @IBOutlet weak var proceedBtn: UIButton!
    var screentitle:String = ""
    let requestId = "123456"
    var isManual:Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        handleUIForEvents(event: eventType!)
        setNavigationIcons()
        
        
    }
    func setNavigationIcons()
    {      let button: UIButton = UIButton(type: .custom) as! UIButton
        button.setImage(UIImage(named: "option"), for: .normal)
        
        //   button.setTitle("Select Options", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.black, for: .normal)
        //add function for button
        button.addTarget(self, action: #selector(selectOptions), for: .touchUpInside)
        //set frame
        
        
        let barButton = UIBarButtonItem(customView: button)
        barButton.tintColor = .black
        //assign button to navigationbar
        if eventType == .ipaddress || eventType == .coordinate || eventType == .screensize
        {
            self.navigationItem.rightBarButtonItem = barButton
        }
        
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
        
        
        self.navigationItem.title = screentitle}
    @objc  func openLeftMenu()
    {
        
        self.sideMenuController?.showLeftView(animated: true, completion: nil)
    }
    
    @objc func selectOptions()
    {
        let alert = UIAlertController(title: "Select Options", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Auto", style: .default , handler:{ [self] (UIAlertAction)in
            self.isManual = false
            handleUIForEvents(event:self.eventType!)
        }))
        
        alert.addAction(UIAlertAction(title: "Manual", style: .default , handler:{ (UIAlertAction)in
            self.isManual = true
            self.handleUIForEvents(event:self.eventType!)
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
            if isManual
            {
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = false
                txtField2.isHidden = false
                txtFiled1.placeholder = "Enter Latitude"
                txtField2.placeholder = "Enter Longitude"
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
                //  @IBOutlet weak var messageLabel: UILabel!
            }
            else{
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = true
                txtField2.isHidden = true
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
            }
            print("")
        case .purchase:
            print("")
        case .screensize:
            if isManual
            {
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = false
                txtField2.isHidden = false
                txtFiled1.placeholder = "Enter Height"
                txtField2.placeholder = "Enter Width"
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
            }
            else{
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = true
                txtField2.isHidden = true
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
            }
            print("")
        case .ipaddress:
            if isManual
            {
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = false
                txtField2.isHidden = true
                txtFiled1.placeholder = "Enter IP Address"
                
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
            }
            else{
                txtFiled1.text = ""
                txtField2.text = ""
                txtFiled1.isHidden = true
                txtField2.isHidden = true
                messageLabel.text = ""
                proceedBtn.setTitle("Proceed", for: .normal)
            }
            print("")
        case .userAgent:
            txtFiled1.text = ""
            txtField2.text = ""
            txtFiled1.isHidden = false
            txtField2.isHidden = true
            txtFiled1.placeholder = "Enter Key"
            
            messageLabel.text = ""
            proceedBtn.setTitle("Proceed", for: .normal)
            print("")
            
            
            
        case .Metadata:
            txtFiled1.text = ""
            txtField2.text = ""
            txtFiled1.isHidden = false
            txtField2.isHidden = false
            txtFiled1.placeholder = "Enter Key"
            txtField2.placeholder = "Enter Value"
            
            messageLabel.text = ""
            proceedBtn.setTitle("Proceed", for: .normal)
            print("")
            
        case .CustomVariable:
            txtFiled1.text = ""
            txtField2.text = ""
            txtFiled1.isHidden = false
            txtField2.isHidden = false
            txtFiled1.placeholder = "Enter Key"
            txtField2.placeholder = "Enter Value"
            
            messageLabel.text = ""
            proceedBtn.setTitle("Proceed", for: .normal)
            print("")
        case .productDetailView:
            txtFiled1.text = ""
            txtField2.text = ""
            txtFiled1.isHidden = false
            txtField2.isHidden = false
            txtFiled1.placeholder = "Enter Product ID"
            txtField2.placeholder = "Enter Product SKU"
            
            messageLabel.text = ""
            proceedBtn.setTitle("Proceed", for: .normal)
        }
    }
    func purchase()
    {
        Personalization.shared.getActions(context: .Purchase, requestId: requestId, event: Purchase(account: "Flipkart", domain: "www.flipkart.com", instance: "instance-198", purchaseId: "PID-23892", purchaseLines: [PurchaseLine(sku: "sku-321", pid: "", quantity: 7, currency: "USD", value: "")])).on(success: { (res) in
            
            if res.status == 200
            {
                
                self.alertcall(message: "Purchase event Sucessfully executed")
            }
            else{
                self.alertcall(message: "Purchase event Failed")
            }
        })
    }
    func ipaddress()
    {
        if isManual
        {
            Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(ipAddress: "")).on(success: { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "IpAddress event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "IpAddress event Failed")
                }
               
            })
        }
        else
        {
            
            Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(auto: true)).on(success: { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "IpAddress event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "IpAddress event Failed")
                }
               
            })
        }
    }
    func coordinateApi()
    {
        if isManual
        {
            Personalization.shared.getActions(context: .Coordinates, requestId: requestId, event: Coordinates(latitude: txtFiled1.text!, longitude: txtField2.text!)).on { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "Coordinate event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "Coordinate event Failed")
                }
               
              
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
                        if res.status == 200
                        {
                            
                            self.alertcall(message: "Coordinate event Sucessfully executed")
                        }
                        else{
                            self.alertcall(message: "Coordinate event Failed")
                        }
                       
                        
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
    func ipaddressApi()
    {
        if isManual
        {
            Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(ipAddress: self.txtFiled1.text!)).on { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "IpAddress event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "IpAddress event Failed")
                }
               
                print("me")
            }
            
        }
        else
        {
            Personalization.shared.getActions(context: .IpAddress, requestId: requestId, event: IPAddress(auto: true)).on { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "IpAddress event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "IpAddress event Failed")
                }
               
                print("me")
            }
        }
    }
    func screensizeApi()
    {
        if isManual
        {
            Personalization.shared.getActions(context: .ScreenSize, requestId: requestId, event: ScreenSize(height: Int(self.txtFiled1.text!)!, width: Int(self.txtField2.text!)!)).on { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "ScreenSize event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "ScreenSize event Failed")
                }
                
                
                print("me")
            }
            
        }
        else
        {
            Personalization.shared.getActions(context: .ScreenSize, requestId: requestId, event: ScreenSize(auto: true)).on { (res) in
                if res.status == 200
                {
                    
                    self.alertcall(message: "ScreenSize event Sucessfully executed")
                }
                else{
                    self.alertcall(message: "ScreenSize event Failed")
                }
                print("me")
            }
        }
        
    }
    func metadataApi()
    {
        
        
        Personalization.shared.getActions(context: .Metadata, requestId: requestId, event: Metadata(metadata: JSONValue(dictionaryLiteral: (self.txtFiled1.text!, JSONValue(stringLiteral: self.txtField2.text!))))).on(success: { (res) in
            if res.status == 200
            {
                
                self.alertcall(message: "Metadata event Sucessfully executed")
            }
            else{
                self.alertcall(message: "Metadata event Failed")
            }
            
            print("response", res.status, res.data?.toString)
        })
    }
    
    func customVariable()
    {
        Personalization.shared.getActions(context: .CustomVariables, requestId: requestId, event:  CustomVariables(customVariables: [CustomVariablesModel(variable: self.txtFiled1.text!, value: JSONValue(stringLiteral: self.txtField2.text!))])).on(success: { (res) in
            
            if res.status == 200
            {
                self.alertcall(message: "CustomVariables event Sucessfully executed")
            }
            else{
                self.alertcall(message: "CustomVariables event Failed")
            }
        })
    }
    
    func userAgent()
    {
        Personalization.shared.getActions(context: .UserAgent, requestId: requestId, event: UserAgent(self.txtFiled1.text!)).on(success: { (res) in
            if res.status == 200
            {
                self.alertcall(message: "UserAgent event Sucessfully executed")
            }
            else{
                self.alertcall(message: "UserAgent event Failed")
            }
            
            
        })
    }
    func productDetailView()
    {
        Personalization.shared.getActions(context: .ProductDetailView, requestId: requestId, event: ProductDetailView(products: [Product(productId: self.txtFiled1.text!, sku: self.txtField2.text!)])).on(success: { (res) in
            print("response", res.status, res.data?.toString)
            if res.status == 200
            {
                self.alertcall(message: "ProductDetailView event Sucessfully executed")
            }
            else{
                self.alertcall(message: "ProductDetailView event Failed")
            }
            
        })
    }
    @IBAction func proceed(_ sender: Any) {
        switch eventType
        {
        case .coordinate:
            
            self.coordinateApi()
        case .purchase:
            print("")
        case .screensize:
            self.screensizeApi()
            print("")
        case .ipaddress:
            self.ipaddressApi()
            print("")
        case .userAgent:
            self.userAgent()
            print("")
        case .Metadata:
            self.metadataApi()
            print("")
        case .CustomVariable:
            self.customVariable()
        case .none:
            print("")
        case .some(.productDetailView):
            self.productDetailView()
            print("")
        }
        
    }
    
    func alertcall(message:String)
    {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
            
            self.handleUIForEvents(event:self.eventType!)
        }))
        
        alert.view.tintColor = .red
        
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func alertforlocationnotenabled()
    {
        let alert = UIAlertController(title: "alert", message: "location Service Permission is not provided", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
            
        }))
        
        // alert.view.backgroundColor = .red
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
}
