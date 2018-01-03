//
//  ContainerViewController.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 03/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var centerNavigationVC : UINavigationController?
    var leftVC: CitiesViewController?
    
    enum MenuState {
        case menuOpened
        case menuClosed
    }
    
    var currentMenuState: MenuState = .menuClosed
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let centerVC = WeatherViewController()
        centerVC.delegate = self
        centerNavigationVC = UINavigationController.init(rootViewController: centerVC)
        self.view.addSubview((centerNavigationVC?.view)!)
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}


extension ContainerViewController : MenuDelegate {
    
    func toggleMenu() {
        let isMenuOpened: Bool = (currentMenuState != .menuClosed)
        if !isMenuOpened {
            leftVC = UIStoryboard.weatherViewController()
            self.view.addSubview(leftVC?.view)
            self.addChildViewController(leftVC?.view)
        }
    }
}

extension UIStoryboard {
    
    static func mainStoryboard() -> UIStoryboard {
        return UIStoryboard.init(name: "Main", bundle: nil)
    }
    
    static func citiesViewController() -> CitiesViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "citiesVC") as? CitiesViewController
    }
    
    static func weatherViewController() -> WeatherViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "weatherVC") as? WeatherViewController
    }
}
