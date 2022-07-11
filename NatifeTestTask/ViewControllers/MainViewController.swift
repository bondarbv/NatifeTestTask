//
//  MainViewController.swift
//  NatifeTestTask
//
//  Created by Bohdan on 11.07.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainTableView: UITableView!
    
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
    func configureNavigationBar() {
        navigationItem.title = "Natife"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "filterbutton"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(filterTableView))
        navigationItem.rightBarButtonItem?.tintColor = #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2274509804, green: 0.3254901961, blue: 0.3647058824, alpha: 1)]
    }
    
    //MARK: - Creating a TableView
    func creatingTableView() {
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
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id)
                as? CustomTableViewCell else { return UITableViewCell() }
        cell.titleLabel.text = "Some title some title some title"
        cell.descriptionLabel.text = "Some text some text some text some text some text some text some text some text some text some text some text some text some text Some text some text some text some text some text some text some text some text some text some text some text some text some text "
        cell.likesLabel.text = "❤️1957"
        cell.dateLabel.text = "21 day ago"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
