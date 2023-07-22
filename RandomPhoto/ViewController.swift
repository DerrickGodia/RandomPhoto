//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Derrick Oningo on 22/07/2023.
//

import UIKit

class ViewController: UIViewController {
    private  let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private  let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(imageView)
        
        imageView.frame = CGRect(x:0, y:0, width:300, height:300)
        imageView.center = view.center
        view.addSubview(button)
        
        getRandomPhoto()
        button.addTarget(self, action: #selector(didTapButton), for:.touchUpInside)
        // Do any additional setup after loading the view.
    }
    @objc func didTapButton(){
        getRandomPhoto()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(
            x:30,
            y:view.frame.height-150-view.safeAreaInsets.bottom,
            width: view.frame.size.width-60,
            height: 55)
        
    }
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600"
        let url = URL(string: urlString)!
        guard let data = try? Data(contentsOf: url) else{
            return
        }
        imageView.image = UIImage(data: data)
        
    }


}

