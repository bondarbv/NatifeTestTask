//
//  MainViewController.swift
//  NatifeTestTask
//
//  Created by Bohdan on 11.07.2022.
//

import UIKit

final class MainViewController: UIViewController {
    
    private var model = PostsModel()
    private var posts = [Post]()
    
    private var mainTableView: UITableView!
    
    //MARK: - ViewLifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavigationBar()
        creatingTableView()
        model.delegate = self
        model.getPosts()
        
    }
    
    //MARK: - NavigationBar configuration
    private func configureNavigationBar() {
        navigationItem.title = "Natife"
        
        let items = UIMenu(title: "More", options: .displayInline, children: [
        UIAction(title: "Sorting by date", image: UIImage(systemName: "calendar.badge.clock"), handler: { [unowned self] _ in
            self.posts.sort(by: { $0.timeshamp! > $1.timeshamp! })
            self.mainTableView.reloadData()
        }),
        UIAction(title: "Sorting by likes", image: UIImage(systemName: "heart"), handler: { [unowned self] _ in
            self.posts.sort(by: { $0.likesCount! > $1.likesCount! })
            self.mainTableView.reloadData()
        }),
        ])
        
        let menu = UIMenu(title: "Select a sorting method", children: [items])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "", image: UIImage(named: "filterbutton"), primaryAction: nil, menu: menu)
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
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.id)
                as? CustomTableViewCell else { return UITableViewCell() }
        let post = posts[indexPath.row]
        cell.setupCell(post)
        
        cell.handleState = {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsViewController = DetailsViewController()
        print(posts[indexPath.row].postID)
        navigationController?.pushViewController(detailsViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: PostsModelDelegate {
    func postsFetched(_ posts: [Post]) {
        self.posts = posts
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}
