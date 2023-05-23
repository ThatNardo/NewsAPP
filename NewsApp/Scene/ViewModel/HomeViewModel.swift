//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Buğra Özuğurlu on 22.05.2023.
//

import Foundation

protocol HomeViewModelProtocol {
    var news: News? {get}
    var networkManager: NetworkManagerProtocol {get}
    var delegate: HomeViewControllerOutput? {get}
    
    func fetchNewsItems()
    func setDelegate(output: HomeViewControllerOutput)
}

final class HomeViewModel: HomeViewModelProtocol {
    
    var delegate: HomeViewControllerOutput?
    var news: News?
    lazy var networkManager: NetworkManagerProtocol = NetworkManager()
    
    func fetchNewsItems() {
        networkManager.getNewsItems(type: News.self) { [weak self] result in
            switch result {
            case.success(let news):
                self?.news = news
                self?.delegate?.uptadeView(values: news)
            case.failure(let error):
                print(error)
            }
        }
    }
    func setDelegate(output: HomeViewControllerOutput) {
        self.delegate = output
    }
}
