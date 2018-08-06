//
//  PoloniexAPI.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import Moya

enum PoloniexAPI{
    case tickers
}

extension PoloniexAPI : TargetType{
    
    public var baseURL: URL { return URL(string: "https://poloniex.com/")! }
    
    var path: String {
         return "public"
    }
    
    public var headers: [String: String]? {
        return  ["Content-Type": "application/json"]
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var parameters : [String:Any]?{
        return  ["command": "returnTicker"]
    }
    
    var parameterEncoding: ParameterEncoding {
            return URLEncoding.default
    }
    
    var sampleData: Data {
        return Data()
    }
    var task: Task {
        return .requestParameters(parameters: self.parameters ?? [:], encoding: self.parameterEncoding)
    }
    
}


