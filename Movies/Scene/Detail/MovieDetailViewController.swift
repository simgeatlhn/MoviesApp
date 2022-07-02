//
//  MovieDetailViewController.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {
    
    private let name: UILabel = {
        let name = UILabel()
        name.numberOfLines = 0
        name.font = .boldSystemFont(ofSize: 16)
        name.textColor = UIColor(red: 53/255, green: 66/255, blue: 89/255, alpha: 1)
        return name
    }()
    
    private let overview: UILabel = {
        let overView = UILabel()
        overView.numberOfLines = 10
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
    
    private let favouriteIcon : UIImageView = {
           let favouriteIcon = UIImageView()
           favouriteIcon.image = UIImage(systemName: "heart")
           favouriteIcon.tintColor = .red
           return favouriteIcon
    }()
    
    private let moviePoster: UIImageView = {
           let moviePoster = UIImageView()
           moviePoster.layer.cornerRadius = 4
           moviePoster.clipsToBounds = true
           moviePoster.sizeToFit()
           return moviePoster
    }()
    
    /***/
    private let movies: Movie
    
    init(movie: Movie) {
          self.movies = movie
          super.init(nibName: nil, bundle: nil)
      }
      
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         configure()
         setUpUI()
         makeNameLabel()
         makeOverviewLabel()
         makeRate()
         makeStarIcon()
         makeFavouriteIcon()
         makeMoviePosterImage()
    }
    
    func configure() {
        title = "Movies Detail View"
        
        view.backgroundColor = UIColor(red: 160/255, green: 188/255, blue: 194/255, alpha: 1)
        view.addSubview(name)
        view.addSubview(overview)
        view.addSubview(rate)
        view.addSubview(starIcon)
        view.addSubview(favouriteIcon)
        view.addSubview(moviePoster)
    }
}

private extension MovieDetailViewController {
    private func setUpUI() {
        name.text = movies.title
        overview.text = movies.overview
        rate.text = "\(movies.rate)"
        moviePoster.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w300" + movies.posterImage))

    }
}

extension MovieDetailViewController {
    private func makeNameLabel() {
        name.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(140)
            make.left.equalTo(view.snp.left).offset(16)
        }
    }
    
    private func makeOverviewLabel() {
        overview.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(moviePoster).offset(160)
            make.left.equalTo(view.snp.left).offset(10)
            make.right.equalTo(view.snp.right).offset(-10)
        }
    }
    
    private func makeRate() {
        rate.snp.makeConstraints{ (make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(name.snp.left).offset(24)
            
        }
    }
    
    private func makeStarIcon() {
        starIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.left.equalTo(view.snp.left).offset(16)
            
        }
    }
    
    private func makeFavouriteIcon() {
        favouriteIcon.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.top).offset(100)
            make.right.equalTo(view.snp.right).offset(-20)
            make.width.equalTo(28)
            make.height.equalTo(28)
        }
    }
    
    private func makeMoviePosterImage() {
        moviePoster.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16)
            make.top.equalTo(name.snp.top).offset(30)
            make.width.equalTo(360)
            make.height.equalTo(160)
        }
    }
}



