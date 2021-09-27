//
//  URLSessionHttpClient.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

final class URLSessionHttpClient: ApiClient {
    let session = URLSession.shared
    
    func perform(urlRequest: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
        session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            completion(.success(data))
        }.resume()
    }
}
