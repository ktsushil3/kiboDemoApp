//
//  CheckoutViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 12/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit
import monetate_ios_sdk


class CheckoutViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartViewCell", for: indexPath) as! CartViewCell
        cell.productName.text = products[indexPath.row].title
        cell.productQuantity.text = String(products[indexPath.row].quantity)
        cell.productAmount.text = String(products[indexPath.row].price)
        
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
            
//        let alertController = UIAlertController(title: "Confirm Order", message: "Please confirm that you want to make a payment of \(totalValueLabel.text!)!", preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        let confirm = UIAlertAction(title: "Confirm", style: .default) { (action) in
//            let sucessActionSheet = UIAlertController(title: "Thank you", message: "Your payment of \(self.totalValueLabel.text!) was processed successfully! Please check your email for your order receipt email and shipping information.", preferredStyle: .actionSheet)
//            let continueShoppingAction = UIAlertAction(title: "Let's Shop More!", style: .default, handler: { (action) in
//                self.navigationController?.popToRootViewController(animated: true)
//            })
//
//            sucessActionSheet.addAction(continueShoppingAction)
//            self.present(sucessActionSheet, animated: true, completion: nil)
//        }
//        alertController.addAction(cancel)
//        alertController.addAction(confirm)
//
//        self.present(alertController, animated: true, completion: nil)
    }
    fileprivate func handleAction (res: APIResponse) {
        print("res", res)
        let data = JSON(res.data)
        //      print("data", data)
        for item in data["data"]["responses"].arrayValue {
            if item["requestId"].string == res.requestId {
                
                let action = item["actions"].arrayValue[0]
                let meta = action["json"]["meta"]
                if (meta["tool"].stringValue == "ios") {
                    let data = action["json"]["data"]["json"]
                    print("\(data["text"].stringValue),\(data["color"].stringValue),\(data["style"].string)")
                   
                }
            }
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
