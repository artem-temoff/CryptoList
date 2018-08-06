//
//  TickerViewModel.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import RxSwift
import Moya
import Moya_ObjectMapper

class TickerViewModel {
    
    weak var dataSource : GenericDataSource<TickerModel>?
    private let bag = DisposeBag()
    private let provider: MoyaProvider<PoloniexAPI>
    
    init(provider: MoyaProvider<PoloniexAPI> = MoyaProvider<PoloniexAPI>(), dataSource : GenericDataSource<TickerModel>?) {
        self.provider = provider
        self.dataSource = dataSource
    }
    
    func fetch(){
        provider.rx.request(.tickers).subscribe{ event in
            switch event{
            case .success(let response):
                if let newTickers = try? response.mapObject(Response.self){
                    self.processTickers(newTickers)
                } else {
                    print("error in mapping")
                }
                break
            case .error(let error):
                print(error)
            }
            }.disposed(by: bag)
    }
    
    private func processTickers(_ responce: Response){
        self.dataSource?.data.value = responce.items
    }
 
}


