//
//  ProductStore.swift
//  ShoppingCart
//
//  Created by Ana Leticia Camargos on 10/04/19.
//  Copyright © 2019 Ana Leticia Camargos. All rights reserved.
//

import UIKit

class ProductItem {
    
    var title: String
    var price: Double
    var image: UIImage
    var quantity: Int
    var sku:String
    var pid:String
    
    init(title: String, price: Double, image: UIImage, quantity: Int,sku:String,pid:String) {
        self.title = title
        self.price = price
        self.image = image
        self.quantity = quantity
        self.pid = pid
        self.sku = sku
    }
    
    func setQuantity (quantity: Int) {
        self.quantity = quantity
    }
}

class ProductStore {
    
    var products: [ProductItem] = [
        ProductItem(title: "iPad Pro", price: 599, image: #imageLiteral(resourceName: "ipad pro 2021"), quantity: 0,sku:"sk-11",pid:"sk-11-01"),
        ProductItem(title: "realme phone", price: 299, image: #imageLiteral(resourceName: "realme smart ph") , quantity: 0,sku:"sk-12",pid:"sk-12-01"),
        ProductItem(title: "Apple TV", price: 199, image: #imageLiteral(resourceName: "apple tv") , quantity: 0,sku:"sk-13",pid:"sk-13-01"),
        ProductItem(title: "Samsung m13", price: 199, image: #imageLiteral(resourceName: "samsung m13") , quantity: 0,sku:"sk-14",pid:"sk-14-01"),
        ProductItem(title: "Watch titan", price: 199, image: #imageLiteral(resourceName: "titan watch") , quantity: 0,sku:"sk-15",pid:"sk-15-01"),
        ProductItem(title: "MI TV", price: 199, image: #imageLiteral(resourceName: "mi tv") , quantity: 0,sku:"sk-16",pid:"sk-16-01"),
        ProductItem(title: "skime watch", price: 199, image: #imageLiteral(resourceName: "realme watch") , quantity: 0,sku:"sk-17",pid:"sk-17-01")
        
    ]
    
    func getPositionByName(title: String) -> Int? {
        for i in 0...products.count-1 {
            if products[i].title == title {
                return i
            }
        }
        return nil
    }
    
    func getPriceByName(title: String) -> Double? {
        for product in products {
            if product.title == title {
                return product.price
            }
        }
        return nil
    }
    
    func calculateTotal() -> Double {
        var totalValue: Double = 0
        
        for product in products {
            totalValue += Double(product.quantity) * product.price
        }
        
        return totalValue
    }
}
