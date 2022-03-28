//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let header = ProfileHeaderView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.view.addSubview(header)
        title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        
        header.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            header.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            header.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            header.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            header.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
