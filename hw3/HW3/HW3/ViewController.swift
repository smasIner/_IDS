//
//  ViewController.swift
//  HW3
//
//  Created by Murat Shaikhutdinov on 02.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        view.backgroundColor = UIColor(red: 0.22745098039215686, green: 0.4196078431372549, blue: 0.20784313725490197, alpha: 1)
        let userBadge = UserBadge()
        view.addSubview(userBadge)
        
        // Set constraints for UserBadge
        userBadge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userBadge.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            userBadge.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            userBadge.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            userBadge.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1.0/3.0), // Take up to 1/3 of safe zone's height
        ])
        
        userBadge.configure(withName: "Murat", surname: "Shaikhutdinov", profileImage: UIImage(named: "ProfilePhoto"))
        
        let userInput = UserInput()
        view.addSubview(userInput)
        userInput.setUserBadge(userBadge)
        userInput.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                userInput.topAnchor.constraint(equalTo: userBadge.bottomAnchor, constant: 16),
                userInput.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                userInput.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                userInput.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)])
        userInput.configure(withName: "", surname: "")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("viewDidDisappear")
    }

}

