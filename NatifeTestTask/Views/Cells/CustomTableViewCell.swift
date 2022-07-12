//
//  CustomTableViewCell.swift
//  NatifeTestTask
//
//  Created by Bohdan on 11.07.2022.
//

import UIKit

final class CustomTableViewCell: UITableViewCell {
    
    //MARK: - Cell ID
    static let id = "CustomCell"
    
    public var handleState: (() -> Void) = { }
    
    private enum DescriptionState {
        case collapse
        case expand
        
        mutating func toggle() {
            switch self {
            case .collapse: self = .expand
            case .expand: self = .collapse
            }
        }
    }
    
    private var descriptionState = DescriptionState.collapse
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 25)
        label.textColor = #colorLiteral(red: 0.2775951028, green: 0.3229554296, blue: 0.369166106, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        label.textColor = #colorLiteral(red: 0.5298442841, green: 0.5901135802, blue: 0.6659915447, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = #colorLiteral(red: 0.5298442841, green: 0.5901135802, blue: 0.6659915447, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.textColor = #colorLiteral(red: 0.5298442841, green: 0.5901135802, blue: 0.6659915447, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public let descriptionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Expand", for: .normal)
        button.titleLabel?.font = UIFont(name: "SFProDisplay-Regular", size: 18)
        button.backgroundColor = #colorLiteral(red: 0.2775951028, green: 0.3229554296, blue: 0.369166106, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(updateDescriptionLabel), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func updateDescriptionLabel() {
        switch descriptionState {
        case .expand:
            descriptionButton.setTitle("Expand", for: .normal)
            heightAnchor.constraint(equalToConstant: 200).isActive = true
            descriptionLabel.numberOfLines = 2
            handleState()
        case .collapse:
            descriptionButton.setTitle("Collapse", for: .normal)
            heightAnchor.constraint(equalToConstant: 300).isActive = true
            descriptionLabel.numberOfLines = 0
            handleState()
        }
        descriptionState.toggle()
    }
    
    //MARK: - Setup Cell
    func setupCell(natifeInfoModel: NatifeInfoModel) {
        titleLabel.text = natifeInfoModel.title
        descriptionLabel.text = natifeInfoModel.description
        likesLabel.text = "❤️ \(natifeInfoModel.likesTitle)"
        dateLabel.text = natifeInfoModel.dateTitle
    }
    
    //MARK: - Cell Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    private func layout() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(descriptionButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.heightAnchor.constraint(equalToConstant: 25),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            likesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            descriptionButton.topAnchor.constraint(equalTo: likesLabel.bottomAnchor, constant: 20),
            descriptionButton.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionButton.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            descriptionButton.heightAnchor.constraint(equalToConstant: 50),
            descriptionButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
