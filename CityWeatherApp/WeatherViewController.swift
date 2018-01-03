//
//  WeatherViewController.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 03/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import UIKit

protocol MenuDelegate {
    func toggleMenu()
}

class WeatherViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    var delegate: MenuDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func toggleButtonAction(_ sender: UIButton) {
        delegate?.toggleMenu()
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
