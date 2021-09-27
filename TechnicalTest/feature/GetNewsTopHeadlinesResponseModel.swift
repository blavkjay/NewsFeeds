//
//  GetNewsTopHeadlinesResponseModel.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

public struct GetNewsTopHeadlinesResponseModel {
    let articles : [Article]
}

public struct Article {
    
    let author : String?
    let content : String?
    let descriptionField : String?
    let publishedAt : String?
    let source : Source?
    let title : String?
    let url : String?
    let urlToImage : String?
    
}

public struct Source {
    
    let id : String?
    let name : String?
    
}
