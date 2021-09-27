//
//  ApiClient.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

public protocol ApiClient {
    func perform(urlRequest: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void)
}
