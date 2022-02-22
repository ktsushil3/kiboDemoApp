//
//  CheckoutViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 12/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import monetate_ios_sdk
import LGSideMenuController


class CheckoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewCell", for: indexPath) as! CartViewCell
        cell.selectionStyle = .none
        cell.productName.text = products[indexPath.row].title
        cell.productQuantity.text = String(products[indexPath.row].quantity)
        cell.productAmount.text = "$ \(String(products[indexPath.row].price)) "
        cell.productimg.image = products[indexPath.row].image
        cell.productTotal.text = "Total $\(String(Double(products[indexPath.row].quantity) * products[indexPath.row].price)) "
        
        return cell
    }
    
    
    @IBOutlet weak var totalValueLabel: UILabel!
 //   @IBOutlet weak var expressButton: UIButton!
 //   @IBOutlet weak var standardButton: UIButton!
    
    @IBOutlet weak var tableview: UITableView!
    var totalValue : String = ""
    var originalTotalValue: Double = 0.0
    var products:[ProductItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        tableview.tableFooterView = UIView()
        self.totalValueLabel.text = "\(totalValue)"
        let valueInDouble = Double(totalValue.substring(with: 1..<totalValue.count))
        originalTotalValue = valueInDouble!
        
      //  standardButton.isEnabled = false

    }
    
    @IBAction func expressSelection(_ sender: Any) {
       // standardButton.isEnabled = true
      //  expressButton.isEnabled = false
        
        let valueInDouble = Double(totalValue.substring(with: 1..<totalValue.count))
        self.totalValueLabel.text = "$\(valueInDouble! + 15)"
    }
    
    @IBAction func standardSelection(_ sender: Any) {
     //   standardButton.isEnabled = false
     //   expressButton.isEnabled = true
        
        self.totalValueLabel.text = "$\(originalTotalValue)"
    }
    
    @IBAction func placeOrderDidSelect(_ sender: Any) {
        var cartline:[CartLine] = []
        for item in products
        {
            cartline.append(CartLine(sku: item.sku, pid: item.pid, quantity: item.quantity, currency: "USD", value: String(item.price * Double(item.quantity))))
        }
        let requestId = "123456"
        
        
            Personalization.shared.getActions(context: .Cart, requestId: requestId, event: Cart(cartLines: cartline)).on { (res) in
                self.handleAction(res: res)
            }
            

    }
    func alertcall()
    {
        let alert = UIAlertController(title: "Success", message: "Sucessfully Purchased items ", preferredStyle: .actionSheet)
        
               alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
               let ctrl = self.navigationController?.parent as! LGSideMenuController
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "CartViewController") as! CartViewController
                let navCtr = UINavigationController(rootViewController: vc)
                ctrl.rootViewController = navCtr
                   print("User click Approve button")
               }))

      //  alert.view.tintColor = .red
     //   alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.green

           // Accessing buttons tintcolor :
          

               self.present(alert, animated: true, completion: {
                   print("completion block")
               })
    }
    fileprivate func handleAction (res: APIResponse) {
        print("res", res)
        let data = JSON(res.data)
        //      print("data", data)
        for item in data["data"]["responses"].arrayValue {
            self.alertcall()
//            if item["requestId"].string == res.requestId {
//                for oneaction in item["actions"].arrayValue
//                {
//                    let meta = oneaction["json"]["meta"]
//                    if (meta["tool"].stringValue == "android") {
//
//                     let color = meta["data"]["json"]["color"] ?? ""
//
//                     print(color)
////                        let data = oneaction["json"]["data"]["json"]
////                        print("\(data["text"].stringValue),\(data["color"].stringValue),\(data["style"].string)")
//
//                    }
//                }
//
//                }
            }
        }
    }


extension String {
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return substring(from: fromIndex)
    }
    
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return substring(to: toIndex)
    }
    
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return substring(with: startIndex..<endIndex)
    }
}
