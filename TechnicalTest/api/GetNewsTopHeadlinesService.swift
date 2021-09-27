//
//  GetNewsTopHeadlinesService.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

public final class GetNewsTopHeadlinesService: GetNewsTopHeadlinesLoader {

    private let apiClient : ApiClient
    
    public init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }
    
    public func getNewsTopHeadlines(completion: @escaping (GetNewsTopHeadlinesLoader.Result) -> Void) {
        var urlRequest = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=2d021085c2e64c23927ff485d9f4299b")!)
        urlRequest.httpMethod = "GET"
        apiClient.perform(urlRequest: urlRequest) { result in
            switch result {
            case .success((let data)):
                guard let data = data else {
                    return
                }
                let decodeData = try? JSONDecoder().decode(RemoteGetNewsTopHeadlinesResponseModel.self, from: data)
                guard let response = decodeData else { return }
                completion(.success(response.toModel()))
            case .failure(let error):
                completion(.failure(.init(message: error.localizedDescription)))
            }
        }
        
    }
    
}
