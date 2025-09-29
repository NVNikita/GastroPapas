//
//  ContactsViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 28.09.2025.
//

import UIKit

final class ContactsViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "imageViewContacts")
        imageView.image = image
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    private lazy var timeImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "clock")
        imageView.image = image
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var adressImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "house.fill")
        imageView.image = image
        imageView.tintColor = .white
        return imageView
    }()
    
    private lazy var labelTime: UILabel = {
        let label = UILabel()
        label.text = "Режим работы\n\nВС-ЧТ 11:00 - 22:00\n\nПТ-СБ 11:00 - 23:00"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelAdress: UILabel = {
        let label = UILabel()
        label.text = "Балашиха\n\nпр-т Ленина 32а\n\nЖК Акварели"
        label.font = .systemFont(ofSize: 17, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var buttonCall: UIButton = {
        let buttonCall = UIButton(type: .system)
        buttonCall.setTitle("Позвонить", for: .normal)
        buttonCall.titleLabel?.font = .systemFont(ofSize: 17, weight: .light)
        buttonCall.setTitleColor(.white, for: .normal)
        buttonCall.backgroundColor = .systemRed
        buttonCall.layer.masksToBounds = true
        buttonCall.layer.cornerRadius = 16
        buttonCall.addTarget(self, action: #selector(buttonCallTapped), for: .touchUpInside)
        return buttonCall
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        activateUI()
        activateConstraints()
    }
    
    private func activateUI() {
        view.addSubview(imageView)
        view.addSubview(labelTime)
        view.addSubview(labelAdress)
        view.addSubview(timeImageView)
        view.addSubview(adressImageView)
        view.addSubview(buttonCall)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelTime.translatesAutoresizingMaskIntoConstraints = false
        labelAdress.translatesAutoresizingMaskIntoConstraints = false
        timeImageView.translatesAutoresizingMaskIntoConstraints = false
        adressImageView.translatesAutoresizingMaskIntoConstraints = false
        buttonCall.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            timeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            timeImageView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            timeImageView.heightAnchor.constraint(equalToConstant: 40),
            timeImageView.widthAnchor.constraint(equalToConstant: 40),
            
            labelTime.centerXAnchor.constraint(equalTo: timeImageView.centerXAnchor),
            labelTime.topAnchor.constraint(equalTo: timeImageView.bottomAnchor, constant: 20),
            
            adressImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -75),
            adressImageView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 50),
            adressImageView.heightAnchor.constraint(equalToConstant: 40),
            adressImageView.widthAnchor.constraint(equalToConstant: 40),
            
            labelAdress.topAnchor.constraint(equalTo: adressImageView.bottomAnchor, constant: 20),
            labelAdress.centerXAnchor.constraint(equalTo: adressImageView.centerXAnchor),
            
            buttonCall.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonCall.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonCall.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonCall.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc private func buttonCallTapped() {
        let phoneNumber = "+79150089167"
        if let url = URL(string: "telprompt://\(phoneNumber)") {
            UIApplication.shared.open(url)
        }
    }
}
