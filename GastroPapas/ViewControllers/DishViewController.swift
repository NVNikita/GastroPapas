//
//  DishViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 20.10.2025.
//

import UIKit

final class DishViewController: UIViewController {
    
    var dish: Dish?
    
    private lazy var imageDish: UIImageView = {
        let imageDish = UIImageView()
        imageDish.contentMode = .scaleAspectFill
        return imageDish
    }()
    
    private lazy var titleDish: UILabel = {
        let titleDish = UILabel()
        titleDish.font = .systemFont(ofSize: 20, weight: .bold)
        titleDish.textColor = .white
        titleDish.textAlignment = .center
        titleDish.numberOfLines = 0
        return titleDish
    }()
    
    private lazy var descriptionDish: UILabel = {
        let descriptionDish = UILabel()
        descriptionDish.font = .systemFont(ofSize: 17, weight: .regular)
        descriptionDish.textColor = .white
        descriptionDish.textAlignment = .center
        descriptionDish.numberOfLines = 0
        return descriptionDish
    }()
    
    private lazy var priceDish: UILabel = {
        let priceDish = UILabel()
        priceDish.font = .systemFont(ofSize: 17, weight: .regular)
        priceDish.textColor = .white
        priceDish.textAlignment = .center
        return priceDish
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton(type: .system)
        addButton.setTitle("Добавить в корзину", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .systemRed
        addButton.layer.masksToBounds = true
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return addButton
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(cancelButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupConstraints()
        updateUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(imageDish)
        view.addSubview(cancelButton)
        view.addSubview(titleDish)
        view.addSubview(descriptionDish)
        view.addSubview(priceDish)
        view.addSubview(addButton)
        
        imageDish.translatesAutoresizingMaskIntoConstraints = false
        titleDish.translatesAutoresizingMaskIntoConstraints = false
        descriptionDish.translatesAutoresizingMaskIntoConstraints = false
        priceDish.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            cancelButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cancelButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cancelButton.heightAnchor.constraint(equalToConstant: 44),
            cancelButton.widthAnchor.constraint(equalToConstant: 44),
            
            imageDish.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageDish.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageDish.topAnchor.constraint(equalTo: view.topAnchor),
            imageDish.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.1),
            
            titleDish.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleDish.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleDish.topAnchor.constraint(equalTo: imageDish.bottomAnchor, constant: 30),
            
            descriptionDish.leadingAnchor.constraint(equalTo: titleDish.leadingAnchor),
            descriptionDish.trailingAnchor.constraint(equalTo: titleDish.trailingAnchor),
            descriptionDish.topAnchor.constraint(equalTo: titleDish.bottomAnchor, constant: 30),
            
            addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.heightAnchor.constraint(equalToConstant: 50),
            
            priceDish.leadingAnchor.constraint(equalTo: titleDish.leadingAnchor),
            priceDish.trailingAnchor.constraint(equalTo: titleDish.trailingAnchor),
            priceDish.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: 20)
        ])
    }
    
    private func updateUI() {
        guard let dish = dish else { return }
        
        imageDish.image = UIImage(named: dish.imageURL)
        titleDish.text = dish.name
        descriptionDish.text = dish.description
        priceDish.text = "\(dish.price)₽"
    }
    
    @objc private func addButtonTapped() {
        
    }
    
    @objc private func cancelButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
