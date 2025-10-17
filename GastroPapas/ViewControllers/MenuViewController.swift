//
//  ViewController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 26.09.2025.
//

import UIKit

class MenuViewController: UIViewController {
    
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
    }
    
    
    let imageViews = ["zucchiniPancakes", "casserole", "porridge",
                      "omelette", "friedEggs", "scramble"] // mock
    let titles = ["Кабачковые оладьи с лососем", "Творожная запеканка", "Каша",
                  "Омлет", "Яичница", "Скрэмбл"]
    let descriptions: [String] = ["Творожная запеканка с курагой, клубничным соусом и сметаной",
                                  "Кабачковы оладьи с слабосоленым лососем и листьями микс",
                                  "Классическая каша на молоке с маслом",
                                  "Омлет из трех яиц с зерновым хлебом",
                                  "Яичница из трех яиц с зерновым хлебом",
                                  "Скрэмбл из трех яиц с зерновым хлебом"
    ] // mock
    let prices = ["350р", "680р", "320р",
                  "400р", "400р", "400р"]//mock
    
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
        imageViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let image = imageViews[indexPath.row]
        cell.photoImageView.image = UIImage(named: image)
        cell.titleCellLabel.text = titles[indexPath.row]
        cell.descriptionCellLabel.text = descriptions[indexPath.row]
        cell.priceLabel.text = prices[indexPath.row]
        
        cell.backgroundColor = .white
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 15
        return cell
    }
}

extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.bounds.width - 12) / 2, height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
    }
}
