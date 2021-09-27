//
//  GetNewsTopHeadlinesComposer.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation

import UIKit

public final class GetNewsTopHeadlinesComposer {
    private init(){}
    
    public static func composedWith(getNewsTopHeadlinesLoader: GetNewsTopHeadlinesLoader) -> GetNewsTopHeadlinesViewController {
        let viewModel = GetNewsTopHeadlinesViewModel(getNewsTopHeadlinesLoader: getNewsTopHeadlinesLoader)
        let viewController = GetNewsTopHeadlinesViewController(viewModel: viewModel)
        return viewController
        
    }
}
