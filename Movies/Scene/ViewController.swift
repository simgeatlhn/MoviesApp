//
//  ViewController.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import UIKit

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    func drawDesign() {
        view.backgroundColor = UIColor(red: 160/255, green: 188/255, blue: 194/255, alpha: 1)
        title = "Movies"
    }
    
    func configure() {
           let vc1 = UINavigationController(rootViewController: MoviesViewController())
           let vc2 = UINavigationController(rootViewController: BookmarkViewController())
    
           self.tabBar.tintColor = .black
           self.tabBar.backgroundColor =  UIColor(red: 218/255, green: 234/255, blue: 241/255, alpha: 1)
           
           self.setViewControllers([vc1, vc2], animated: false)
           
           guard let items = self.tabBar.items else { return }
           let images = ["film","bookmark"]
           for item  in 0..<items.count {
               items[item].image = UIImage(systemName: images[item])
           }
       }
}


