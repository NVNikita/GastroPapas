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
        let deliveryVC = DeliveryViewController()
        let contactsVC = ContactsViewController()
        
        let menuNavController = UINavigationController(rootViewController: menuVC)
        
        menuNavController.tabBarItem = UITabBarItem(
            title: "Меню",
            image: UIImage(systemName: "fork.knife"),
            selectedImage: nil
        )
        
        deliveryVC.tabBarItem = UITabBarItem(
            title: "Доставка",
            image: UIImage(systemName: "moped"),
            selectedImage: nil
        )
        
        contactsVC.tabBarItem = UITabBarItem(
            title: "Бронь",
            image: UIImage(systemName: "phone"),
            selectedImage: nil
        )
        
        self.viewControllers = [menuNavController, deliveryVC, contactsVC]
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.borderWidth = 0.3
    }
}
