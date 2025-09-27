//
//  FirstPageViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 26.09.2025.
//

import UIKit

final class FirstPageViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Добро пожаловать\nв GastroПапы"
        label.textColor = .white
        label.font = .systemFont(ofSize: 34, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let buttonSkip: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Меню", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 16
        button.addTarget(FirstPageViewController.self, action: #selector(buttonSkipTapped), for: .touchUpInside)
        return button
    }()
    
    private let backgrountImageView: UIImageView = {
        let backgroundView = UIImageView()
        let image = UIImage(named: "FirstPageView")
        backgroundView.image = image
        backgroundView.contentMode = .scaleAspectFill
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
        print("buttonSkipTapped worked")
    }
}
