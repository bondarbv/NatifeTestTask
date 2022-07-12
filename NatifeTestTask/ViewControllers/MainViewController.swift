//
//  MainViewController.swift
//  NatifeTestTask
//
//  Created by Bohdan on 11.07.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    //MARK: - Data for test
    private let natifes: [NatifeInfoModel] = [
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text some text some text some text some text some text some text some text some text some text Some text some text some text some text some text some text some text some text some text some text some text some text some text",
            likesTitle: "1957",
            dateTitle: "21 day ago"),
        
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text some text some text some text some text some text some text some text some text some text Some text some text some text some text some text some text some text some text some text some text some text some text some text ",
            likesTitle: "1957",
            dateTitle: "21 day ago"),
        
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text Some text some text some text some text Some text",
            likesTitle: "1957",
            dateTitle: "21 day ago"),
        
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text some text some text some text some text some text some text some text some text some text Some text some text some text some text some text some text some text some text some text some text some text some text some text ",
            likesTitle: "1957",
            dateTitle: "21 day ago"),
        
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text",
            likesTitle: "1957",
            dateTitle: "21 day ago"),
        
        NatifeInfoModel(
            title: "Some title some title some title",
            description: "Some text some text some text some text some text some text some text some text some text some text some text some text some text Some text some text some text some text some text some text some text some text some text some text some text some text some text ",
            likesTitle: "1957",
            dateTitle: "21 day ago")
    ]
    
    private var mainTableView: UITableView!
    
    //MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        creatingTableView()
    }
    
    @objc private func filterTableView() {
        print("test")
    }
    
    //MARK: - NavigationBar configuration
    private func configureNavigationBar() {
        navigationItem.title = "Natife"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filterbutton"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(filterTableView))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.font: UIFont(name: "SFProDisplay-Bold", size: 20) ?? "",
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)]
    }
    
    //MARK: - Creating a TableView
    private func creatingTableView() {
        mainTableView = UITableView(frame: view.bounds, style: .plain)
        mainTableView.separatorStyle = .none
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.id)
        view.addSubview(mainTableView)
    }
    
}

//MARK: - TableView Delegate & DataSource
extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        natifes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id)
                as? CustomTableViewCell else { return UITableViewCell() }
        cell.setupCell(natifeInfoModel: natifes[indexPath.row])

        if cell.descriptionLabel.numberOfLines == 1 {
            cell.descriptionButton.removeFromSuperview()
            cell.contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        } else if cell.descriptionLabel.numberOfLines == 2 && cell.descriptionLabel.text?.count ?? 0 >= 100 {
            cell.descriptionButton.removeFromSuperview()
            cell.contentView.heightAnchor.constraint(equalToConstant: 125).isActive = true
        }
        
        cell.handleState = {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        return cell
    }
}

//MARK: - Model for test
public struct NatifeInfoModel {
    let title: String
    let description: String
    let likesTitle: String
    let dateTitle: String
}
