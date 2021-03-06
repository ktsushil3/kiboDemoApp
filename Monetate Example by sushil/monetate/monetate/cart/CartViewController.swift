//
//  CartViewController.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class CartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, myDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalValueLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var productStore: ProductStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.totalValueLabel.text = "$0.0"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.productStore = ProductStore()
        //create a new button
        let button: UIButton = UIButton(type: .custom) as! UIButton
               //set image for button
        button.setImage(UIImage(named: "menuleft"), for: .normal)
               //add function for button
        button.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
               //set frame
               button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        button.addTarget(self, action: #selector(openLeftMenu), for: .touchUpInside)
               let barButton = UIBarButtonItem(customView: button)
        
               //assign button to navigationbar
               self.navigationItem.leftBarButtonItem = barButton
    }
  @objc  func openLeftMenu()
    {
    
    self.sideMenuController?.showLeftView(animated: true, completion: nil)
  }
    
    override func viewWillAppear(_ animated: Bool) {
        self.totalValueLabel.text = "$0.0"
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productStore.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! CartTableViewCell
        
        cell.productImageView.backgroundColor = UIColor.red
        cell.selectionStyle = .none
//        switch indexPath.row {
//        case 0:
//            cell.configure(currentProduct: productStore.products[0])
//        case 1:
//            cell.configure(currentProduct: productStore.products[1])
//        case 2:
//            cell.configure(currentProduct: productStore.products[2])
//        default:
//            cell.configure(currentProduct: productStore.products[0])
//        }
//
        cell.configure(currentProduct: productStore.products[indexPath.row])
        cell.delegate = self
                
        return cell
    }
    
    func myDelegate(value: Int, productName: String) {
        if let position = productStore.getPositionByName(title: productName) {
            productStore.products[position].setQuantity(quantity: value)
            updateTotalValue()
        }
        
    }
    
    func updateTotalValue() {
        totalValueLabel.text = "$\(productStore.calculateTotal())"
    }
    
    @IBAction func didTapPlaceOrder(_ sender: Any) {
        for item in productStore.products
        {
            if item.quantity > 0
            {
                performSegue(withIdentifier: "finishPurchase", sender: nil)
                return
            }
        }
        self.callalert()
        
    }
    func callalert()
    {
        let alert = UIAlertController(title: "alert", message: "Please Select Product", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (_) in
            
        }))
        
        // alert.view.backgroundColor = .red
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "finishPurchase" {
            let checkoutVC = segue.destination as! CheckoutViewController
            checkoutVC.totalValue = self.totalValueLabel.text!
            for product in productStore.products
            {
                if product.quantity > 0
                {
                checkoutVC.products.append(product)
                }
            }
           
        }
    }
}
