//
//  GetNewsTopHeadlinesLayout.swift
//  TechnicalTest
//
//  Created by Admin on 27/09/2021.
//

import Foundation
import UIKit

public final class GetNewsTopHeadlinesLayout: UIView {
    
    var data : [Article]? {
        didSet {
            DispatchQueue.main.async {
                self.newsTopHeadlinesTableView.reloadData()
            }
        }
    }
    
    var isLoading: Bool = false {
        didSet {
            DispatchQueue.main.async {
                if self.isLoading {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    let newsTopHeadlinesTableView = UITableView()
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var didSelectNews: ((String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(newsTopHeadlinesTableView)
        addSubview(activityIndicator)
        activityIndicator.center = self.center
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        newsTopHeadlinesTableView.delegate = self
        newsTopHeadlinesTableView.dataSource = self
        newsTopHeadlinesTableView.separatorStyle = .none
        newsTopHeadlinesTableView.register(NewsTopHeadlinesTableViewCell.self, forCellReuseIdentifier: "\(NewsTopHeadlinesTableViewCell.self)")
        newsTopHeadlinesTableView.estimatedRowHeight = 50
        newsTopHeadlinesTableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setupConstraints() {
        newsTopHeadlinesTableView.fillSuperview()
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    
}

extension GetNewsTopHeadlinesLayout: UITableViewDelegate, UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = newsTopHeadlinesTableView.dequeueReusableCell(withIdentifier: "\(NewsTopHeadlinesTableViewCell.self)", for: indexPath) as? NewsTopHeadlinesTableViewCell else {
            return UITableViewCell()}
        cell.configure(with: data?[indexPath.row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let data = data else { return }
        guard let url = data[indexPath.row].url else { return }
        didSelectNews?(url)
    }
}
