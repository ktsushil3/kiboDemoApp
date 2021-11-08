//
//  SetupContextMap.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 22/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation
import monetate_ios_sdk

func setupContextMap () -> ContextMap {
   return ContextMap(
      userAgent: UserAgent(auto: true),
      ipAddress: IPAddress(ipAddress: "192.168.0.1"),
      coordinates: Coordinates.init(auto: true),
      screenSize: ScreenSize(auto: true),
      
      cart: {() in
         let promise = Promise<Cart, Error>()
         promise.succeed(value: Cart(cartLines: [CartLine(sku: "SKU-111", pid: "PID-111", quantity: 2, currency: "USD", value: "460"), CartLine(sku: "SKU-222", pid: "PID-222", quantity: 4, currency: "USD", value: "560")]))
         
         return promise.future
   },
      purchase: {
         let promise = Promise<Purchase, Error>()
         let p = Purchase(account: "account-232", domain: "tem.dom.main", instance: "temp", purchaseId: "pur-23232", purchaseLines: [
            PurchaseLine(sku: "SKU-123", pid: "Prod-1232", quantity: 2, currency: "USD", value: "2.99")
         ])
         promise.succeed(value: p)
         
         return promise.future
   },
      productDetailView: { () in
         let promise = Promise<ProductDetailView, Error>()
         let result = ProductDetailView.init(products: [
            Product.init(productId: "PROD-9898", sku: "SKU-9898"),
            Product.init(productId: "PROD-8989", sku: "SKU-8989")
         ])
         promise.succeed(value: result)
         return promise.future
   },
      productThumbnailView: {
         let promise = Promise<ProductThumbnailView, Error>()
         let result =     ProductThumbnailView.init(products: [""])
         promise.succeed(value: result)
         return promise.future
   },
      pageView: { () in
         let promise = Promise<PageView, Error>()
         let r = PageView(pageType: "profile", path: "/profile", url: "http:/home", categories: nil, breadcrumbs: nil)
         promise.succeed(value: r)
         return promise.future
   },
      metadata: { () in
         let promise = Promise<Metadata, Error>()
         let r = Metadata(metadata: JSONValue(dictionaryLiteral: ("Key1", "Val1"), ("Key2", "Val2")))
         promise.succeed(value: r)
         return promise.future
   },
      customVariables: { () in
         let promise = Promise<CustomVariables, Error>()
         let r = CustomVariables(customVariables: [
            CustomVariablesModel(variable: "TempVariable", value: JSONValue.init(dictionaryLiteral: ("String", "JSONValue"))),
            CustomVariablesModel(variable: "KEY", value: JSONValue.init(dictionaryLiteral: ("String", "JSONValue")))
         ])
         promise.succeed(value: r)
         return promise.future
   })
   
}
