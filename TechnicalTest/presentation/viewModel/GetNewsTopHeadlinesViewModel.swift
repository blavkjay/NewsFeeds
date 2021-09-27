//
//  GetNewsTopHeadlinesViewModel.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

public class GetNewsTopHeadlinesViewModel {
    
    let getNewsTopHeadlinesLoader: GetNewsTopHeadlinesLoader
    
    init(getNewsTopHeadlinesLoader: GetNewsTopHeadlinesLoader){
        self.getNewsTopHeadlinesLoader = getNewsTopHeadlinesLoader
    }
    
    var onload: (() -> Void)?
    var onSuccess: ((GetNewsTopHeadlinesResponseModel) -> Void)?
    var onError: ((String) -> Void)?
    
    func getNewsTopHeadlines() {
        onload?()
        getNewsTopHeadlinesLoader.getNewsTopHeadlines {[weak self] result  in
            switch result {
            case let .success(model):
                self?.onSuccess?(model)
            case let .failure(error):
                self?.onError?(error.message)
            }
        }
    }
    
}
