//
//  ViewController.swift
//  Currency
//
//  Created by Artem on 06/08/2018.
//  Copyright © 2018 Artem. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView : UITableView! 
    private let bag = DisposeBag()
    let dataSource = TickersDataSource()
    
    lazy var viewModel : TickerViewModel = {
        let viewModel = TickerViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TickerCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self.dataSource
        self.tableView.rowHeight = 44
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        self.viewModel.fetch()

        Observable<Int>.interval(5, scheduler: MainScheduler.instance).subscribe({ _ in
            self.viewModel.fetch()
        }).disposed(by: bag)
    }

}

