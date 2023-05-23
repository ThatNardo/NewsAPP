//
//  HomeViewController.swift
//  NewsApp
//
//  Created by Buğra Özuğurlu on 22.05.2023.
//

import UIKit

protocol HomeViewControllerOutput {
    func uptadeView(values: News)
}

class HomeViewController: UITableViewController, HomeViewControllerOutput {
    
    private var viewModel = HomeViewModel()
    private var news: News?
    

    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        navBarSetup()
        viewModel.fetchNewsItems()
        viewModel.setDelegate(output: self)
    }
    func uptadeView(values: News) {
        news = values
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
// MARK: - Extensions
extension HomeViewController {
    private func tableViewSetup() {
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    }
    private func navBarSetup() {
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
extension HomeViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news?.articles.count ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
            return UITableViewCell()
        }
        if let model = news?.articles[indexPath.row] {
            cell.configure(with: model)
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
