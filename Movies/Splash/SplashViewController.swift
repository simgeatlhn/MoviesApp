//
//  SplashViewController.swift
//  Movies
//
//  Created by simge on 26.06.2022.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    
    let splashView = AnimationView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAnimation()
        makeSplashView()
        
    }
    
    private func setUpAnimation() {
        splashView.animation = Animation.named("movies")
        splashView.frame = view.bounds
        splashView.contentMode = .scaleAspectFit
        splashView.loopMode = .loop
        splashView.backgroundColor = .black
        view.addSubview(splashView)
        splashView.play()
    }
}

extension SplashViewController {
    func makeSplashView () {
        splashView.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(240)
            make.left.equalToSuperview().offset(60)
            make.width.equalTo(400)
            make.height.equalTo(400)
        }
    }
}
