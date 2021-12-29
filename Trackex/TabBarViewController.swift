//
//  TabBarViewController.swift
//  Trackex
//
//  Created by Gustavo rodrigues on 2021/12/28.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutOfPage()
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        // make the nav bar disappear
//        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    
    private func layoutOfPage(){
        // make unselected icons dark grey
        self.tabBar.unselectedItemTintColor = UIColor.darkGray
        // Hiding back button
        self.navigationItem.setHidesBackButton(true, animated: true)
        // setting the title for each tab
//        self.navigationItem.title = tabBar.selectedItem?.title

    }
 

}
