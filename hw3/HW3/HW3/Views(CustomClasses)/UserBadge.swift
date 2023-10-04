//
//  UserBadge.swift
//  HW3
//
//  Created by Murat Shaikhutdinov on 02.10.2023.
//
import UIKit
class UserBadge: UIView {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let surnameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    init() {
        super.init(frame: .zero)
        setupUI()
        backgroundColor = UIColor(red: 0.796078431372549, green: 0.8196078431372549, blue: 0.5607843137254902, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        layer.cornerRadius = 10
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        clipsToBounds = true
        
        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(surnameLabel)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.heightAnchor.constraint(equalToConstant: 160),
            
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 13),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            
            surnameLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            surnameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            surnameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    func configure(withName name: String, surname: String, profileImage: UIImage?) {
        nameLabel.text = name
        surnameLabel.text = surname
        profileImageView.image = profileImage
    }
    func configure(withName name: String, surname: String) {
        nameLabel.text = name
        surnameLabel.text = surname
    }
    
}


