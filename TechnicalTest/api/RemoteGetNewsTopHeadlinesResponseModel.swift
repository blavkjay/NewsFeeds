//
//  RemoteGetNewsTopHeadlinesResponseModel.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

public struct RemoteGetNewsTopHeadlinesResponseModel: Codable {
    let articles : [RemoteArticle]
    
    enum CodingKeys: String, CodingKey {
        case articles = "articles"
        
    }
    
    func toModel() -> GetNewsTopHeadlinesResponseModel {
        return GetNewsTopHeadlinesResponseModel(articles: articles.map{ $0.toModel()})
    }
    
}

public struct RemoteArticle: Codable {
    
    let author : String?
    let content : String?
    let descriptionField : String?
    let publishedAt : String?
    let source : RemoteSource?
    let title : String?
    let url : String?
    let urlToImage : String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case content = "content"
        case descriptionField = "description"
        case publishedAt = "publishedAt"
        case source = "source"
        case title = "title"
        case url = "url"
        case urlToImage = "urlToImage"
    }
    
    func toModel() -> Article {
        return Article(author: author,
                       content: content,
                       descriptionField: descriptionField,
                       publishedAt: publishedAt,
                       source: source?.toModel(),
                       title: title, url: url,
                       urlToImage: urlToImage)
    }
    
}

public struct RemoteSource: Codable {
    
    let id : String?
    let name : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
    
    func toModel() -> Source {
        return Source(id: id, name: name)
    }
    
}
