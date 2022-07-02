//
//  MoviesViewController.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import UIKit
import SnapKit

class MoviesViewController: UIViewController {
    
    let viewModel = MovieViewModel()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 200
        tableView.backgroundColor = UIColor(red: 160/255, green: 188/255, blue: 194/255, alpha: 1)
        tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: MoviesTableViewCell.Identifier.custom.rawValue) //**
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
        loadMoviesData()
    }
    
    func configure() {
        title = "Movies"
        view.addSubview(tableView)

        makeTableView()
    }
    
    
    func loadMoviesData() {
        viewModel.fetchMoviesData {
            self.tableView.dataSource = self
            self.tableView.delegate = self
            self.tableView.reloadData()
        }
    }
}

extension MoviesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MoviesTableViewCell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.Identifier.custom.rawValue) as? MoviesTableViewCell else {
            return UITableViewCell()
        }
        
        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        cell.setCellWithValuesOf(movie: movie)
        cell.backgroundColor = UIColor(red: 160/255, green: 188/255, blue: 194/255, alpha: 1)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = MovieDetailViewController(movie: viewModel.cellForRowAt(indexPath:indexPath))
        show(vc, sender: self)
    }
    
}


extension MoviesViewController {
    func makeTableView() {
        tableView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalToSuperview()
        }
    }
}




