//
//  ContainerController.swift
//  KakaoWeather
//
//  Created by Susan Kim on 03/08/2019.
//  Copyright © 2019 Susan Kim. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {
    
    var weatherNavigationController: UIViewController!
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeatherController()
        setupSideMenuController()
    }
    
    func setupSideMenuController() {
        let sideMenuController = SideMenuController()
        sideMenuController.delegate = self
        view.insertSubview(sideMenuController.view, at: 0)
        addChild(sideMenuController)
        sideMenuController.didMove(toParent: self)
    }
    
    func setupWeatherController() {
        let weatherController = WeatherController()
        weatherController.delegate = self
        weatherNavigationController = UINavigationController(rootViewController: weatherController)
        
        view.addSubview(weatherNavigationController.view)
        addChild(weatherNavigationController)
        weatherNavigationController.didMove(toParent: self)
    }
    
    func animateSideMenuController(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.weatherNavigationController.view.frame.origin.x = self.weatherNavigationController.view.frame.width - 100
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                self.weatherNavigationController.view.frame.origin.x = 0
            }, completion: { _ in
                if let menu = menuOption {
                    self.handleMenuSelection(forMenuOption: menu)
                }
            })
        }
    }
    
    func handleMenuSelection(forMenuOption menuOption: MenuOption) {
        print(menuOption.label)
    }
}

extension ContainerController: WeatherControllerDelegate {
    func handleSideMenuToggle(forMenuOption menuOption: MenuOption?) {
        isExpanded = !isExpanded
        animateSideMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
}