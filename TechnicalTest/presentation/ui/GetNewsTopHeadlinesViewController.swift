//
//  GetNewsTopHeadlinesViewController.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation
import UIKit

final public class GetNewsTopHeadlinesViewController: UIViewController {
    
    var layout = GetNewsTopHeadlinesLayout()
    var viewModel: GetNewsTopHeadlinesViewModel?
    
    convenience init(viewModel: GetNewsTopHeadlinesViewModel) {
        self.init()
        self.viewModel = viewModel
        view.addSubview(layout)
    }
    
    public override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
        bindView()
        viewModel?.getNewsTopHeadlines()
    }
    
    private func bindView() {
        viewModel?.onload = { [weak self] in
            self?.layout.isLoading = true
        }
        
        viewModel?.onSuccess = {[weak self] data in
            self?.layout.isLoading = false
            self?.layout.data = data.articles
        }
        
        viewModel?.onError = {[weak self] error in
            self?.layout.isLoading = false
            self?.showErrorAlert(message: error)
        }
        
        layout.didSelectNews = { url in
            if let link = URL(string: url) {
                UIApplication.shared.open(link)
            }
        }
    }
    
    private func setupView() {
        view.addSubview(layout)
        layout.fillSuperview()
        title = "NewsFeed"
    }
}

extension GetNewsTopHeadlinesViewController {
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: {  [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
