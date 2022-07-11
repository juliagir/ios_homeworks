//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Julia Ghirnic on 26.05.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire = "PostTableViewCell"
    
    
    var authorView: UILabel = {
        let authorView = UILabel()
        authorView.toAutoLayout()
        authorView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorView.textColor = .black
        authorView.numberOfLines = 2
        
        return authorView
    }()
    
    var descriptionView: UILabel = {
        let descriptionView = UILabel()
        descriptionView.toAutoLayout()
        descriptionView.font = UIFont.systemFont(ofSize: 14)
        descriptionView.textColor = UIColor.systemGray
        descriptionView.numberOfLines = 0
        return descriptionView
    }()
    
    var postImage: UIImageView = {
       let image = UIImageView()
        image.toAutoLayout()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    var likesView: UILabel = {
        let likesView = UILabel()
        likesView.toAutoLayout()
        likesView.font = UIFont.systemFont(ofSize: 16)
        likesView.textColor = .black
        return likesView
    }()
    
    var viewsView: UILabel = {
        let viewsView = UILabel()
        viewsView.toAutoLayout()
        viewsView.font = UIFont.systemFont(ofSize: 16)
        viewsView.textColor = .black
        return viewsView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(authorView, descriptionView, postImage, likesView, viewsView)
        useConstraint()
    }
    
    public func configureCell(author: String, description: String, image: String, likes: Int, views: Int) {
        self.authorView.text = author
        self.descriptionView.text = description
        self.postImage.image = UIImage(named: image)
        self.likesView.text = "Likes: \(likes)"
        self.viewsView.text = "Views: \(views)"
    }
 
    func useConstraint(){
        NSLayoutConstraint.activate([
            
            contentView.widthAnchor.constraint(equalTo: self.widthAnchor),
            
            authorView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Const.indent),
            authorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            authorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            
            descriptionView.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: Const.indent),
            descriptionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            descriptionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            postImage.topAnchor.constraint(equalTo: authorView.bottomAnchor, constant: Const.indent),
            
            likesView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: Const.indent),
            likesView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
            likesView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: Const.trailingMargin),
            
            viewsView.topAnchor.constraint(equalTo: descriptionView.bottomAnchor, constant: Const.indent),
            viewsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
            viewsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Const.indent),
        ])
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implimented")
    }
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
