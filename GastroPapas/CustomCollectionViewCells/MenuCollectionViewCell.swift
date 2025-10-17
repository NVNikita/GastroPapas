//
//  MenuCollectionViewCell.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 12.10.2025.
//

import UIKit

final class MenuCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "menuCell"
    
    lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "photo")
        imageView.image = image
        return imageView
    }()
    
    lazy var titleCellLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionCellLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("Заказать", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        button.backgroundColor = .systemRed
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        activateConstaints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.backgroundColor = .clear
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(titleCellLabel)
        contentView.addSubview(descriptionCellLabel)
        contentView.addSubview(addButton)
        contentView.addSubview(priceLabel)
        
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        titleCellLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionCellLabel.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func activateConstaints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            titleCellLabel.topAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: 10),
            titleCellLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleCellLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            descriptionCellLabel.topAnchor.constraint(equalTo: titleCellLabel.bottomAnchor, constant: 10),
            descriptionCellLabel.leadingAnchor.constraint(equalTo: titleCellLabel.leadingAnchor),
            descriptionCellLabel.trailingAnchor.constraint(equalTo: titleCellLabel.trailingAnchor),
            
            addButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            addButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            addButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            addButton.heightAnchor.constraint(equalToConstant: 44),
            
            priceLabel.bottomAnchor.constraint(equalTo: addButton.topAnchor, constant: -5),
            priceLabel.leadingAnchor.constraint(equalTo: titleCellLabel.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: titleCellLabel.trailingAnchor),
            
        ])
    }
    
    @objc private func addButtonTapped() {
        
    }
}
