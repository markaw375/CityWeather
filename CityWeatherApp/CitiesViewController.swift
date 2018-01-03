//
//  CitiesViewController.swift
//  CityWeatherApp
//
//  Created by Marcin Kawecki on 02/01/2018.
//  Copyright © 2018 Marcin Kawecki. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var cities: [City] = []
    let cellIdentifier = "cellId"
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        cities = City.AllCities()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CityTableViewCell
        
        let city = cities[indexPath.row]
        cell.cityLabel.text = city.name
        return cell
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


