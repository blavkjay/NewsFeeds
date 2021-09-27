//
//  NewsTopHeadlinesTableViewCell.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation
import UIKit

final class NewsTopHeadlinesTableViewCell: UITableViewCell {
    
    var opacityContainer: UIView = {
       let v = UIView()
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        v.backgroundColor = .black.withAlphaComponent(0.4
        )
        return v
    }()
    
    var newsImageView: UIImageView = {
       let v = UIImageView()
        v.layer.cornerRadius = 8
        v.clipsToBounds = true
        v.contentMode = .scaleToFill
       return v
    }()
    
    var newsTitleLabel : UILabel = {
        let v  = UILabel()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.text = "Let go Let go Let go Let go Let go"
        v.textAlignment = .left
        v.font = UIFont.boldSystemFont(ofSize: 16)
        v.textColor = .white
        v.numberOfLines = 2
        return v
    }()
  
  var authorNameLabel : UILabel = {
      let v  = UILabel()
      v.translatesAutoresizingMaskIntoConstraints = false
      v.text = "Stuff stuff"
      v.textAlignment = .left
      v.numberOfLines = 0
      v.textColor = .white
      return v
  }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        contentView.addSubview(newsImageView)
        contentView.addSubview(opacityContainer)
        newsImageView.addSubview(newsTitleLabel)
        newsImageView.addSubview(authorNameLabel)
    }
    
    private func setupConstraints() {
        newsImageView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 0, height: 160))
        opacityContainer.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 0, height: 160))
        newsTitleLabel.anchor(top: nil, leading: newsImageView.leadingAnchor, bottom: nil, trailing: newsImageView.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 0, right: 10))
        authorNameLabel.anchor(top: newsTitleLabel.bottomAnchor, leading: newsImageView.leadingAnchor, bottom: newsImageView.bottomAnchor, trailing: newsImageView.trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure(with data: Article?) {
        ImageCacheManager.fetchImageData(from: data?.urlToImage ?? "") { imageData in
            DispatchQueue.main.async { [weak self] in
                let image: UIImage = UIImage(data: imageData as Data) ?? UIImage()
                self?.newsImageView.image = image
            }
        }
        newsTitleLabel.text = data?.descriptionField
        authorNameLabel.text = data?.author
    }
    
}

