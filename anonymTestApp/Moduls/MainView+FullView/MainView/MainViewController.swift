//
//  FullNoteView.swift
//  anonymTestApp
//
//  Created by Malygin Georgii on 23.09.2020.
//

import UIKit

class MainViewController: UIViewController {
    var viewModel: MainViewModelInterface
    var tableView = UITableView()
    
    private lazy var segment: UISegmentedControl = {
        let segment = UISegmentedControl()
        let seg = [API.createdAt, API.mostCommented, API.mostPopular]
        segment.removeAllSegments()
        for i in 0...2 {
            segment.insertSegment(withTitle: seg[i], at: i, animated: true)
        }
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(segmentName(_:)), for: .allEvents)
        return segment
    }()
    
    override func viewDidLoad() {
        setupView()
        viewModel.getModelView()
        configureView()
        super.viewDidLoad()
    }
    
    func configureView() {
        viewModel.updateView = {
            self.tableView.reloadData()
        }
        viewModel.showMassege = {
            let alert = UIAlertController(title: "Ошибка", message: "Обновите данныу ", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Обновить", style: .default, handler: { [weak self] action in
                self?.tableView.reloadData()
                self?.viewModel.getModelView()
            })
            alert.addAction(alertAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func setupView(){
        title = "AnonymTest"
        setuptableView()
    }
    
    func setuptableView() {
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.reuseId)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        setupConstr()
        configureBar()
    }
    
    func configureBar() {
        navigationItem.titleView = segment
    }
    
    func setupConstr() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    required init(container: Container) {
        viewModel = container.viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func segmentName(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            viewModel.segmentContols = API.createdAt
        }
        if sender.selectedSegmentIndex == 1 {
            viewModel.segmentContols = API.mostCommented
        }
        if sender.selectedSegmentIndex == 2 {
            viewModel.segmentContols = API.mostPopular
        }
    }
}

extension MainViewController: Injectable {
    struct Container {
        let viewModel: MainViewModelInterface
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard var indexRefresh = viewModel.itemsView?.count else { return UITableViewCell()
        }
        indexRefresh -= 1
        if indexPath.row == indexRefresh {
            viewModel.getNewPost()
        }
        
        guard var cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.reuseId, for: indexPath) as? MainViewCell else {
            return UITableViewCell()
        }
        cell = MainViewCell(style: .subtitle, reuseIdentifier: MainViewCell.reuseId)
        
        guard let items = viewModel.itemsView?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(photoItem: viewModel.createItems(items: items).photoItems,
                      photoText: viewModel.createItems(items: items).textPhotoItems,
                       photoTags: viewModel.createItems(items: items).tagsItem,
                       countLikes: viewModel.createItems(items: items).countLikes,
                       countComment: viewModel.createItems(items: items).countComments)
        return cell
     }
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = viewModel.itemsView?.count else {
            return 1
        }
        return count
     }
     
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let note = viewModel.itemsView?[indexPath.row] else {
            return
        }
        viewModel.showFullPost(post: note)
     }
    
}
