//
//  ViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 26.09.2025.
//

import UIKit

class MenuViewController: UIViewController {
    
    var menuData: MenuResponse?
    
    private lazy var menuCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(MenuCollectionViewCell.self,
                                forCellWithReuseIdentifier: MenuCollectionViewCell.reuseIdentifier)
        collectionView.backgroundColor = .black
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupUI()
        setupCollectionsView()
        setupConstraints()
        loadMenuData()
    }
    
    private func loadMenuData() {
        guard let url = Bundle.main.url(forResource: "menu_data", withExtension: "json") else {
            print("JSON not founds")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            menuData = try decoder.decode(MenuResponse.self, from: data)
            
            menuCollectionView.reloadData()
            
            print("Load categoris: \(menuData?.menuCategory.count ?? 0)")
        } catch {
            print("Error loading: \(error)")
        }
    }
    
    private func setupNavigationBar() {
        title = "Основное меню"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        view.addSubview(menuCollectionView)
        
        menuCollectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupCollectionsView() {
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            menuCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            menuCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let allDishes = menuData?.menuCategory.flatMap { $0.dishes } ?? []
        return allDishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let allDishes = menuData?.menuCategory.flatMap { $0.dishes } ?? []
        let dish = allDishes[indexPath.item]
        
        cell.titleCellLabel.text = dish.name
        cell.photoImageView.image = UIImage(named: dish.imageURL)
        cell.priceLabel.text = "\(dish.price) ₽"
        
        
        cell.backgroundColor = .white
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing: CGFloat = 12
        let totalSpacing = spacing * 3
        let width = (collectionView.bounds.width - totalSpacing) / 2
        let imageHeight = width - 16
        let height = imageHeight + 50 + 20 + 44 + 32
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 12, bottom: 16, right: 12)
    }
}
