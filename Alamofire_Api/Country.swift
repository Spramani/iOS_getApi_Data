//
//  Country.swift
//  Alamofire_Api
//
//  Created by MAC on 14/12/20.
//

import Foundation


struct Country: Decodable {
    var name:String?
    var capital:String?
    var countryCode:String?

    enum CountryKeys: String, CodingKey{
        case name = "name"
        case capital = "capital"
        case countryCode = "alpha3Code"
    }
}


