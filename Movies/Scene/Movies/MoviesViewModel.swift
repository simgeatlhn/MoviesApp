//
//  MoviesViewModel.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import Foundation


class MovieViewModel {
    
    private var apiService = ApiService()
    private var movies = [Movie]()
    
    func fetchMoviesData(completion: @escaping () -> ()) {
        
        apiService.getMoviesData { [weak self] (result) in
            switch result {
            case .success(let listOf):
                self?.movies = listOf.movies
                completion()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }

    func numberOfRowsInSection(section: Int) -> Int {
        movies.count
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
    
}

