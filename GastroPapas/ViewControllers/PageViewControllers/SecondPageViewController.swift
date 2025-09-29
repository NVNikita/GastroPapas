//
//  SecondPageViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 26.09.2025.
//

import UIKit

final class SecondPageViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Бронь столика"
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonSkip: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Забронировать столик", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(buttonSkipTapped), for: .touchUpInside)
        return button
    }()
    
    private let backgrountImageView: UIImageView = {
        let backgroundView = UIImageView()
        let image = UIImage(named: "SecondPageView")
        backgroundView.image = image
        backgroundView.alpha = 0.8
        return backgroundView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        activateConstraints()
    }
    
    private func setupUI(){
        view.addSubview(backgrountImageView)
        view.addSubview(titleLabel)
        view.addSubview(buttonSkip)
        
        backgrountImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        buttonSkip.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstraints(){
        NSLayoutConstraint.activate([
            backgrountImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgrountImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgrountImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgrountImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgrountImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgrountImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            buttonSkip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            buttonSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            buttonSkip.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            buttonSkip.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func buttonSkipTapped() {
        let contactsVC = ContactsViewController()
        contactsVC.modalPresentationStyle = .fullScreen
        present(contactsVC, animated: true)
    }
}
