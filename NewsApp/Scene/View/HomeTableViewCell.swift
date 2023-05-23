//
//  HomeTableViewCell.swift
//  NewsApp
//
//  Created by Buğra Özuğurlu on 22.05.2023.
//

import UIKit
import SnapKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {
    static let identifier = "HomeTableViewCell"
    
    private let newsImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .red
        image.contentMode = .scaleToFill
        return image
    }()
    private let newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    private let newsDescLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    private lazy var newsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [newsTitleLabel, newsDescLabel])
        stack.axis = .vertical
        stack.alignment = .top
        stack.spacing = 10
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout() 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeTableViewCell {
    private func setup() {
        addSubview(newsImageView)
        addSubview(newsStackView)
    }
    private func layout() {
        newsImageView.snp.makeConstraints { make in
            make.top.left.bottom.equalToSuperview().inset(16)
            make.width.equalTo(140)
        }
        newsStackView.snp.makeConstraints { make in
            make.top.equalTo(newsImageView)
            make.left.equalTo(newsImageView.snp.right).offset(16)
            make.right.equalToSuperview().inset(16)
            make.bottom.equalTo(newsImageView)
        }
    }
    func configure(with model: Article) {
        self.newsTitleLabel.text = model.title
        self.newsDescLabel.text = model.description
        self.newsImageView.sd_setImage(with: URL(string: model.urlToImage ?? ""))
    }
}
