//
//  RepositoryListVC.swift
//  GitHubRepository
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import UIKit
import RxSwift

class RepositoryListVC: UITableViewController {

    private let organization = "Apple"
    private let repositorys = BehaviorSubject<[Repository]>(value: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = organization + "Repositorys"
        
        self.refreshControl = UIRefreshControl()
        let refreshControl = self.refreshControl
        refreshControl?.backgroundColor = .white
        refreshControl?.tintColor = .darkGray
        refreshControl?.attributedTitle = NSAttributedString("당겨서 새로고침")
        refreshControl?.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        tableView.register(RepositoryListCell.self, forCellReuseIdentifier: "RepositoryListCell")
        tableView.rowHeight = 140
    }
    
    @objc func refresh() {
        
    }
}

extension RepositoryListVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryListCell") as? RepositoryListCell else { return UITableViewCell() }
        cell.repository = nil
        return cell
    }
}
