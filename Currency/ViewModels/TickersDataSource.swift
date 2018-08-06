//
//  TickersDataSource.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit

class TickersDataSource : GenericDataSource<TickerModel>, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TickerCell
        
        let value = self.data.value[indexPath.row]
        cell.ticker = value
        
        return cell
    }
}
