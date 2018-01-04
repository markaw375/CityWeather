//
//  ContainerViewController.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 03/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ContainerViewController: UIViewController {

    var centerNavigationVC : UINavigationController?
    var leftVC: CitiesViewController?
    
    enum MenuState {
        case menuOpened
        case menuClosed
    }
    
    var currentMenuState: MenuState = .menuClosed {
        didSet {
            let shouldShowShadow = (currentMenuState != .menuClosed)
            setShadowForCenterVC(shouldShowShadow: shouldShowShadow)
        }
    }
    
    let expandOffset: CGFloat = 50.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let centerVC = UIStoryboard.weatherViewController()
        centerVC?.delegate = self
        centerNavigationVC = UINavigationController.init(rootViewController: centerVC!)
        centerNavigationVC?.navigationBar.isHidden = true
        self.view.addSubview((centerNavigationVC?.view)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func downloadWeatherForCity(name: String) {
      
        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?q=\(name)&appid=6ad546d5484999ef8d3e2cb183ec8165").responseJSON { response in
//            print("Request: \(String(describing: response.request))")   // original url request
//            print("Response: \(String(describing: response.response))") // http url response
//            print("Result: \(response.result)")                         // response serialization result

            if let json = response.result.value {
//                print("JSON: \(json)") // serialized json response
                let swiftyJson = JSON(json)
                if let main = swiftyJson["weather"][0]["main"].string {
                    //Now you got your value
                    print(main)
                }
            }
        }
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


extension ContainerViewController : MenuDelegate, CitiesVCDelegate {
    
    func toggleMenu() {
        let notAlreadyExpanded: Bool = (currentMenuState != .menuOpened)
        if notAlreadyExpanded {
            leftVC = UIStoryboard.citiesViewController()
            leftVC?.delegate = self
            self.view.insertSubview((leftVC?.view)!, at: 0)
            self.addChildViewController(leftVC!)
        }
        
        animateLeftPanel(shouldExpand: notAlreadyExpanded)
        
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        if shouldExpand {
            currentMenuState = .menuOpened
            animateCenterViewControllerXPosition(targetPosition: ((centerNavigationVC?.view.frame.size.width)! - expandOffset))
        } else {
            animateCenterViewControllerXPosition(targetPosition: 0) { finished in
                self.currentMenuState = .menuClosed
                self.leftVC?.view.removeFromSuperview()
                self.leftVC = nil
            }
        }
    }
    
    func animateCenterViewControllerXPosition(targetPosition: CGFloat, completion:((Bool)->())? = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.centerNavigationVC?.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    func setShadowForCenterVC(shouldShowShadow: Bool) {
        if shouldShowShadow {
            self.centerNavigationVC?.view.layer.shadowOpacity = 0.8
        } else {
            self.centerNavigationVC?.view.layer.shadowOpacity = 0
        }
    }
    
    func citySelected(name: String) {
        toggleMenu()
        downloadWeatherForCity(name: name)
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
