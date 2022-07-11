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
            view.backgroundColor = .white
            view.addSubview(postTableView)
            useConstraint()
            postTableView.dataSource = self
            postTableView.delegate = self
            postTableView.refreshControl = UIRefreshControl()
            postTableView.refreshControl?.addTarget(self, action: #selector(updatePostArray), for: .valueChanged)
        }
        
        override func viewWillAppear(_ animated: Bool) {
            navigationController?.navigationBar.isHidden = true
        }
        
      
        private lazy var postTableView: UITableView = {
            let postTableView = UITableView(frame: .zero, style: .grouped)
            postTableView.toAutoLayout()
            postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
            postTableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
            postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifire)
            postTableView.separatorInset = .zero
            return postTableView
        }()
        
     
        private func useConstraint() {
            NSLayoutConstraint.activate([
                postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                postTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                postTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        }
    }


    extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if section == 1 {
                return postArray.count
            } else {
                return 1
            }
            
        }
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 2
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            if indexPath.section == 1 {
                let cell = postTableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
                cell.configureCell(author: postArray[indexPath.row].author,
                                   description: postArray[indexPath.row].description,
                                   image: postArray[indexPath.row].image,
                                   likes: postArray[indexPath.row].likes,
                                   views: postArray[indexPath.row].views)
                return cell
            } else {
                let cell = postTableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifire, for: indexPath) as! PhotosTableViewCell
                return cell
            }
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if indexPath.section == 0 {
                let photoVC = PhotosViewController()
                navigationController?.pushViewController(photoVC, animated: true)
            }
        }
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            if section == 0 {
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
                return headerView
            } else {
                return nil
            }
        }
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            if section == 0 {
                return 220
            } else {
                return 0
            }
        }
    }


    extension ProfileViewController {
        @objc func updatePostArray() {
            print("Количество постов в ленте до обновления данных - \(postArray.count)")
            postArray.append(post1)
            print("Количество постов в ленте после обновления данных - \(postArray.count)")
            postTableView.reloadData()
            postTableView.refreshControl?.endRefreshing()
            print("Данные успешно обновлены")
        }
    }

