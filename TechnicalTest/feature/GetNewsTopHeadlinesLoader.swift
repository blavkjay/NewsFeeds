//
//  GetNewsTopHeadlinesLoader.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation


public struct GetNewsTopHeadlinesError : Error {
    let message : String
}

public protocol GetNewsTopHeadlinesLoader {
    
    typealias Result = Swift.Result<GetNewsTopHeadlinesResponseModel,GetNewsTopHeadlinesError>
    func getNewsTopHeadlines(completion: @escaping (Result) -> Void)
}
