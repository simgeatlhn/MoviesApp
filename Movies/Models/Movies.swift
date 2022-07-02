//
//  Movies.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import Foundation


struct MovieModel {
    let results: [Result]?
}

struct Result {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverange: Double
    let voteCount: Int
    let runtime: Int?
}
