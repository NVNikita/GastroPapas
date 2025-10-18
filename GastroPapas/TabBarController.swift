//
//  TabBarController.swift
//  GastroPapas
//
//  Created by Никита Нагорный on 26.09.2025.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuVC = MenuViewController()
        let contactsVC = ContactsViewController()
        let orderBasket = OrderBasketViewController()
        
        let menuNavController = UINavigationController(rootViewController: menuVC)
        
        menuNavController.tabBarItem = UITabBarItem(
            title: "Меню",
            image: UIImage(systemName: "fork.knife"),
            selectedImage: nil
        )
        
        contactsVC.tabBarItem = UITabBarItem(
            title: "Контакты",
            image: UIImage(systemName: "phone"),
            selectedImage: nil
        )
        
        orderBasket.tabBarItem = UITabBarItem(
            title: "Корзина",
            image: UIImage(systemName: "basket"),
            selectedImage: nil
        )
        
        self.viewControllers = [menuNavController, contactsVC, orderBasket]
        self.tabBar.layer.masksToBounds = true
        self.tabBar.tintColor = .white
        self.tabBar.layer.borderWidth = 0.3
    }
}
