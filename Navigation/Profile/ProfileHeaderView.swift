//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.03.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    private(set) var statusText: String = ""
    static let identifire = "ProfileHeaderView"
    
  
    private(set) lazy var avatarImageView: UIImageView = {
        let avatarImageView = UIImageView()
        avatarImageView.toAutoLayout()
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "988")
        avatarImageView.layer.cornerRadius = 50
        avatarImageView.layer.borderWidth = 3
        avatarImageView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return avatarImageView
    }()
    
    
    private(set) lazy var fullNameLabel: UILabel = {
        let fullNameLabel = UILabel()
        fullNameLabel.toAutoLayout()
        fullNameLabel.text = "Albert Einstein"
        fullNameLabel.textColor = .black
        fullNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return fullNameLabel
    }()
    
    
    private(set) lazy var setStatusButton: UIButton = {
        let setStatusButton = UIButton()
        setStatusButton.toAutoLayout()
        setStatusButton.backgroundColor = UIColor.rgb(2, 122, 255, 1)
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowRadius = 4
        setStatusButton.setTitle("Set status", for: .normal)
        setStatusButton.setTitleColor(.lightGray, for: .highlighted)
        setStatusButton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return setStatusButton
    }()
    
    
    private(set) lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.toAutoLayout()
        statusLabel.text = "Time is an illusion"
        statusLabel.numberOfLines = 2
        statusLabel.textColor = .gray
        statusLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return statusLabel
    }()
    
   
    private(set) lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.toAutoLayout()
        statusTextField.layer.borderWidth = 1
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.cornerRadius = 12
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusTextField.frame.height))
        statusTextField.leftViewMode = .always
        statusTextField.placeholder = "Set status"
        statusTextField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return statusTextField
    }()
    
    
    private func useConstraint() {
        
        NSLayoutConstraint.activate([
            
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Const.leadingMargin),
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: Const.indent),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            fullNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Const.leadingMargin),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: Const.trailingMargin),
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 42),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -6),
            statusLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 20),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            statusTextField.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
        ])
    }
    
    
   
    func addView() {
        contentView.addSubviews(avatarImageView, fullNameLabel, setStatusButton, statusTextField, statusLabel)
        self.useConstraint()
    }
    
    
    @objc func pressButton(){
        if statusLabel.text != nil && statusText != "" {
            statusLabel.text = statusText
            statusTextField.text = ""
            statusTextField.resignFirstResponder()
        }
        
    }
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        guard let text = textField.text else { return }
        statusText = text
    }
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
