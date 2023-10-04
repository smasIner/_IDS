//
//  UserInput.swift
//  HW3
//
//  Created by Murat Shaikhutdinov on 02.10.2023.
//

import UIKit

class UserInput: UIView {
    var userBadge: UserBadge?
    
    func setUserBadge(_ badge: UserBadge) {
            userBadge = badge
    }
    
    let nameField: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter name"
        text.borderStyle = .roundedRect
        return text
    }()
    
    let surnameField: UITextField = {
        let text = UITextField()
        text.placeholder = "Enter surname"
        text.borderStyle = .roundedRect
        return text
    }()
    
    let buttonToChange: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside) // Use 'self' as the target
        return button
    }()
    
    @objc func submitButtonPressed() {
        guard let userBadge = userBadge else {
            return
        }

        let newName = nameField.text ?? ""
        let newSurname = surnameField.text ?? ""
        userBadge.configure(withName: newName, surname: newSurname)
    }
    
    
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
        
        addSubview(nameField)
        addSubview(surnameField)
        addSubview(buttonToChange)
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        surnameField.translatesAutoresizingMaskIntoConstraints = false
        buttonToChange.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            nameField.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            surnameField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 16),
            surnameField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            surnameField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            buttonToChange.topAnchor.constraint(equalTo: surnameField.bottomAnchor, constant: 16),
            buttonToChange.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonToChange.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonToChange.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(withName name: String, surname: String) {
        nameField.text = name
        surnameField.text = surname
    }
}


