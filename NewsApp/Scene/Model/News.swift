//
//  News.swift
//  NewsApp
//
//  Created by Buğra Özuğurlu on 22.05.2023.
//
import Foundation

// MARK: - SearchResult
struct News: Codable {
    let articles: [Article]
}
// MARK: - Article
struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String?
    let urlToImage: String?
    let publishedAt: String
    let content: String
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String
}
