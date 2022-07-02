//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by simge on 20.06.2022.
//

import UIKit
import SnapKit
//import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    
    private var urlString: String = ""
    
    private let title: UILabel = {
        let title = UILabel()
        title.numberOfLines = 0
        title.font = .boldSystemFont(ofSize: 16)
        title.textColor = UIColor(red: 53/255, green: 66/255, blue: 89/255, alpha: 1)
        return title
    }()
    
    private let overview: UILabel = {
        let overView = UILabel()
        overView.numberOfLines = 3
        overView.preferredMaxLayoutWidth = 700
        overView.sizeToFit()
        return overView
    }()
    
    private let rate: UILabel = {
        let rate = UILabel()
        rate.textColor =  UIColor(red: 53/255, green: 66/255, blue: 89/255, alpha: 1)
        rate.font = .boldSystemFont(ofSize: 16)
        return rate
    }()
    
    private let starIcon : UIImageView = {
           let starIcon = UIImageView()
           starIcon.image = UIImage(systemName: "star.circle.fill")
           starIcon.tintColor = UIColor(red: 255/255, green: 225/255, blue: 98/255, alpha: 1)
           return starIcon
    }()
    
    private let moviePoster: UIImageView = {
           let moviePoster = UIImageView()
           moviePoster.layer.cornerRadius = 8
           moviePoster.clipsToBounds = true
           return moviePoster
    }()

    enum Identifier: String {
        case custom = "cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: -Setup movies values
    func setCellWithValuesOf(movie:Movie) {
        updateUI(title:movie.title, rating:movie.rate, overview:movie.overview, poster: movie.posterImage)
    }
    
    
    //MARK: -Update the UI Views
    func updateUI(title: String?, rating: Double?, overview: String?, poster:String?) {
        self.title.text = title
        guard let rate = rating else {return}
        self.rate.text = String(rate)
        self.overview.text = overview
        
        guard let posterString = poster else {return}
             urlString = "https://image.tmdb.org/t/p/w300" + posterString
             
             guard let posterImageURL = URL(string: urlString) else {
                 self.moviePoster.image = UIImage(named: "noImageAvailable")
                 return
             }
             
             self.moviePoster.image = nil
             getImageDataFrom(url: posterImageURL)
             
         }
         
         // MARK: - Get image data
         private func getImageDataFrom(url: URL) {
             URLSession.shared.dataTask(with: url) { (data, response, error) in
                 // Handle Error
                 if let error = error {
                     print("DataTask error: \(error.localizedDescription)")
                     return
                 }
                 
                 guard let data = data else {
                     // Handle Empty Data
                     print("Empty Data")
                     return
                 }
                 
                 DispatchQueue.main.async {
                     if let image = UIImage(data: data) {
                         self.moviePoster.image = image
                     }
                 }
             }.resume()
    }
    
    private func configure() {
        addSubview(title)
        addSubview(overview)
        addSubview(rate)
        addSubview(moviePoster)
        addSubview(starIcon)
        
        makeTitleLabel()
        makeRateLabel()
        makeOverviewLabel()
        makeMovieImage()
        makeStarIcon()
    
    }
}

extension MoviesTableViewCell {
    private func makeTitleLabel() {
        title.snp.makeConstraints { (make) in
            make.top.equalTo(overview.snp.top).offset(10)
            make.left.equalToSuperview().offset(150)
            make.right.equalTo(overview.snp.right).offset(10)
        }
    }
    
    private func makeOverviewLabel() {
        overview.snp.makeConstraints { (make) in
            make.top.equalTo(title).offset(10)
            make.left.equalToSuperview().offset(150)
            make.right.equalToSuperview().offset(10)
            make.bottom.equalTo(title.snp.bottom).offset(150)
        }
    }

    
    private func makeRateLabel() {
        rate.snp.makeConstraints { (make) in
            make.top.equalTo(overview.snp.top).offset(10)
            make.left.equalToSuperview().offset(48)
        }
    }
    
    private func makeMovieImage(){
        moviePoster.snp.makeConstraints{ (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(40)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
    }
    
    private func makeStarIcon() {
        starIcon.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(24)
            make.top.equalTo(overview.snp.top).offset(10)
        }
    }
}


