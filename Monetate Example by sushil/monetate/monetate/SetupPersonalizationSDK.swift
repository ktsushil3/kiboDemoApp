//
//  PersonalizationSetup.swift
//  monetate-ios-sdk-example
//
//  Created by Umar Sayyed on 21/10/20.
//  Copyright © 2020 Monetate. All rights reserved.
//

import Foundation
import monetate_ios_sdk
 
func setupPersonalizationSDK () {
   
   Personalization.setup(
      account: Account(instance: "p", domain: "localhost.org", name: "a-701b337c", shortname: "localhost"),
      user: User(kiboId: "auto"),
      contextMap: setupContextMap()
   )
   
}


extension Data {
    func toJSON () -> [String: Any]?{
        do {
            return try JSONSerialization.jsonObject(with: self, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    var hexString: String {
        let hexString = map { String(format: "%02.2hhx", $0) }.joined()
        return hexString
    }
    
    var toString: String {
        return String(decoding: self, as: UTF8.self)
    }
    var toString1: String? {
        return String(data: self, encoding: .utf8)
    }
}
