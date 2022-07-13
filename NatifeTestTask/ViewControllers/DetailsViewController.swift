//
//  DetailsViewController.swift
//  NatifeTestTask
//
//  Created by Bohdan on 13.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        configureNavigationBar()
    }
    
    private func configureNavigationBar() {
        navigationItem.title = "Natife"
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 20) ?? "",
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)]
    }
    
    private func layout() {
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(likesLabel)
        view.addSubview(dateLabel)
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            likesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor)
        ])
    }
}
