//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Profile"
        view.backgroundColor = .lightGray
        
        let header = ProfileHeaderView()
        view.addSubview(header)
        
        header.setupView()
        
        let titleButton = UIButton()
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        titleButton.backgroundColor = .systemMint
        titleButton.setTitle("New title", for: .normal)
        titleButton.setTitleColor(.white, for: .highlighted)
        titleButton.addTarget(self, action: #selector(newTitle), for: .touchUpInside)
        
        view.addSubview(titleButton)
        
        titleButton.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        titleButton.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        titleButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        titleButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
      
    }
    
    @objc func newTitle() {
        self.title = "New title"
    }
    
}
