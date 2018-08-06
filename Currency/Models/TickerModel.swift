//
//  TickerModel.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//


import ObjectMapper

class TickerModel{
    
    var id : Int?
    var name : String?
    var value : String?
    
    init(id:Int,name:String,value:String){
        self.id = id
        self.name = name
        self.value = value
    }
    
    
}
