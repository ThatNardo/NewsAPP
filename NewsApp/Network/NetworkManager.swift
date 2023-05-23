//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Buğra Özuğurlu on 22.05.2023.
//

import Foundation

protocol NetworkManagerProtocol {
    func getNewsItems<T:Codable>(type: T.Type, completion: @escaping (Result<T,Error>) -> Void)
}
struct NetworkManager: NetworkManagerProtocol {
   func getNewsItems<T:Codable>(type: T.Type, completion: @escaping (Result<T,Error>) -> Void) {
        
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-04-22&sortBy=publishedAt&apiKey=c90d4a2d6160425f89f9b72d56f77c90") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let result = try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
}
