//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.03.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    var userName: UILabel
    var userPic: UIImageView
    var status: UILabel
    var statusButton: UIButton
    var setStatusField: UITextField
    
    private var statusText = ""
    
    init() {
        
        userName = UILabel()
        userPic = UIImageView(image: UIImage(named: "988"))
        status = UILabel()
        statusButton = UIButton()
        setStatusField = UITextField()
        
        super.init(frame: CGRect())
        
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.text = "Albert Einstein"
        userName.textAlignment = .natural
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.addSubview(userName)
        
        userPic.translatesAutoresizingMaskIntoConstraints = false
        userPic.clipsToBounds = true
        userPic.layer.cornerRadius = 50
        userPic.layer.borderWidth = 3
        userPic.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.addSubview(userPic)
        
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Time is an illusion"
        status.textAlignment = .natural
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.isUserInteractionEnabled = true
        self.addSubview(status)
        
        statusButton.translatesAutoresizingMaskIntoConstraints = false
        statusButton.backgroundColor = UIColor(cgColor: CGColor(red: 2/255, green: 122/255, blue: 255/255, alpha: 1))
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowOpacity = 0.7
        statusButton.layer.shadowRadius = 4.2
        statusButton.setTitle("Set status", for: .normal)
        statusButton.setTitleColor(.lightGray, for: .highlighted)
        statusButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        self.addSubview(statusButton)
        
        setStatusField.translatesAutoresizingMaskIntoConstraints = false
        setStatusField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setStatusField.backgroundColor = .white
        setStatusField.textColor = .black
        setStatusField.placeholder = "New status"
        setStatusField.textAlignment = .natural
        setStatusField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setStatusField.frame.height))
        setStatusField.leftViewMode = .always
        setStatusField.layer.borderWidth = 1
        setStatusField.layer.borderColor = UIColor.black.cgColor
        setStatusField.layer.cornerRadius = 12
        setStatusField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        self.addSubview(setStatusField)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Constraints

    override func layoutSubviews() {
        
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            userPic.widthAnchor.constraint(equalToConstant: 100),
            userPic.heightAnchor.constraint(equalTo: userPic.widthAnchor),
            userPic.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            userPic.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            
            userName.leftAnchor.constraint(equalTo: userPic.rightAnchor, constant: 20),
            userName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusButton.topAnchor.constraint(equalTo: userPic.bottomAnchor, constant: 42),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            
            setStatusField.leftAnchor.constraint(equalTo: userPic.rightAnchor, constant: 20),
            setStatusField.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -10),
            setStatusField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            setStatusField.heightAnchor.constraint(equalToConstant: 40),
            
            status.leftAnchor.constraint(equalTo: userPic.rightAnchor, constant: 20),
            status.bottomAnchor.constraint(equalTo: setStatusField.topAnchor, constant: -6),
            status.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16)

        ])
    }
    //MARK: actions
    
    @objc func pressButton() {
        status.text = statusText
        statusText = ""
        setStatusField.text = ""
        setStatusField.resignFirstResponder()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }
    
}
