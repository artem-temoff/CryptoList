//
//  Response.swift
//  Currency
//
//  Created by Artem on 07/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import ObjectMapper

struct Response: Mappable {
    
    var items : [TickerModel] = [TickerModel]()
    
    init?(map: Map) {

    }
    
    mutating func mapping(map: Map) {
        for (key, value) in map.JSON {
            if let object = value as? [String:Any], let id = object["id"] as? Int,let val = object["last"] as? String{
                items.append(TickerModel(id: id, name: key, value: val))
            }
         }
        
    }
    
    
}
