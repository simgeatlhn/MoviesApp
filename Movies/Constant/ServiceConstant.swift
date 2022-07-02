//
//  ServiceConstant.swift
//  Movies
//
//  Created by simge on 25.06.2022.
//

import UIKit

extension Constant {
        enum ServiceEndPoint: String {
            
            case BASE_URL = "https://api.themoviedb.org/3/movie/popular?"
            case API_KEY = "api_key=e5e53be04ee69876048348f02f71cea5&language=en-US&page=2"
            case IMAGE_BASE_URL = "https://image.tmdb.org/t/p/w500"
            
            static func fetchMovies() -> String {
                "\(ServiceEndPoint.BASE_URL.rawValue)\(ServiceEndPoint.API_KEY.rawValue)"
            }
            
            static func fetchMovieImage()->String{
                "\(ServiceEndPoint.IMAGE_BASE_URL.rawValue)\(ServiceEndPoint.API_KEY.rawValue)"
            }
    }
}

