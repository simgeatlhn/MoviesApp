//
//  BookmarkViewController.swift
//  Movies
//
//  Created by simge on 19.06.2022.
//

import UIKit
import SnapKit

class BookmarkViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
       
    }
    
    private func configure() {
        drawDesign()
    }
    
    private func drawDesign() {
        view.backgroundColor = UIColor(red: 160/255, green: 188/255, blue: 194/255, alpha: 1)
        title = "Bookmark"
    }
}



