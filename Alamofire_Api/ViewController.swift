//
//  ViewController.swift
//  Alamofire_Api
//
//  Created by MAC on 12/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblview: UITableView!
    var countries = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let service = services(basUrl: "https://restcountries.eu/rest/v2/")
        service.GetAllCountryNameFrom(endpoint: "all")
        service.complitionHandler { [weak self] (countries, status, message) in
            if status {
                guard let self = self else {return}
                guard let _countries = countries else {return}
                self.countries = _countries
                self.tblview.reloadData()
            }
        }
        
        
        
    }
    
    
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tblview.dequeueReusableCell(withIdentifier: "countrycell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "countrycell")
        }
        let country = countries[indexPath.row]
        cell?.textLabel?.text = (country.name ?? "") + " " + (country.countryCode ?? "")
        cell?.detailTextLabel?.text = country.capital ?? ""
        return cell!
    }
    
    
}

