//
//  FeedViewController.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.03.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    let post = Post(title: "Post")
    
    lazy private var firstButton: UIButton = {
        var firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = .systemPink
        firstButton.layer.cornerRadius = 25
        firstButton.setTitle("One", for: .normal)
        firstButton.setTitleColor(.white, for: .highlighted)
        firstButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        return firstButton
    }()
        
        
    lazy private var secondButton: UIButton = {
        var secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = .systemIndigo
        secondButton.layer.cornerRadius = 25
        secondButton.setTitle("Two", for: .normal)
        secondButton.setTitleColor(.white, for: .highlighted)
        secondButton.addTarget(self, action: #selector(openPost), for: .touchUpInside)
        return secondButton
    }()
    
    lazy private var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .systemGray3
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        self.view.addSubview(stackView)
        stackView.addArrangedSubview(firstButton)
        stackView.addArrangedSubview(secondButton)
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        view.backgroundColor = .systemGray3
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: self.view.bounds.width/1.1),
            stackView.heightAnchor.constraint(equalToConstant: self.view.bounds.height/4)
        ])
    }

    
        @objc func openPost() {
            let postVC = PostViewController()
            navigationController?.pushViewController(postVC, animated: true)
        }
}
